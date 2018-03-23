import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: root
    property string questToText: ""

    signal butClicked(int time);
    signal back();

//    Component.onCompleted: input.forceActiveFocus();

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 30

        Text {
            id: questTo
            text: "Spørgsmål til " + questToText;
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: "Hvor hurtigt kan Hans bunde en bajer?";
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            id: guide
            text: "Skriv antal sekunder angivet i heltal";
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        RowLayout {
            spacing: 30
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                radius: 2
                color: "lightgrey"
                Layout.preferredWidth: 100
                Layout.preferredHeight: 30

                TextInput {
                    id: input
                    anchors.centerIn: parent
                    focus: true
                    text: "x"

                }
            }

            Button {
                Layout.preferredWidth: 100
                text: "OK";
                onClicked: {
                    if (!isNaN(input.text)) {
                        guide.text = "Skriv antal sekunder angivet i heltal";
                        butClicked(parseInt(input.text));
                        input.text = "x"
                        input.focus = true;
                    } else {
                        guide.text = "Skriv antal sekunder angivet i heltal, din idiot!";
                    }
                }
            }
        }

        Button {
            Layout.preferredWidth: 100
            text: "Tilbage"
            onClicked: root.back();
        }
    }

}
