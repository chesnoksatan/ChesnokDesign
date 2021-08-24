#include "ChesnokDesignLibrary.h"

#include "Common.h"
#include "Utils.h"

#include <QDebug>
#include <QtQml/QtQml>

void ChesnokDesignLibrary::initialize( QQmlEngine *engine, const char *uri )
{
    if ( engine )
    {
        engine->addImportPath( "qrc:/ChesnokDesign" );

        static Utils utils;
        engine->rootContext()->setContextProperty( "Utils", &utils );
    }

    // clang-format off

    qmlRegisterModule(uri, 1, 0);

    qmlRegisterUncreatableType<ApplicationTheme::Theme>( "ApplicationTheme", 1, 0, "ThemeMode", "It's enum class" );
    qmlRegisterUncreatableType<ApplicationTheme::ColorShade>( "ApplicationTheme", 1, 0, "MainColor", "It's enum class" );

    qmlRegisterUncreatableType<ButtonStyle::ButtonColorStyle>( "ButtonStyle", 1, 0, "ButtonColorStyle", "It's enum class" );
    qmlRegisterUncreatableType<ButtonStyle::ButtonSize>( "ButtonStyle", 1, 0, "ButtonSize", "It's enum class" );

    qmlRegisterUncreatableType<ButtonStyle::NeumorphicButtonStyle>( "NeumorphicStyle", 1, 0, "NeumorphicButtonStyle", "It's enum class" );

    qmlRegisterSingletonType( QUrl( "qrc:/ChesnokDesign/Theme.qml" ), uri, 1, 0, "Theme" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Base/Button.qml" ), uri, 1, 0, "Button" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Neumorphic/NeumorphicButton.qml" ), uri, 1, 0, "NeumorphicButton" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/SideBar.qml" ), uri, 1, 0, "SideBar" );

    // clang-format on
}
