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

        Keyboard {
            id: kb
        }

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
        id: bottomRect
        width: parent.width
        height: parent.height-cardRow.height
        anchors.top: cardRow.bottom
        color: "#990033"

        Label {
            id: nametag
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: parent.height * .2
            text: qsTr("Megalauluiltama BumtsiBum!")
            color: "white"
        }
    }

    Dialog {
        id: endDialog
        title: qsTr("IT'S OVER")
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        modal: true

        standardButtons: Dialog.Ok | Dialog.Close
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        onRejected: Qt.quit();
        onAccepted: wb.readNextWords() ? {} : Qt.quit();

        Text {
            id: endDialogText
            text: wb.empty ? "That's all folks!" : "End of game, press ok to start next game.";
            //focus: true
            Keys.onPressed: {
                switch (event.key) {
                case Qt.Key_N:
                case Qt.Key_Return:
                    endDialogText.focus = false;
                    endDialog.focus = false;
                    kb.forceActiveFocus();
                    endDialog.accept();
                    break;
                default:
                }
                event.accepted = true;
            }
            style: Text.Sunken
        }
    }
}
