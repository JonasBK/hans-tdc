import QtQuick 2.7
import QtQuick.Controls 2.0
//import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 1240
    height: 880
    title: qsTr("Gæt hvad Kaptajn Biceps tænker!")

    property int underState: 0
    property var names: ["Hans", "Sune", "Jonas", "Laust", "Andreas"];
    property var score: [0, 0, 0, 0, 0];

    property var selected: [0, 0, 0, 0, 0];
    property var subRoundWinners: [false, false, false, false, false];

    property var times: [0, 0, 0, 0, 0];
    property var timeDiffs: [0, 0, 0, 0, 0];

    property string winner: ""

    function handleButClick(next, butNr) {
        selected[underState] = butNr;
        if (underState != 0 && selected[0] === butNr) {
            score[underState]++;
            subRoundWinners[underState] = true;
        }

        if (underState < names.length - 1) {
            underState++;

        } else {
            subRes1.selected = root.selected;
            subRes1.score = root.score;
            subRes1.subRoundWinners = root.subRoundWinners;
            subRes2.selected = root.selected;
            subRes2.score = root.score;
            subRes2.subRoundWinners = root.subRoundWinners;
            subRes3.selected = root.selected;
            subRes3.score = root.score;
            subRes3.subRoundWinners = root.subRoundWinners;
            subRes4.selected = root.selected;
            subRes4.score = root.score;
            subRes4.subRoundWinners = root.subRoundWinners;
            subRes5.selected = root.selected;
            subRes5.score = root.score;
            subRes5.subRoundWinners = root.subRoundWinners;

            underState = 0;
            subRoundWinners = [false, false, false, false];
            view.setCurrentIndex(next);
        }
    }

    function indexOfMax(arr) {
        if (arr.length === 0) {
            return -1;
        }

        var max = arr[0];
        var maxIndex = 0;

        for (var i = 1; i < arr.length; i++) {
            if (arr[i] > max) {
                maxIndex = i;
                max = arr[i];
            }
        }

        return maxIndex;
    }

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 10
//        interactive: false

        Question4Answers {
            id: quest1
            questToText: names[underState];
            questText: "Hvad synes du om Amnesty?"
            answers: ["Fedt TV-show", "Jeg burde blive medlem", "Skide humanister", "erh.."];
            onButClicked: handleButClick(1, nr);
            onBack: underState === 0 ? view.setCurrentIndex(0) : underState--;
        }

        SubResult {
            id: subRes1
            names: root.names;
            question: quest1.questText
            answers: quest1.answers;
            onNext: view.setCurrentIndex(2);
        }

        Question4Answers {
            id: quest2
            questToText: names[underState];
            questText: "Hvilket dyr har den sejeste gangart?"
            answers: ["Bjørnen", "Dovendyret", "Tigeren", "Pingvinen"];
            onButClicked: handleButClick(3, nr);
            onBack: underState === 0 ? view.setCurrentIndex(1) : underState--;
        }

        SubResult {
            id: subRes2
            names: root.names;
            question: quest2.questText
            answers: quest2.answers;
            onNext: view.setCurrentIndex(4);
        }

        Question4Answers {
            id: quest3
            questToText: names[underState];
            questText: "Hvem burde være præsident i USA?"
            answers: ["Donald Trump", "Chuck Norris", "Britney Spears", "Elon Musk"];
            onButClicked: handleButClick(5, nr);
            onBack: underState === 0 ? view.setCurrentIndex(3) : underState--;
        }

        SubResult {
            id: subRes3
            names: root.names;
            question: quest3.questText
            answers: quest3.answers;
            onNext: view.setCurrentIndex(6);
        }

        Question4Answers {
            id: quest4
            questToText: names[underState];
            questText: "Hvad er kroppens vigtigste muskel?"
            answers: ["Ringmusklen", "Tungen", "Læggen", "Biceps"];
            onButClicked: handleButClick(7, nr);
            onBack: underState === 0 ? view.setCurrentIndex(5) : underState--;
        }

        SubResult {
            id: subRes4
            names: root.names;
            question: quest4.questText
            answers: quest4.answers;
            onNext: view.setCurrentIndex(8);
        }

        Question4Answers {
            id: quest5
            questToText: names[underState];
            questText: "Hvem fra HTX er mest attraktiv?"
            answers: ["Malene fra B-klassen", "Astrid fra vores klasse", "Søren fra vores klasse", "Pernille fra B-klassen"];
            onButClicked: handleButClick(9, nr);
            onBack: underState === 0 ? view.setCurrentIndex(7) : underState--;
        }

        SubResult {
            id: subRes5
            names: root.names;
            question: quest5.questText
            answers: quest5.answers;
            onNext: view.setCurrentIndex(10);
        }

        QuestionDrinkBeer {
            questToText: underState > 3 ? "" : names[underState + 1];
            onBack: underState === 0 ? view.setCurrentIndex(9) : underState--;
            onButClicked: {
                root.times[underState + 1] = time;
                if (underState < 3) {
                    underState++;
                } else {
                    view.setCurrentIndex(11);
                }
            }
        }

        DrinkBeer {
            onResult: {
                root.times[0] = res;

                var minDiff = 100000;
                for (var i = 1; i < 5; i++) {
                    root.timeDiffs[i] = Math.abs(root.times[i] - root.times[0]);
                    minDiff = Math.min(minDiff, root.timeDiffs[i]);
                }

                for (i = 1; i < 5; i++) {
                    if (root.timeDiffs[i] === minDiff) {
                        root.score[i]++;
                        root.subRoundWinners[i] = true;
                    }
                }
                drinkRes.subRoundWinners = root.subRoundWinners;
                drinkRes.diffs = root.timeDiffs;
                drinkRes.times = root.times;
                drinkRes.score = root.score;

                view.setCurrentIndex(12);
            }
        }

        DrinkResult {
            id: drinkRes
            names: root.names;
            onNext: {
                root.winner = names[indexOfMax(score)];
                winnerText.text = root.winner + " har vundet!"
                winnerPic.source = "pics/" + root.winner + ".png"
                view.setCurrentIndex(13);
            }
        }

        Rectangle {
            ColumnLayout {
                spacing: 15
                anchors.centerIn: parent

                Text {
                    id: winnerText
                    font.pointSize: 14
                }
                Image {
                    id: winnerPic
                    Layout.preferredHeight: 500
                    Layout.preferredWidth: 500
                }
            }
        }
    }

    Rectangle {
        id: welcome
        anchors.fill: parent

        ColumnLayout {
            spacing: 15
            anchors.centerIn: parent

            Text {
                text: "Velkommen til"
                font.pointSize: 14
            }
            Text {
                text: "Gæt hvad Kaptajn Biceps tænker!"
                font.pointSize: 20
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: welcome.visible = false;
        }
    }
}
