import QtQuick 2.0
import QtPositioning 5.14
import QtLocation 5.14

Rectangle {
    Text {
        id: batteryScreen
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Battery Screen")
    }

    Plugin {
       id: mapboxglPlugin
       name: "mapboxgl"
    }

    Map {
       anchors.fill: parent
       plugin: mapboxglPlugin
       center: QtPositioning.coordinate(51.117419, 17.065654) // Sopocka
       zoomLevel: 18
       }
}
