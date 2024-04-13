import QtQuick 2.12

Item {

    function hideCards() {
        setCards(false);
    }

    function showCards() {
        setCards(true);
    }

    function setCards(state) {
        card0.open = state;
        card1.open = state;
        card2.open = state;
        card3.open = state;
        card4.open = state;
        logCardStates();
    }

    function flipCard(c) {
        c.open = !c.open;
        logCardStates();
    }

    function logCardStates() {
        console.log("Card states: " + (card0.open ? 1 : 0) + " " + (card1.open ? 1 : 0) + " " + (card2.open ? 1 : 0) + " " + (card3.open ? 1 : 0) + " " + (card4.open ? 1 : 0))
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
            hideCards(); break;

        // A key shows all cards
        case Qt.Key_A:
            showCards(); break;

        // N key hides the cards, changes them and randomizes the colors
        case Qt.Key_N:
            hideCards();
            if (!wb.changeWords()) {
                endDialog.open(); // When no more cards, exit with dialog
                endDialogText.forceActiveFocus();
            }
            wb.changeColors();
            console.log("Rounds left: " + wb.size);
            break;
        default:
        }
        event.accepted = true;
    }
}
