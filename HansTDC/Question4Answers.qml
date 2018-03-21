import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: root
    property alias button1: button1
    property alias button2: button2
    property alias button3: button3
    property alias button4: button4

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
                id: button1
                Layout.preferredWidth: 200
                text: qsTr("Press Me 1")
                onClicked: butClicked(1);
            }

            Button {
                id: button2
                Layout.preferredWidth: 200
                text: qsTr("Press Me 2")
                onClicked: butClicked(2);
            }
        }
        RowLayout {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                id: button3
                Layout.preferredWidth: 200
                text: qsTr("Press Me 1")
                onClicked: butClicked(3);
            }

            Button {
                id: button4
                Layout.preferredWidth: 200
                text: qsTr("Press Me 2")
                onClicked: butClicked(4);
            }
        }
    }
}

