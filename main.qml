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

    VirtualKeyboard {
        id: vk
        parent: null
    }

    property var dialogBuilder: Component {
        Dialog {
            id: dialog
            width: 500
            height: 480

            contentItem: Rectangle {
                color: 'green'
                width: dialog.width
                height: dialog.height

                MyComponent {
                    objectName: "dialog"
                }
            }

            onVisibleChanged: {
                if(!visible) {
                    console.debug('destruction request.. ');
                    dialog.destroy();
                }
            }

            Component.onDestruction: {
                console.debug('destruction.. ');
            }

            standardButtons: Dialog.Ok
        }
    }

    Row {
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        MyComponent {
        }

        MyComponent {
        }

        Button {
            focusPolicy: "NoFocus"
            onClicked: {
                var d = dialogBuilder.createObject(parent);
                d.x = (root.width - d.width) / 2;
                d.y = (root.height - d.height) / 2;
                d.open();
            }
        }

    }
}
