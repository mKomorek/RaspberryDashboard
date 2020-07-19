import QtQuick 2.12
import QtQuick.Controls 2.3

ApplicationWindow {
    id: mainWindow
    visibility: ApplicationWindow.FullScreen
    visible: true
    width: GlobalValues.width
    height: GlobalValues.height
    title: qsTr("Dashboard")

    Image {
        id: backgroundImage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/LEM_logo.png"
        sourceSize.width: width
        sourceSize.height: height

        ScaleAnimator {
            target: backgroundImage
            from: 1
            to: 0.25
            duration: 2000
            running: true
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            screenManager.visible = true
        }
    }

    ScreenManager {
        id: screenManager
        anchors.fill: parent
        visible: false
    }

    Component.onCompleted: console.log("MAIN - onCompleted")
}
