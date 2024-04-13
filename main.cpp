#include "wordbase.hh"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <iostream>
#include <filesystem>
#include <deque>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    srand(time(NULL));

    WordBase wb;
    std::deque<std::string> wordFiles;

    std::cout << "Kontrollit:" << std::endl;
    std::cout << "1-5 (tai hiiri): togglettaa kortin tilaa (auki/kiinni)" << std::endl;
    std::cout << "R/C:             piilottaa kortit (ei vaihda kortteja)" << std::endl;
    std::cout << "N:               piilottaa ja vaihtaa kortit + arpoo uudet värit" << std::endl;
    std::cout << "A:               avaa kaikki kortit" << std::endl;
    std::cout << "Ctrl + q:        sulkee ohjelman" << std::endl;
    std::cout << std::endl;

    if (argc < 2) {
        std::cout << "Please specify at least one word file" << std::endl;
        return EXIT_FAILURE;
    }

    for (int i = 1; i < argc; i++) {
        if (std::filesystem::exists(argv[i])) {
            wordFiles.push_back(argv[i]);
        }
        else {
            std::cout << "File " << argv[i] << " does not exist" << std::endl;
            return EXIT_FAILURE;
        }
    }

    if (!wb.addFiles(wordFiles)) {
        return EXIT_FAILURE;
    }

    //for (int i = 0; i < 100; i++)
    wb.changeColors();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("wb", &wb);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
