#ifndef WORDBASE_HH
#define WORDBASE_HH

#include <string>
#include <vector>
#include <QObject>
#include <QVector>

int const CARD_COUNT = 5;

class WordBase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<int> colors READ currentColors NOTIFY colorsChanged)
    Q_PROPERTY(QVector<QString> words READ currentWords NOTIFY wordsChanged)

public:
    explicit WordBase(QObject *parent = nullptr);
    //WordBase(QObject* parent = 0);
    //WordBase(std::string const& filename);
    ~WordBase();
    void readWords(std::string const& filename);
    int size() const;
    QVector<int> currentColors() const;
    QVector<QString> currentWords() const;
    void changeColors();
    void changeWords();

signals:
    void colorsChanged();
    void wordsChanged();

private:
    bool initialized_;
    QVector<QVector<QString>> wordBase_;
    QVector<int> colors_;

    // splits a line of words and appends it to wordbase
    QVector<QString> splitLine(std::string& line);
    void trimLine(std::string& line);
};


#endif // WORDBASE_HH
