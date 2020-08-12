import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.4
import QtGraphicalEffects 1.0

Item {
    id: topItem
    anchors.fill: parent

    HeadingText {
        id: headingText
        text: qsTr("CONNECTION SETTINGS")
    }

    Rectangle {
        id: whiteBacgroundRectangleButtons
        color: GlobalValues.colorWhite
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 50
        height: parent.height * 0.45
        radius: GlobalValues.whiteBacgroundRectangleRadius

        Column {
            id: buttonsColumn
            spacing: 15
            anchors.fill: parent
            anchors.topMargin: 10

            Button {
                id: searchButton
                height: 50
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                flat: true
                highlighted: true
                Material.background: GlobalValues.colorButton
                Material.accent: GlobalValues.colorBlack
                font.pixelSize: 18
                text: "SEARCH"
                onClicked: DeviceService.searchDevices()
            }

            ComboBox {
                id: portComboBox
                height: 50
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                model: DeviceService.portNames
            }

            Button {
                id: connectButton
                height: 50
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                flat: true
                Material.background: GlobalValues.colorGreen
                Material.accent: GlobalValues.colorBlack
                font.pixelSize: 18
                text: "CONNECT"
                onClicked: DeviceService.connectDevice(portComboBox.currentText)
            }

            Button {
                id: disconnectButton
                height: 50
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                flat: true
                highlighted: true
                Material.background: GlobalValues.colorRed
                Material.accent: GlobalValues.colorBlack
                font.pixelSize: 18
                text: "DISCONNECT"
                onClicked: DeviceService.disconectDevice()
            }
        }
    }

    DropShadow {
        anchors.fill: whiteBacgroundRectangleButtons
        horizontalOffset: 4
        verticalOffset: 4
        radius: 6.0
        samples: 10
        color: "#40000000"
        source: whiteBacgroundRectangleButtons
    }

    Rectangle {
        id: whiteBacgroundRectangleConnectInfo
        color: GlobalValues.colorWhite
        anchors.top: whiteBacgroundRectangleButtons.bottom
        anchors.left: parent.left
        anchors.right: parent.horizontalCenter
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 30
        height: parent.height * 0.33
        radius: GlobalValues.whiteBacgroundRectangleRadius

        Text {
            id: connectedInfoText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 25
            font.letterSpacing: 3
            font.pixelSize: 42
            font.weight: Font.Black
            color: DeviceService.device.isConnected === true ? GlobalValues.colorGreen : GlobalValues.colorRed
            text: DeviceService.device.isConnected === true ? "CONNECTED" : "DOSCONNECTED"
        }

        Text {
            id: connectedInfoTextDescription
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: connectedInfoText.bottom
            anchors.topMargin: 25
            width: parent.width - 80
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
            font.weight: Font.Black
            color: GlobalValues.colorBlack
            text: DeviceService.device.isConnected === true ?
                      "Everything seems to be working fine." :
                      "There was a problem trying to connect to your sensors."
        }
    }

    DropShadow {
        anchors.fill: whiteBacgroundRectangleConnectInfo
        horizontalOffset: 4
        verticalOffset: 4
        radius: 6.0
        samples: 10
        color: "#40000000"
        source: whiteBacgroundRectangleConnectInfo
    }

    Rectangle {
        id: columnSeparator
        color: "#0f000000"
        width: 2
        height: parent.height - 80
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DropShadow {
        anchors.fill: columnSeparator
        horizontalOffset: 2
        verticalOffset: 2
        radius: 6.0
        samples: 10
        color: "#ff000000"
        source: columnSeparator
    }

    ScrollView {
        id: logScrollView
        anchors.top: parent.top
        anchors.bottom: clearLogsButton.top
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.topMargin: 50
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.bottomMargin: 10
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOff
        clip: true

        ListView {
            id: logListView
            anchors.fill: parent
            spacing: 10
            model: DeviceService.logInfo
            delegate: Rectangle {
                id: logRectangle
                anchors.left: parent.left
                anchors.right: parent.right
                border.width: 1
                height: 60
                color: "#64b5f6"

                Text {
                    id: logText
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: modelData
                }
            }
            populate: Transition {
                id: _popuTrans
                SequentialAnimation {
                    PropertyAction { property: "opacity"; value: 0.0 }
                    PauseAnimation { duration: 100*_popuTrans.ViewTransition.index }
                    NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 200; easing.type: Easing.InOutQuad }
                }
            }
        }
    }

    Button {
        id: clearLogsButton
        anchors.bottom: parent.bottom
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.topMargin: 50
        anchors.bottomMargin: 50
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        flat: true
        highlighted: true
        Material.background: GlobalValues.colorButton
        Material.accent: GlobalValues.colorBlack
        font.pixelSize: 18
        text: "CLEAR LOGS"
        onClicked: clearLogsDialog.visible = true
    }

    YesNoDialog {
        id: clearLogsDialog
        visible: false
        dialogText: qsTr("LOGS WILL BE DELETED!")
        onOkClicked: {
            DeviceService.clearLogs()
            visible = false
        }
        onCancelClicked: visible = false
    }
}
