#include "wordbase.hh"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    srand(time(NULL));

    WordBase wb;
    wb.readWords("words.txt");
    std::cout << "Total lines: " << wb.size() << std::endl;
    //for (int i = 0; i < 100; i++)
    wb.changeColors();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("wb", &wb);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
