import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

Item {
    property double startTime: 0

    signal result(int res);

    Timer {
        id: timer
        interval: 500;
        repeat: true;
        onTriggered: time.text = Math.round((new Date().getTime() - startTime) / 1000) + " s";
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 30

        Text {
            text: "Hans, kast den bajer i nakken!!"
            font.pointSize: 16
        }

        Button {
            text: "Start"
            Layout.alignment: Qt.AlignCenter

            onClicked: {
                if (!timer.running) {
                    next.visible = false;
                    text = "Stop"
                    timer.start()
                    startTime = new Date().getTime()
                } else {
                    next.visible = true;
                    timer.stop()
                    text = "Start"
                }
            }
        }

        Text {
            id: time
            font.pixelSize: 30
            text: "0 s"
            Layout.alignment: Qt.AlignCenter
        }

        Button {
            id: next
            visible: false
            text: "Næste"
            onClicked: result(parseInt(time.text));
        }
    }
}
