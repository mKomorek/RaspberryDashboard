import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

Rectangle {
    id: yesNoDioalog
    property string dialogText: "text"
    signal okClicked()
    signal cancelClicked()

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    width: GlobalValues.width
    height: GlobalValues.height
    color: "#40000000"

    Rectangle {
        id: backgroundRectangle
        width: 400
        height: 250
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        radius: GlobalValues.whiteBacgroundRectangleRadius
        color: GlobalValues.colorWhite

        Text {
            id: dialogText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
            width: parent.width - 80
            horizontalAlignment: Text.AlignHCenter
            text: yesNoDioalog.dialogText
            font.pixelSize: 24
            font.letterSpacing: 2
            font.weight: Font.Bold
            wrapMode: Text.WordWrap
        }

        Row {
            id: buttons
            height: 50
            spacing: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40

            Button {
                id: okButton
                anchors.top: parent.top
                flat: true
                highlighted: true
                Material.background: GlobalValues.colorGreen
                Material.accent: GlobalValues.colorBlack
                font.pixelSize: 18
                height: 60
                width: 120
                text: qsTr("OK")
                onClicked: yesNoDioalog.okClicked()
            }

            Button {
                id: cancelButton
                anchors.top: parent.top
                flat: true
                highlighted: true
                Material.background: GlobalValues.colorRed
                Material.accent: GlobalValues.colorBlack
                font.pixelSize: 18
                height: 60
                width: 120
                text: qsTr("Cancel")
                onClicked: yesNoDioalog.cancelClicked()
            }
        }
    }

}
