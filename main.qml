import QtQuick 2.12
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("MEGALAULUILTAMA BUMTSIBUM!")


    Row {
        anchors.fill: parent
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

    Dialog {
        id: endDialog
        title: qsTr("RIP")
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        modal: true
        standardButtons: Dialog.Ok
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        onAccepted: Qt.quit();

        Label {
            text: "You ran out of words, exit program."
        }
    }
}
