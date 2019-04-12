import QtQuick 2.0

Rectangle {
    id: cardRoot

    enum TColor {
        Black,
        Red
    }

    property alias text: word.text
    property bool open: false
    property int cardNumber: 0
    property int textColor: wb.colors[cardNumber]
    width: parent.width*0.2
    height: parent.height*0.8
    color: "white"
    border.color: "black"
    border.width: 5
    radius: 10

    Text {
        id: word
        text: "tarhapöllö"
        anchors.centerIn: parent
        font.pixelSize: parent.height * .05
        style: Text.Sunken
        color: {
            switch (textColor) {
            case Card.TColor.Black: "black";
                break;
            case Card.TColor.Red: "red";
                break;
            default: "black";
            }
        }

        styleColor: "black"
        visible: open ? true : false
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: { parent.open = true }
    }

    Keys.onPressed: { if (event.key === Qt.Key_Enter) console.log("enter");}
}
