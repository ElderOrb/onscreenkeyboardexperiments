import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Item {
    id: root
    objectName: "container"
    width: 800
    height: 480
    property bool raised: false;

    Rectangle {
        anchors.fill: parent
        anchors.margins: 50
        color: 'yellow'
        opacity: 0.5


        Keyboard {
            id: keyboard;
            property bool enabled: true

            anchors {
                margins: 50
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }

        MouseArea {
            anchors.fill: parent

            Flow {
                anchors.fill: parent

                TextField {
                    objectName: root.objectName + "/" + "tf1"
                }
                TextField {
                    objectName: root.objectName + "/" + "tf2"
                }
                TextField {
                    objectName: root.objectName + "/" + "tf3"
                }
                TextField {
                    objectName: root.objectName + "/" + "tf4"
                }
            }

            property int count: 0;
            onClicked: {
                console.debug('unfocusing...', ++count)
                if(root.activeFocusItem)
                    root.activeFocusItem.focus = false
            }
        }
    }
}
