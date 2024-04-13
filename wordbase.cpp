#include "wordbase.hh"
#include <fstream>
#include <iostream>
#include <QtGlobal>
#include <QDebug>

WordBase::WordBase(QObject *parent) : QObject(parent)
{
    initialized_ = false;
    colors_ = DEFAULT_COLORS;
}

WordBase::~WordBase()
{

}

/*
WordBase::WordBase(std::string const& filename)
{
    WordBase();
    readWords(filename);
}
*/

bool WordBase::addFiles(std::deque<std::string> const& files)
{
    wordFiles_ = files;
    fileIndex_ = 0;
    return readNextWords();
}

bool WordBase::readNextWords()
{
    if (wordFiles_.size() > 0) {
        wordBase_ = std::deque<QVector<QString>>();
        std::cout << "New game" << std::endl;
        if (readWords(wordFiles_.front())) {
            wordFiles_.pop_front();
            emit wordsChanged();
            return true;
        }
    }
    return false;
}

bool WordBase::readWords(std::string const& filename)
{
    std::ifstream file(filename);
    std::string line;

    while (std::getline(file, line)) {
        QVector<QString> splitted = splitLine(line);
        wordBase_.push_back(splitted);
    }

    file.close();
    initialized_ = true;
    qDebug() << "Total rounds: " << wordBase_.size();
    qDebug() << currentWords();
    return true;
}

bool WordBase::isEmpty() const
{
    return this->size() == 0;
}

size_t WordBase::size() const
{
    return wordBase_.size();
}

QVector<int> WordBase::currentColors() const
{
    return colors_;
}

QVector<QString> WordBase::currentWords() const
{
    return wordBase_.front();
}

void WordBase::changeColors()
{
    QVector<int> newColors = DEFAULT_COLORS;
    int i = 0;
    while (!newColors.empty()) {
        int index = rand() % newColors.size();
        colors_[i] = newColors.at(index);
        newColors.remove(index);
        i++;
    }
    emit colorsChanged();
    qDebug() << "Colours (1=red):" << currentColors();
    return;
}

bool WordBase::changeWords()
{
    wordBase_.pop_front();
    if (wordBase_.empty()) {
        if (wordFiles_.empty()) {
            std::cout << "No words in database." << std::endl;
            emit emptied();
        }
        return false;
    }
    //int index = rand() % wordBase_.size();
    emit wordsChanged();
    qDebug() << currentWords();
    return true;
}

QVector<QString> WordBase::splitLine(std::string& line)
{
    QVector<QString> ret;
    std::string delimiter = " ";
    size_t pos = 0;
    std::string token;

    trimLine(line); // Remove whitespace from beginning and end

    while ((pos = line.find(delimiter)) != std::string::npos) {
        token = line.substr(0, pos);
        ret.push_back(QString::fromStdString(token));
        line.erase(0, pos + delimiter.length());
    }
    ret.push_back(QString::fromStdString(line));
    if (ret.size() != CARD_COUNT) {
        throw;
    }
    return ret;
}

void WordBase::trimLine(std::string &line)
{
    size_t first_not_ws = line.find_first_not_of(' ');
    line.erase(0, first_not_ws);
    size_t last_not_ws = line.find_last_not_of(' ');
    line.erase(last_not_ws+1, line.size()-last_not_ws);
    return;
}

