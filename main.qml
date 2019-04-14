import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5


Window {
    id: win
    visible: true
    width: 640
    height: 480
    title: qsTr("MEGALAULUILTAMA BUMTSIBUM!")
    color: "#990033"

    Row {
        id: cardRow
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height*0.6

        property bool empty: wb.empty

        Keyboard {}

        Card {
            id: card0
            cardNumber: 0
        }
        Card {
            id: card1
            cardNumber: 1
        }
        Card {
            id: card2
            cardNumber: 2
        }
        Card {
            id: card3
            cardNumber: 3
        }
        Card {
            id: card4
            cardNumber: 4
        }
    }

    Rectangle {
        id: botttomRect
        width: parent.width
        height: parent.height-cardRow.height
        anchors.top: cardRow.bottom
        color: "#990033"

        Label {
            id: buttons
            anchors.top: parent.top
            anchors.left: parent.left
            font.pixelSize: parent.height * .05
            text: qsTr("Kontrollit:
1-5 (tai hiiri):
R/C:
N:
Ctrl+q:")
            color: "black"
        }

        Label {
            id: buttonFunctions
            anchors.top: parent.top
            anchors.left: buttons.right
            anchors.leftMargin: 15
            font.pixelSize: parent.height * .05
            text: qsTr("\nTogglettaa kortin tilaa (auki/kiinni)
Piilottaa kortit (ei vaihda kortteja)
Piilottaa ja vaihtaa kortit + arpoo uudet värit
Quit")
            color: "black"
        }

        Label {
            id: nametag
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: parent.height * .2
            text: qsTr("Megalauluiltama BumtsiBum!
              22.04.2019")
            color: "black"
        }

    }


    Dialog {
        id: endDialog
        title: qsTr("RIP")
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        modal: true
        standardButtons: Dialog.Ok
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        onAccepted: Qt.quit();

        Text {
            text: "You ran out of words, press ok to exit program."

            style: Text.Sunken
        }
    }
}
