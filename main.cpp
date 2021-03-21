#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


#include "database.h"
#include "imagelist.h"
//#include "listmodel.h"



int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);


    database database;
    database.connectToDataBase();

    //ListModel *model = new ListModel();
    ImageList list_of_tasks;
    QQmlApplicationEngine engine;
    //engine.rootContext()->setContextProperty("myModel", model);
    engine.rootContext()->setContextProperty("database", &database);
    engine.rootContext()->setContextProperty("list_of_tasks", &list_of_tasks);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);



    engine.load(url);
    return app.exec();
}


