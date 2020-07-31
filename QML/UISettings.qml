import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: topItem
    anchors.fill: parent

    HeadingText {
        text: qsTr("UI SETTINGS")
    }

    Rectangle {
        id: whiteBacgroundRectangle
        color: GlobalValues.colorWhite
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width * 0.95
        height: parent.height * 0.8
        radius: GlobalValues.whiteBacgroundRectangleRadius
    }

    DropShadow {
        anchors.fill: whiteBacgroundRectangle
        horizontalOffset: 4
        verticalOffset: 4
        radius: 6.0
        samples: 10
        color: "#40000000"
        source: whiteBacgroundRectangle
    }
}
