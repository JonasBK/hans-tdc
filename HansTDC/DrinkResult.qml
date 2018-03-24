import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: root
    property var names: ["name1", "name2", "name3", "name4", "name5"];
    property var times: [0, 0, 0, 0, 0];
    property var diffs: [0, 0, 0, 0, 0];
    property var subRoundWinners: [false, false, false, false, false];
    property var score: [0, 0, 0, 0, 0];

    signal next();

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "Hans' drikketid";
            font.pointSize: 20
        }

        RowLayout {
            spacing: 20

            Text {
                Layout.preferredWidth: 240
                text: "Deltager:"
            }
            Text {
                Layout.preferredWidth: 100
                text: "Tid/Gæt:"
            }
            Text {
                Layout.preferredWidth: 100
                text: "Tidsdiff:"
            }
            Text {
                Layout.preferredWidth: 150
                text: "Resultat:"
            }
            Text {
                text: "Score:"
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
                    Layout.preferredWidth: 100
                    text: times[index];
                }

                Text {
                    Layout.preferredWidth: 100
                    text: index == 0 ? "" : diffs[index];
                }

                Text {
                    Layout.preferredWidth: 150
                    text: index == 0 ? "" : root.subRoundWinners[index] ? "+1 point" : "Drik 3 tåre"
                }

                Text {
                    text: index == 0 ? "" : root.score[index];
                }
            }
        }

        Button {
            text: "Næste"
            onClicked: next();
        }
    }
}

