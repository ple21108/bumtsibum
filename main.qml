import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("MEGALAULUILTAMA BUMTSIBUM!")

    Row {
        anchors.fill: parent

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
}
