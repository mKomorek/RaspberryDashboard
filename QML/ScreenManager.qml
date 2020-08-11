import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: topRectangle
    width: parent.width
    height: parent.height
    color: GlobalValues.colorBackground


    MenuBar {
        id: menuBar
        anchors.left: parent.left
        anchors.top: parent.top
    }

    HomeScreen {
        id: homeScreen
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: menuBar.right
        visible: false
        enabled: GlobalValues.enable
    }

    BatteryScreen {
        id: batteryScreen
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: menuBar.right
        visible: false
        enabled: GlobalValues.enable
    }

    ChartsScreen {
        id: chartsScreen
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: menuBar.right
        visible: false
        enabled: GlobalValues.enable
    }

    SettingsScreen {
        id: settingsScreen
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: menuBar.right
        visible: false
        enabled: GlobalValues.enable
    }

    AboutAppScreen {
        id: aboutAppScreen
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: menuBar.right
        visible: false
        enabled: GlobalValues.enable
    }

    states: [
        State {
            name: "Home"
            PropertyChanges {
                target: homeScreen
                visible: true
            }
            when: menuBar.selected === MenuBar.ESelected.HOME
        },
        State {
            name: "Battery"
            PropertyChanges {
                target: batteryScreen
                visible: true
            }
            when: menuBar.selected === MenuBar.ESelected.BATTERY
        },
        State {
            name: "Charts"
            PropertyChanges {
                target: chartsScreen
                visible: true
            }
            when: menuBar.selected === MenuBar.ESelected.CHARTS
        },
        State {
            name: "Settings"
            PropertyChanges {
                target: settingsScreen
                visible: true
            }
            when: menuBar.selected === MenuBar.ESelected.SETTINGS
        },
        State {
            name: "About"
            PropertyChanges {
                target: aboutAppScreen
                visible: true
            }
            when: menuBar.selected === MenuBar.ESelected.ABOUT
        }
    ]

    DropShadow {
        anchors.fill: menuBar
        horizontalOffset: 3
        verticalOffset: 0
        radius: 4.0
        samples: 10
        color: "#40000000"
        source: menuBar
    }
}
