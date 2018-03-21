import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: root

    property string questToText: ""

    property alias questLabel: questLabel.text

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
            text: qsTr("Question")
            anchors.horizontalCenter: parent.horizontalCenter
        }

        RowLayout {
            spacing: 10

            Button {
                id: button1
                text: qsTr("Press Me 1")
                onClicked: butClicked(1);
            }

            Button {
                id: button2
                text: qsTr("Press Me 2")
                onClicked: butClicked(2);
            }
        }
        RowLayout {
            spacing: 10

            Button {
                id: button3
                text: qsTr("Press Me 1")
                onClicked: butClicked(3);
            }

            Button {
                id: button4
                text: qsTr("Press Me 2")
                onClicked: butClicked(4);
            }
        }
    }
}

