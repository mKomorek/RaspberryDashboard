import QtQuick 2.12

Rectangle {
    id: topRectangle
    height: parent.height
    width: 80
    color: GlobalValues.colorBlack

    enum ESelected { HOME, BATTERY, SETTINGS, ABOUT }
    property int selected: MenuBar.ESelected.HOME

    Column {
        id: column
        anchors.horizontalCenter: parent.horizontalCenter
        width: 79
        spacing: 0
        enabled: GlobalValues.enable

        MenuBarButton {
            id: homeButton
            anchors.left: parent.left
            anchors.right: parent.right
            iconSource: "qrc:/Images/home.svg"
            buttonEnabledIn: topRectangle.selected === MenuBar.ESelected.HOME
            onClick: topRectangle.selected = MenuBar.ESelected.HOME
        }

        Rectangle {
            width: parent.width - 10
            height: 2
            anchors.horizontalCenter: parent.horizontalCenter
            color: GlobalValues.colorWhite
            radius: 100
        }

        MenuBarButton {
            id: batteryButton
            anchors.left: parent.left
            anchors.right: parent.right
            iconSource: "qrc:/Images/battery.svg"
            buttonEnabledIn: topRectangle.selected === MenuBar.ESelected.BATTERY
            onClick: topRectangle.selected = MenuBar.ESelected.BATTERY
        }

        Rectangle {
            width: parent.width - 10
            height: 2
            anchors.horizontalCenter: parent.horizontalCenter
            color: GlobalValues.colorWhite
            radius: 100
        }

        MenuBarButton {
            id: settingsButton
            anchors.left: parent.left
            anchors.right: parent.right
            iconSource: "qrc:/Images/settings.svg"
            buttonEnabledIn: topRectangle.selected === MenuBar.ESelected.SETTINGS
            onClick: topRectangle.selected = MenuBar.ESelected.SETTINGS
        }

        Rectangle {
            width: parent.width - 10
            height: 2
            anchors.horizontalCenter: parent.horizontalCenter
            color: GlobalValues.colorWhite
            radius: 100
        }

        MenuBarButton {
            id: aboutAppButton
            anchors.left: parent.left
            anchors.right: parent.right
            iconSource: "qrc:/Images/info.svg"
            buttonEnabledIn: topRectangle.selected === MenuBar.ESelected.ABOUT
            onClick: topRectangle.selected = MenuBar.ESelected.ABOUT
        }
    }

    MenuBarButton {
        id: lockUnlockButton
        z: 10
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        iconSource: GlobalValues.enable === false ? "qrc:/Images/lock.svg" : "qrc:/Images/unlock.svg"
        buttonEnabledIn: false
        onClick: {
            GlobalValues.enable = GlobalValues.enable === false ? true : false
        }
    }
}
