import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: root
    visible: true
    width: 840
    height: 480
    title: qsTr("Hello World")
    objectName: "root"

    Row {
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Item {
            objectName: "container"
            width: 400
            height: 480

            Keyboard {
                id: keyboard;

                property bool enabled: true
                raised: false

                anchors {
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
                        objectName: "tf1"
                    }
                    TextField {
                        objectName: "tf2"
                    }
                    TextField {
                        objectName: "tf3"
                    }
                    TextField {
                        objectName: "tf4"
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

        Item {
            objectName: "container"
            width: 400
            height: 480

            Keyboard {
                property bool enabled: true
                raised: false

                anchors {
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
                        objectName: "tf1"
                    }
                    TextField {
                        objectName: "tf2"
                    }
                    TextField {
                        objectName: "tf3"
                    }
                    TextField {
                        objectName: "tf4"
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
}
