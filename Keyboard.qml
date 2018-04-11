import QtQuick 2.0

Rectangle {
    objectName: "keyboard"
    color: 'green'
    opacity: 0.5

    onWidthChanged: {
        console.debug('k width: ', width)
    }
    onHeightChanged: {
        console.debug('k height: ', height)
    }

    property bool raised;
    onRaisedChanged: {
        console.debug('onRaisedChanged: ', raised);
    }

    onChildrenChanged: {
        console.debug(parent.objectName)
    }

    Component.onCompleted: {
    }
}
