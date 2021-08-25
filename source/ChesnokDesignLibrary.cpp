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

    qmlRegisterUncreatableType<ButtonStyle::ButtonColorStyle>( uri, 1, 0, "ButtonColorStyle", "It's enum class" );
    qmlRegisterUncreatableType<ButtonStyle::ButtonSize>( uri, 1, 0, "ButtonSize", "It's enum class" );

    qmlRegisterUncreatableType<ButtonStyle::NeumorphicButtonStyle>( uri, 1, 0, "NeumorphicButtonStyle", "It's enum class" );

    qmlRegisterSingletonType( QUrl( "qrc:/ChesnokDesign/Theme.qml" ), uri, 1, 0, "Theme" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Base/Button.qml" ), uri, 1, 0, "Button" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Neumorphic/NeumorphicButton.qml" ), uri, 1, 0, "NeumorphicButton" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Neumorphic/NeumorphicSideBar.qml" ), uri, 1, 0, "NeumorphicSideBar" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Neumorphic/NeumorphicSideBarDelegate.qml" ), uri, 1, 0, "NeumorphicSideBarDelegate" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/SideBar.qml" ), uri, 1, 0, "SideBar" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/SideBarDelegate.qml" ), uri, 1, 0, "SideBarDelegate" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/ButtonIcon.qml" ), uri, 1, 0, "ButtonIcon" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Icon.qml" ), uri, 1, 0, "Icon" );

    // clang-format on
}
