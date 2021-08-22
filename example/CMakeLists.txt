cmake_minimum_required(VERSION 3.7)

set(TARGET_NAME ChesnokDesignExample)

find_package(Qt5 REQUIRED COMPONENTS Core Quick Qml QuickControls2)

file( GLOB_RECURSE SOURCES "*.h" "*.cpp" "*.qrc" )

add_executable(${TARGET_NAME} ${SOURCES})

target_link_libraries(${TARGET_NAME} PRIVATE
    Qt5::Core
    Qt5::Quick
    Qt5::Qml
    Qt5::QuickControls2
)

target_link_libraries(${TARGET_NAME} PRIVATE ChesnokDesign)
