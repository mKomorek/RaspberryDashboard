pragma Singleton
import QtQuick 2.10
import View 1.0

QtObject {
    readonly property int width: 1024
    readonly property int height: 600
    property bool enable: true

    // colors:
    readonly property color colorTransparent: "#00000000"
    readonly property color colorBackground: "#D3D3D3"
    readonly property color colorBlack: "#000000"
    readonly property color colorWhite: "#ffffff"
    readonly property color colorTextGray: "#505050"
    readonly property color colorMenuButtonGray: "#808080"
    readonly property color colorHomeScreenDetails: "#000000"

    // ride type colors:
    readonly property color colorEco: "#43a047"
    readonly property color colorNormal: "#fafafa"
    readonly property color colorDynamic: "#c61e5d"

    // record colors:
    readonly property color colorHighestSpeed: "#d50000"
    readonly property color colorBetteryTemperature: "#ec407a"
    readonly property color colorTimeW8Charging: "#42a5f5"

    // hmi parameters
    property int hmi_typeOfRideMode: 2
    property color hmi_typeOfRideModeColor: {
        if(hmi_typeOfRideMode === 0)
            return GlobalValues.colorEco
        if(hmi_typeOfRideMode === 1)
            return GlobalValues.colorNormal
        if(hmi_typeOfRideMode === 2)
            return GlobalValues.colorDynamic
    }
    property int hmi_typeOfClock: RadialBar.MinToMax
    property color hmi_progressBarColor: GlobalValues.colorDynamic
    property int hmi_progressBarWidth: 30
    property int hmi_startAngle: 40
    property int hmi_spanAngle: 280
    property int hmi_maxValueProgressBar: 200
    property string hmi_unit: "km/h"
}
