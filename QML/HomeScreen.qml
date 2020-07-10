import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.12
import View 1.0

Item {
    id: topItem
    property int typeOfRideMode: 2
    property color typeOfRideModeColor: {
        if(topItem.typeOfRideMode === 0)
            return Constants.colorEco
        if(topItem.typeOfRideMode === 1)
            return Constants.colorNormal
        if(topItem.typeOfRideMode === 2)
            return Constants.colorDynamic
    }

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        color: Constants.colorBackground

        RadialBar {
            id: hmiClock
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            width: parent.width * 0.5
            height: width
            dialType: RadialBar.MinToMax
            progressColor: topItem.typeOfRideModeColor
            onProgressColorChanged: update()
            foregroundColor: "#1a1a1b"
            dialWidth: 30
            startAngle: 40
            spanAngle: 280
            minValue: 0
            maxValue: 220
            value: 77 //ConnectService.HMI_data.A0
            textFont {
                family: "Consolas"
                italic: false
                pointSize: 38
            }
            suffixText: "km/h"
            textColor: topItem.typeOfRideModeColor
        }

        Column {
            id: column
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width * 0.4
            height: parent.height * 0.90

            Rectangle {
                id: typeOfRide
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorTransparent

                BigText {
                    id: typeOfRideText
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    color: Constants.colorHomeScreenDetails
                    text: {
                        if(topItem.typeOfRideMode === 0)
                            return "ECO"
                        if(topItem.typeOfRideMode === 1)
                            return "NORMAL"
                        if(topItem.typeOfRideMode === 2)
                            return "DYNAMIC"
                    }
                }

                DropShadow {
                    anchors.fill: typeOfRideText
                    horizontalOffset: 2
                    verticalOffset: 2
                    radius: 4.0
                    samples: 10
                    color: "#40000000"
                    source: typeOfRideText
                }
            }

            ColumnElementSeparator {
                rectangleColor: topItem.typeOfRideModeColor
            }

            Rectangle {
                id: baterryCharge
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorTransparent

                Row {
                    anchors.centerIn: parent
                    spacing: 5

                    BigText {
                        id: baterryChargeText
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 1
                        text: qsTr("60") + "%"
                        color: {
//                            if(ConnectService.HMI_data.A1 <= 15)
//                                return Constants.colorRed
                            return Constants.colorHomeScreenDetails
                        }
                    }

                    Image {
                        id: baterryCharging
                        anchors.verticalCenter: parent.verticalCenter
                        width: 48
                        height: 48
                        source: "qrc:/Images/battery.svg"
                        sourceSize.width: width
                        sourceSize.height: height

                        ColorOverlay {
                            id: baterryChargingOverlay
                            color: {
//                                if(ConnectService.HMI_data.A1 <= 15)
//                                    return Constants.colorRed
                                Constants.colorHomeScreenDetails
                            }
                            anchors.fill: baterryCharging
                            source: baterryCharging
                        }
                    }
                }
            }

            ColumnElementSeparator {
                rectangleColor: topItem.typeOfRideModeColor
            }

            Rectangle {
                id: batteryTemp
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorTransparent

                Row {
                    anchors.centerIn: parent
                    spacing: 10

                    BigText {
                        id: baterryTempText
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 1
                        text: qsTr("40") + "°C"
                        color: {
//                            if(ConnectService.HMI_data.A2>=60)
//                                return Constants.colorRed
                            return Constants.colorHomeScreenDetails
                        }
                    }

                    Image {
                        id: baterryTempImg
                        anchors.verticalCenter: parent.verticalCenter
                        width: 48
                        height: 48
                        source: "qrc:/Images/temperature.svg"
                        sourceSize.width: width
                        sourceSize.height: height

                        ColorOverlay {
                            id: baterryTempImgOverlay
                            color: {
//                                if(ConnectService.HMI_data.A2>=60)
//                                    return Constants.colorRed
                                return Constants.colorHomeScreenDetails
                            }
                            anchors.fill: baterryTempImg
                            source: baterryTempImg
                        }
                    }
                }
            }

            ColumnElementSeparator {
                rectangleColor: topItem.typeOfRideModeColor
            }

            Rectangle {
                id: info
                width: parent.width
                height: parent.height * 0.24
                color: Constants.colorTransparent

                Row {
                    anchors.centerIn: parent
                    spacing: 20

                    Rectangle {
                        id: warningRectangle
                        width: 60
                        height: 60
                        color: Constants.colorTransparent

                        Image {
                            id: warningImage
                            width: 48
                            height: 48
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "qrc:/Images/warning.svg"
                            sourceSize.width: width
                            sourceSize.height: height

                            ColorOverlay {
                                id: warningImageOverlay
                                anchors.fill: warningImage
                                source: warningImage
                                color: Constants.colorDisable //ConnectService.HMI_data.D6 === 1 ? Constants.colorRed : Constants.colorDisable
                            }
                        }

                        DropShadow {
                            anchors.fill: warningImage
                            horizontalOffset: 3
                            verticalOffset: 2
                            radius: 4.0
                            samples: 10
                            color: "#40000000"
                            source: warningImage
                        }
                    }

                    Rectangle {
                        id: batteryProblem
                        width: 60
                        height: 60
                        color: Constants.colorTransparent

                        Image {
                            id: batteryProblemImage
                            width: 48
                            height: 48
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: "qrc:/Images/batteryAlert.svg"
                            sourceSize.width: width
                            sourceSize.height: height

                            ColorOverlay {
                                id: batteryProblemOverlay
                                anchors.fill: batteryProblemImage
                                source: batteryProblemImage
                                color: Constants.colorDisable //ConnectService.HMI_data.D5 === 1 ? Constants.colorRed : Constants.colorDisable
                            }
                        }

                        DropShadow {
                            anchors.fill: batteryProblemImage
                            horizontalOffset: 3
                            verticalOffset: 2
                            radius: 4.0
                            samples: 10
                            color: "#40000000"
                            source: batteryProblemImage
                        }
                    }
                }
            }
        }

        DropShadow {
            anchors.fill: hmiClock
            horizontalOffset: 3
            verticalOffset: 2
            radius: 4.0
            samples: 10
            color: "#40000000"
            source: hmiClock
        }
    }
}
