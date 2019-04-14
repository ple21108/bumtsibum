import QtQuick 2.12

Rectangle {
    id: cardRoot

    enum BgColor {
        Blue,
        Red
    }

    property alias text: word.text
    property bool open: false
    property int cardNumber: 0
    property int backColor: wb.colors[cardNumber]

    width: parent.width*0.2
    height: parent.height
    color: {
        switch (backColor) {
        case Card.BgColor.Blue: "blue";
            break;
        case Card.BgColor.Red: open ? "#cc3333" : "blue";
            break;
        default: "blue";
        }
    }
    border.color: "black"
    border.width: 5
    radius: 10

    Text {
        id: word
        text: wb.words[cardRoot.cardNumber]
        anchors.centerIn: parent
        font.pixelSize: parent.height * .09
        style: Text.Sunken
        color: "white"
        styleColor: "black"
        visible: open ? true : false
    }

    Text {
        id: numberText
        text: cardNumber + 1
        anchors.centerIn: parent
        font.pixelSize: parent.height * .2
        style: Text.Sunken
        color: "white"
        styleColor: "black"
        visible: open ? false : true
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: { parent.open = !parent.open }
    }
}
