import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.12
import View 1.0

Item {
    id: topItem
    onActiveFocusChanged: hmiClock.update()

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        color: GlobalValues.colorBackground

        RadialBar {
            id: hmiClock
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            width: parent.width * 0.5
            height: width
            dialType: GlobalValues.hmi_typeOfClock
            progressColor: GlobalValues.hmi_typeOfRideModeColor
            onProgressColorChanged: update()
            foregroundColor: "#1a1a1b"
            dialWidth: GlobalValues.hmi_progressBarWidth
            startAngle: GlobalValues.hmi_startAngle
            spanAngle: GlobalValues.hmi_spanAngle
            minValue: 0
            maxValue: GlobalValues.hmi_maxValueProgressBar
            value: DeviceService.device.sensorsData.A0
            textFont {
                family: "Consolas"
                italic: false
                pointSize: 38
            }
            suffixText: "km/h"
            textColor: GlobalValues.hmi_typeOfRideModeColor
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
                color: GlobalValues.colorTransparent

                BigText {
                    id: typeOfRideText
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    color: GlobalValues.colorHomeScreenDetails
                    text: {
                        if(GlobalValues.hmi_typeOfRideMode === 0)
                            return "ECO"
                        if(GlobalValues.hmi_typeOfRideMode === 1)
                            return "NORMAL"
                        if(GlobalValues.hmi_typeOfRideMode === 2)
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

            ColumnElementSeparator { }

            Rectangle {
                id: baterryCharge
                width: parent.width
                height: parent.height * 0.24
                color: GlobalValues.colorTransparent

                Row {
                    anchors.centerIn: parent
                    spacing: 5

                    BigText {
                        id: baterryChargeText
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 1
                        text: DeviceService.device.sensorsData.A1 + "%"
                        color: {
                            if(DeviceService.device.sensorsData.A1 <= 25)
                                return GlobalValues.colorRed
                            return GlobalValues.colorHomeScreenDetails
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
                                if(DeviceService.device.sensorsData.A1 <= 25)
                                    return GlobalValues.colorRed
                                GlobalValues.colorHomeScreenDetails
                            }
                            anchors.fill: baterryCharging
                            source: baterryCharging
                        }
                    }
                }
            }

            ColumnElementSeparator { }

            Rectangle {
                id: batteryTemp
                width: parent.width
                height: parent.height * 0.24
                color: GlobalValues.colorTransparent

                Row {
                    anchors.centerIn: parent
                    spacing: 10

                    BigText {
                        id: baterryTempText
                        anchors.verticalCenter: parent.verticalCenter
                        font.letterSpacing: 1
                        text: DeviceService.device.sensorsData.A2 + "°C"
                        color: {
                            if(DeviceService.device.sensorsData.A2 >= 60)
                                return GlobalValues.colorRed
                            return GlobalValues.colorHomeScreenDetails
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
                                if(DeviceService.device.sensorsData.A2 >= 60)
                                    return GlobalValues.colorRed
                                return GlobalValues.colorHomeScreenDetails
                            }
                            anchors.fill: baterryTempImg
                            source: baterryTempImg
                        }
                    }
                }
            }

            ColumnElementSeparator { }

            Rectangle {
                id: info
                width: parent.width
                height: parent.height * 0.24
                color: GlobalValues.colorTransparent

                Row {
                    anchors.centerIn: parent
                    spacing: 20

                    Rectangle {
                        id: warningRectangle
                        width: 60
                        height: 60
                        color: GlobalValues.colorTransparent

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
                                color: DeviceService.device.sensorsData.D6 === 1 ? GlobalValues.colorRed : GlobalValues.colorHomeScreenDetails
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
                        color: GlobalValues.colorTransparent

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
                                color: DeviceService.device.sensorsData.D5 === 1 ? GlobalValues.colorRed : GlobalValues.colorHomeScreenDetails
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
