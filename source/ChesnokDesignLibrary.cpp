#include "ChesnokDesignLibrary.h"

#include "Common.h"
#include "Utils.h"

#include <QDebug>
#include <QtQml/QtQml>

void ChesnokDesignLibrary::initialize( QQmlEngine *engine )
{
    if ( engine )
    {
        engine->addImportPath( "qrc:/ChesnokDesign" );

        static Utils utils;
        engine->rootContext()->setContextProperty( "Utils", &utils );
    }

    // clang-format off

    qmlRegisterModule("ChesnokDesign", 1, 0);

    qmlRegisterUncreatableType<ApplicationTheme::Theme>( "ApplicationTheme", 1, 0, "ThemeMode", "It's enum class" );
    qmlRegisterUncreatableType<ApplicationTheme::ColorShade>( "ApplicationTheme", 1, 0, "MainColor", "It's enum class" );

    qmlRegisterUncreatableType<ButtonStyle::ButtonColorStyle>( "ChesnokDesign", 1, 0, "ButtonColorStyle", "It's enum class" );
    qmlRegisterUncreatableType<ButtonStyle::ButtonSize>( "ChesnokDesign", 1, 0, "ButtonSize", "It's enum class" );

    qmlRegisterUncreatableType<ButtonStyle::NeumorphicButtonStyle>( "ChesnokDesign", 1, 0, "NeumorphicButtonStyle", "It's enum class" );

    qmlRegisterSingletonType( QUrl( "qrc:/ChesnokDesign/Theme.qml" ), "ChesnokDesign", 1, 0, "Theme" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Base/Button.qml" ), "ChesnokDesign", 1, 0, "Button" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Neumorphic/NeumorphicButton.qml" ), "ChesnokDesign", 1, 0, "NeumorphicButton" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Neumorphic/NeumorphicSideBar.qml" ), "ChesnokDesign", 1, 0, "NeumorphicSideBar" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Neumorphic/NeumorphicSideBarDelegate.qml" ), "ChesnokDesign", 1, 0, "NeumorphicSideBarDelegate" );

    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/SideBar.qml" ), "ChesnokDesign", 1, 0, "SideBar" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/SideBarDelegate.qml" ), "ChesnokDesign", 1, 0, "SideBarDelegate" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/ButtonIcon.qml" ), "ChesnokDesign", 1, 0, "ButtonIcon" );
    qmlRegisterType( QUrl( "qrc:/ChesnokDesign/Custom/Icon.qml" ), "ChesnokDesign", 1, 0, "Icon" );

    // clang-format on
}
