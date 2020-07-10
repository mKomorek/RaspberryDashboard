pragma Singleton
import QtQuick 2.10

QtObject {
    readonly property int width: 1024
    readonly property int height: 600

    // colors:
    readonly property color colorTransparent: "#00000000"
    readonly property color colorBackground: "#D3D3D3"
    readonly property color colorMenuButtonGray: "#808080"
    readonly property color colorHomeScreenDetails: "#000000"

    // ride type colors:
    readonly property color colorEco: "#43a047"
    readonly property color colorNormal: "#fafafa"
    readonly property color colorDynamic: "#c61e5d"



    // old app colors:
    readonly property color colorDisable: "#151516"
    readonly property color colorBlack: "#000000"
    readonly property color colorWhite: "#ffffff"
    readonly property color colorRed: "#ff3232"
    readonly property color colorGreen: "#00b300"
}
