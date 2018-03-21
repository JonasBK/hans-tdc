import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 1240
    height: 880
    title: qsTr("Gæt hvad Kaptajn Biceps tænker!")

    property int suneScore: 0
    property int jonasScore: 0
    property int laustScore: 0
    property int andreasScore: 0

    property int underState: 0

    property var names: ["Hans", "Sune", "Jonas", "Laust", "Andreas"];

    function handleButClick(i) {
        if (underState < names.length - 1) {
            underState++;
        } else {
            underState = 0;
            view.setCurrentIndex(i);
        }
    }

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0

        Question4Answers {
            questToText: names[underState];
            questText: "Hvad synes du om Amnesty?"
            button1.text: "Fedt TV-show"
            button2.text: "Jeg burde blive medlem"
            button3.text: "Skide humanister"
            button4.text: "erh.."
            onButClicked: handleButClick(1);
        }

        Question4Answers {
            questToText: names[underState];
            questText: "Hvilket dyr har den sejeste gangart?"
            button1.text: "Bjørnen"
            button2.text: "Dovendyret"
            button3.text: "Tigeren"
            button4.text: "Pingvinen"
            onButClicked: handleButClick(2);
        }

        Question4Answers {
            questToText: names[underState];
            questText: "Hvem burde være præsident i USA?"
            button1.text: "Donald Trump"
            button2.text: "Chuck Norris"
            button3.text: "Britney Spears"
            button4.text: "Elon Musk"
            onButClicked: handleButClick(3);
        }

        Question4Answers {
            questToText: names[underState];
            questText: "Hvad er kroppens vigtigste muskel?"
            button1.text: "Ringmusklen"
            button2.text: "Tungen"
            button3.text: "Læggen"
            button4.text: "Biceps"
            onButClicked: handleButClick(3);
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
