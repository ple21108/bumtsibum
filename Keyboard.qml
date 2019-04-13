import QtQuick 2.12

Item {

    function hideCards() {
        card0.open = false;
        card1.open = false;
        card2.open = false;
        card3.open = false;
        card4.open = false;
    }

    function flipCard(c) {
        c.open = !c.open;
    }



    Shortcut {
        sequence: StandardKey.Quit
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }

    focus: true
    Keys.onPressed: {
        switch (event.key) {
        case Qt.Key_1:
            flipCard(card0); break;
        case Qt.Key_2:
            flipCard(card1); break;
        case Qt.Key_3:
            flipCard(card2); break;
        case Qt.Key_4:
            flipCard(card3); break;
        case Qt.Key_5:
            flipCard(card4); break;

        case Qt.Key_R:
        case Qt.Key_C:
            hideCards();
            break;

        case Qt.Key_N:
            hideCards();
            if (!wb.changeWords()) {
                endDialog.open();
            }
            wb.changeColors();
            break;
        default:
        }
        event.accepted = true;
    }
}
