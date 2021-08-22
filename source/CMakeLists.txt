set(TARGET_NAME ChesnokDesign)
set(BUILD_TYPE SHARED)
add_definitions(-DCHESNOK_DESIGN_BUILD)

file( GLOB_RECURSE SOURCES "*.h" "*.cpp" "*.qrc" )

add_library( ${TARGET_NAME} ${BUILD_TYPE} ${HEADERS} ${SOURCES} )

find_package(Qt5 REQUIRED COMPONENTS Quick Core Qml)

target_link_libraries(${TARGET_NAME} PRIVATE
	Qt5::Core
	Qt5::Quick
	Qt5::Qml
)

target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Собираем плагин в папку с именем плагина
set_target_properties( ${TARGET_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} )

install(TARGETS ${TARGET_NAME}
    RUNTIME DESTINATION .
    LIBRARY DESTINATION .
    ARCHIVE DESTINATION .)

# Сообщаем другим CMake модулям папку, в которой собран плагин
SET( CHESNOK_DESIGN_OUTPUT_DIR "${CMAKE_CURRENT_BINARY_DIR}" CACHE INTERNAL "Chesnok Design library build path")
# Сообщаем другим CMake модулям название цели
SET( CHESNOK_DESIGN_TARGET_NAME ${TARGET_NAME} CACHE INTERNAL "Chesnok Design library target name")
# Сообщаем другим CMake модулям название модуля QML
SET( CHESNOK_DESIGN_MODULE_NAME ${TARGET_NAME} CACHE INTERNAL "Chesnok Design qml module name")

# Регистрируем путь до QML файлов, чтобы типы корректно отображались в QtCreator
list(APPEND QML_DIRS ${CMAKE_CURRENT_SOURCE_DIR})
set(QML_IMPORT_PATH "${QML_DIRS}" CACHE STRING "Qt Creator 4.1+ extra qml import paths" FORCE)
set(QML_IMPORT_PATH2 "${QML_DIRS}" CACHE STRING "Qt Creator 4.1+ extra qml import paths" FORCE)

