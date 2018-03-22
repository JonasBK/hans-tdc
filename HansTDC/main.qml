import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 1240
    height: 880
    title: qsTr("Gæt hvad Kaptajn Biceps tænker!")

    property var selected: [0, 0, 0, 0, 0];
    property var score: [0, 0, 0, 0, 0];
    property int underState: 0

    property var names: ["Hans", "Sune", "Jonas", "Laust", "Andreas"];

    function handleButClick(next, butNr) {
        //TODO: update score
        selected[underState] = butNr;
        if (underState < names.length - 1) {
            underState++;
        } else {
            underState = 0;
            subRes.selected = root.selected;
            subRes.score = root.score;
            view.setCurrentIndex(next);
        }
    }

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0

        Question4Answers {
            id: quest1
            questToText: names[underState];
            questText: "Hvad synes du om Amnesty?"
            answers: ["Fedt TV-show", "Jeg burde blive medlem", "Skide humanister", "erh.."];
            onButClicked: handleButClick(1, nr);
        }

        SubResult {
            id: subRes
            names: root.names;
            question: quest1.questText
            answers: quest1.answers;
            onNext: view.setCurrentIndex(2);
        }

        Question4Answers {
            questToText: names[underState];
            questText: "Hvilket dyr har den sejeste gangart?"
            answers: ["Bjørnen", "Dovendyret", "Tigeren", "Pingvinen"];
            onButClicked: handleButClick(3, nr);
        }

        Question4Answers {
            questToText: names[underState];
            questText: "Hvem burde være præsident i USA?"
            answers: ["Donald Trump", "Chuck Norris", "Britney Spears", "Elon Musk"];
            onButClicked: handleButClick(4, nr);
        }

        Question4Answers {
            questToText: names[underState];
            questText: "Hvad er kroppens vigtigste muskel?"
            answers: ["Ringmusklen", "Tungen", "Læggen", "Biceps"];
            onButClicked: handleButClick(5, nr);
        }
    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: view.currentIndex
//        TabButton {
//            text: qsTr("Back")
//        }
//        TabButton {
//            text: qsTr("Next")
//        }
//    }
}
