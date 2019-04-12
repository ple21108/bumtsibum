#include "wordbase.hh"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    WordBase wb;
    wb.readWords("words.txt");
    std::cout << "Total lines: " << wb.size() << std::endl;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("wb", &wb);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
