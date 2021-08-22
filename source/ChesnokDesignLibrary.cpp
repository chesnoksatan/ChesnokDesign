#include "ChesnokDesignLibrary.h"

#include "Utils.h"
#include "Common.h"

#include <QtQml/QtQml>

#include <QDebug>

void ChesnokDesignLibrary::initialize( QQmlEngine *engine, const char *uri )
{
    if ( engine )
    {
        engine->addImportPath("qrc:/ChesnokDesign");

        static Utils utils;
        engine->rootContext()->setContextProperty( "Utils", &utils );
    }


    qmlRegisterModule(uri, 1, 0);

    qmlRegisterUncreatableType<Theme>( "ApplicationTheme", 1, 0, "ThemeMode", "It's enum class");
    qmlRegisterUncreatableType<ColorShade>( "ApplicationTheme", 1, 0, "MainColor", "It's enum class");

    qmlRegisterSingletonType(QUrl("qrc:/ChesnokDesign/Theme.qml"), uri, 1, 0, "Theme");

}
