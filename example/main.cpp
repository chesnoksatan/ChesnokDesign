#include <ChesnokDesignLibrary.h>

#include <QDateTime>
#include <QDebug>
#include <QGuiApplication>
#include <QPluginLoader>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QSettings>

QString buildDate()
{
	QDateTime time;
    time.setDate( QLocale( QLocale::C ).toDate( QString( __DATE__ ).simplified(), "MMM d yyyy" ) );
    time.setTime( QTime::fromString( QString( __TIME__ ).simplified() ) );
    return time.toString( "dd.MM.yyyy HH:mm" );
}

int main( int argc, char *argv[] )
{
    QCoreApplication::setAttribute( Qt::AA_EnableHighDpiScaling );

    QGuiApplication app( argc, argv );
	// Название организации для корректного сохранения данных в реестре
    app.setOrganizationName( "chesnoksatan" );

    QQmlApplicationEngine engine;

    ChesnokDesignLibrary::initialize( &engine, "ChesnokDesign" );

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
