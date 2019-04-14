#ifndef WORDBASE_HH
#define WORDBASE_HH

#include <string>
#include <deque>
#include <QObject>
#include <QVector>

int const CARD_COUNT = 5;
QVector<int> const DEFAULT_COLORS = {0, 1, 0, 1, 0};

class WordBase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<int> colors READ currentColors NOTIFY colorsChanged)
    Q_PROPERTY(QVector<QString> words READ currentWords NOTIFY wordsChanged)
    Q_PROPERTY(bool empty READ isEmpty NOTIFY emptied)
    Q_PROPERTY(int size READ size)

public:
    explicit WordBase(QObject *parent = nullptr);
    //WordBase(QObject* parent = 0);
    //WordBase(std::string const& filename);
    ~WordBase();
    void readWords(std::string const& filename);
    bool isEmpty() const;
    size_t size() const;
    QVector<int> currentColors() const;
    QVector<QString> currentWords() const;
    Q_INVOKABLE void changeColors();
    Q_INVOKABLE bool changeWords();

signals:
    void colorsChanged();
    void wordsChanged();
    void emptied();

private:
    bool initialized_;
    std::deque<QVector<QString>> wordBase_;
    QVector<int> colors_;

    // splits a line of words and appends it to wordbase
    QVector<QString> splitLine(std::string& line);
    void trimLine(std::string& line);
};


#endif // WORDBASE_HH
