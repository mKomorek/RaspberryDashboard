import QtQuick 2.12

Rectangle {
    width: parent.width - 20
    height: parent.height * 0.005
    anchors.horizontalCenter: parent.horizontalCenter
    radius: 100

    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: GlobalValues.colorBackground }
        GradientStop { position: 0.5; color: GlobalValues.hmi_typeOfRideModeColor}
        GradientStop { position: 1.0; color: GlobalValues.colorBackground }
    }
}
