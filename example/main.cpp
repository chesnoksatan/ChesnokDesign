#include "FileListModel.h"

#include <ChesnokDesignLibrary.h>

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>

int main( int argc, char *argv[] )
{
    QCoreApplication::setAttribute( Qt::AA_EnableHighDpiScaling );

    QGuiApplication app( argc, argv );
	// Название организации для корректного сохранения данных в реестре
    app.setOrganizationName( "chesnoksatan" );

    QQmlApplicationEngine engine;

    ChesnokDesignLibrary::initialize( &engine );
    qmlRegisterType< FileListModel >( "FileListModel", 1, 0, "FileListModel" );

    const QUrl url( QStringLiteral( "qrc:/Example/main.qml" ) );
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url]( QObject *obj, const QUrl &objUrl ) {
            if ( !obj && url == objUrl )
                QCoreApplication::exit( -1 );
        },
        Qt::QueuedConnection );

    engine.load( url );

    return app.exec();
}
