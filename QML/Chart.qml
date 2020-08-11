import QtQuick 2.14
import QtCharts 2.14
import QtGraphicalEffects 1.0

Item {
    id: topItem
    anchors.fill: parent
    property string headingText: "haedingText"

    HeadingText {
        id: headingText
        text: qsTr(topItem.headingText)
    }

    Rectangle {
        id: whiteBackgoundRectangle
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: headingText.bottom
        anchors.topMargin: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        color: GlobalValues.colorWhite
        radius: GlobalValues.whiteBacgroundRectangleRadius

        ChartView {
            id: chartView
            property var axisXValue: 150
            property var currentXvalue: 0
            anchors.fill: parent
            animationOptions: ChartView.AllAnimations
            legend.visible: false
            antialiasing: true

            ValueAxis {
                id: axisX
                min: 0
                max: chartView.axisXValue
            }

            ValueAxis {
                id: axisY
                min: 0
                max: 200
            }

            LineSeries {
                id: lineSeries
                axisX: axisX
                axisY: axisY
            }

            Timer {
                id: timer
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    lineSeries.append(chartView.currentXvalue, DeviceService.device.sensorsData.A0)
                    chartView.currentXvalue += 1
                    if(chartView.currentXvalue % 100 === 0)
                        chartView.axisXValue += 100
                    //console.log(chartView.currentXvalue)
                }
            }
        }

        Text {
            id: headerText
            font.letterSpacing: 2
            color: GlobalValues.colorBlack
            font.pixelSize: 14
            font.weight: Font.Black
            text: qsTr("Time [s]")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: chartView.horizontalCenter
        }

    }

    DropShadow {
        anchors.fill: whiteBackgoundRectangle
        horizontalOffset: 4
        verticalOffset: 4
        radius: 6.0
        samples: 10
        color: "#40000000"
        source: whiteBackgoundRectangle
    }

}
