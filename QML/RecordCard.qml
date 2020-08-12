import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: topItem

    property string imageSource: "source"
    property color cardColor: GlobalValues.colorTransparent
    property string recordText: "text"
    property string recordUnit: "km/h"
    property int recordValue: 0
    property date recordDate: new Date()

    width: GlobalValues.width / 2.7
    height: GlobalValues.height / 4.6

    Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        color: topItem.cardColor
        radius: 2

        Image {
            id: recordImage
            width: 64
            height: 64
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            source: topItem.imageSource
            sourceSize.width: width
            sourceSize.height: height

            ColorOverlay {
                id: recordImageOverlay
                anchors.fill: recordImage
                source: recordImage
                color: GlobalValues.colorBlack
            }
        }

        Rectangle {
            id: textRectangle
            color: topItem.cardColor
            anchors.left: recordImage.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Text {
                id: recordDescriptionText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                font.pixelSize: 14
                font.letterSpacing: 2
                font.weight: Font.Bold
                text: topItem.recordText
            }

            Text {
                id: recordValue
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: recordDescriptionText.bottom
                anchors.topMargin: 10
                font.pixelSize: 24
                font.letterSpacing: 2
                font.weight: Font.Bold
                text: topItem.recordValue + " " + topItem.recordUnit
            }

            Text {
                id: recordTime
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: recordValue.bottom
                anchors.topMargin: 15
                font.pixelSize: 14
                font.letterSpacing: 2
                font.weight: Font.Bold
                text: topItem.recordDate.toLocaleDateString()
            }
        }
    }

    DropShadow {
        anchors.fill: backgroundRectangle
        horizontalOffset: 4
        verticalOffset: 4
        radius: 6.0
        samples: 10
        color: "#40000000"
        source: backgroundRectangle
    }
}
