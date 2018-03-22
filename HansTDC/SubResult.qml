import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: root
    property string question: ""
    property var names: ["name1", "name2", "name3", "name4", "name5"];
    property var answers: ["answer1", "answer2", "answer3", "answer4"];
    property var selected: [0, 0, 0, 0, 0];
    property var score: [0, 0, 0, 0, 0];

    signal next();

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: question;
            font.pointSize: 20
        }

        RowLayout {
            spacing: 20

            Text {
                Layout.preferredWidth: 240
                text: "Deltager:"
            }
            Text {
                Layout.preferredWidth: 200
                text: "Svar:"
            }
            Text {
                Layout.preferredWidth: 100
                text: "Score:"
            }
            Text {
                text: "Dom:"
            }
        }

        Repeater {
            model: 5

            RowLayout {
                spacing: 20

                Image {
                    Layout.preferredHeight: 120
                    Layout.preferredWidth: 120
                    source: "pics/" + root.names[index] + ".png"
                }

                Label {
                    Layout.preferredWidth: 100
                    text: root.names[index];
                }

                Text {
                    Layout.preferredWidth: 200
                    text: root.answers[root.selected[index]];
                }

                Text {
                    Layout.preferredWidth: 100
                    text: root.score[index];
                }

                Text {
                    text: ""//Add dom
                }
            }
        }

        Button {
            text: "Næste"
            onClicked: next();
        }
    }
}

