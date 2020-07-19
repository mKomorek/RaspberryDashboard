import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

Item {
    id: topElementButton
    width: 79
    height: 80

    property string iconSource: undefined
    property bool buttonEnabledIn: false
    signal click()

    Button {
        id: button
        anchors.fill: parent
        onClicked: topElementButton.click()
        Material.background: topElementButton.buttonEnabledIn ? GlobalValues.colorMenuButtonGray : GlobalValues.colorBlack

        Image {
            id: image
            width: 50
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: topElementButton.iconSource
            sourceSize.width: width
            sourceSize.height: height
        }

        ColorOverlay {
            id: colorOverlay
            color: GlobalValues.colorWhite
            anchors.fill: image
            source: image
        }
    }
}
