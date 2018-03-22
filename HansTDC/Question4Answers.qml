import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: root
    property var answers: ["answer1", "answer2", "answer3", "answer4"];
    property string questToText: ""
    property string questText: ""

    signal butClicked(int nr);

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        Label {
            id: questTo
            text: "Spørgsmål til " + questToText;
            anchors.horizontalCenter: parent.horizontalCenter

        }

        Label {
            id: questLabel
            text: questToText !== "Hans" ? "Hans er blevet spurgt: \"" + questText + "\"" : questText;
            anchors.horizontalCenter: parent.horizontalCenter
        }

        RowLayout {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                Layout.preferredWidth: 200
                text: answers[0];
                onClicked: butClicked(0);
            }

            Button {
                Layout.preferredWidth: 200
                text: answers[1];
                onClicked: butClicked(1);
            }
        }
        RowLayout {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                Layout.preferredWidth: 200
                text: answers[2];
                onClicked: butClicked(2);
            }

            Button {
                Layout.preferredWidth: 200
                text: answers[3];
                onClicked: butClicked(3);
            }
        }
    }
}

