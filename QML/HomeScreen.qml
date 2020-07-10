import QtQuick 2.0

Rectangle {
    color: Constants.colorBackground
    Text {
        id: homeText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Home Screen")
    }
}
