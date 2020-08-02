import QtQuick 2.12

Rectangle {
    id: topRectangle
    property color backgroundColor: GlobalValues.colorBackground
    property color color: GlobalValues.hmi_typeOfRideModeColor

    width: parent.width - 20
    height: parent.height * 0.005
    anchors.horizontalCenter: parent.horizontalCenter
    radius: 100

    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: topRectangle.backgroundColor }
        GradientStop { position: 0.5; color: topRectangle.color}
        GradientStop { position: 1.0; color: topRectangle.backgroundColor }
    }
}
