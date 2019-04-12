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
    Q_PROPERTY(QVector<int> colors READ currentColors NOTIFY colorschanged)

public:
    explicit WordBase(QObject *parent = nullptr);
    //WordBase(QObject* parent = 0);
    //WordBase(std::string const& filename);
    ~WordBase();
    void readWords(std::string const& filename);
    size_t size() const;
    std::vector<std::string> currentLine() const;
    QVector<int> currentColors() const;
    void changeColors();

signals:
    void colorschanged();

private:
    bool initialized_;
    std::vector<std::vector<std::string>> wordBase_;
    QVector<int> colors_;

    // splits a line of words and appends it to wordbase
    std::vector<std::string> splitLine(std::string& line);
    void trimLine(std::string& line);
};


#endif // WORDBASE_HH
