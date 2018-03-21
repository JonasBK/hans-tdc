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

    property int overState: 0
    property int underState: 0

    property var names: ["Hans", "Sune", "Jonas", "Laust", "Andreas"];

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0

        Question4Answers {
            questLabel: "Hvad synes du om Amnesty?"
            onButClicked: view.setCurrentIndex(1);
        }

        Question4Answers {
            questLabel: "Hvilket dyr har den sejeste gangart?"
            onButClicked: view.setCurrentIndex(2);
        }

        Question4Answers {
            questLabel: "Hvem burde være præsident i USA?"
            onButClicked: view.setCurrentIndex(3);
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
