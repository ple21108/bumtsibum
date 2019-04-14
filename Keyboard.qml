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

    // Ctrl+q always quits without confirm
    Shortcut {
        sequence: StandardKey.Quit
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }

    focus: true
    Keys.onPressed: {
        switch (event.key) {
        // Number keys 1-5 toggle cards' flipping states
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

        // Keys R and C hide all the cards (doesn't change the cards)
        case Qt.Key_R:
        case Qt.Key_C:
            hideCards();
            break;

        // N key hides the cards, changes them and randomizes the colors
        case Qt.Key_N:
            hideCards();
            if (!wb.changeWords()) {
                endDialog.open(); // When no more cards, exit with dialog
            }
            wb.changeColors();
            console.log("Lines left: " + wb.size);
            break;
        default:
        }
        event.accepted = true;
    }
}
