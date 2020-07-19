import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0


Rectangle {
    id: topRectangle
    color: GlobalValues.colorBackground

    ScrollView {
        id: scrollView
        anchors.fill: parent
        clip: true

        Column {
            id: column
            width: scrollView.width
            spacing: 20

//            Item {
//                width: parent.width
//                height: 10
//            }

            HeadingText {
                id: recordsText
                width: parent.width
                height: 30
                text: qsTr("RECORDS")
            }

            Item {
                id: recordsItem
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.95
                height: 360

                Rectangle {
                    id: whiteBacgroundRectangleRecords
                    color: GlobalValues.colorWhite
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height
                    radius: 5

                    Grid {
                        rows: 2
                        columns: 2
                        spacing: 50
                        anchors.centerIn: parent

                        RecordCard {
                            id: highestSpeedRecord
                            imageSource: "qrc:/Images/speed.svg"
                            cardColor: GlobalValues.colorHighestSpeed
                            recordText: qsTr("HIGHEST SPEED")
                            recordValue: qsTr("150 km/h")
                        }

                        RecordCard {
                            id: highestBaterryTemperature
                            imageSource: "qrc:/Images/temperature.svg"
                            cardColor: GlobalValues.colorBetteryTemperature
                            recordText: qsTr("HIGHEST BATTERY TEMP")
                            recordValue: qsTr("88 °C")
                        }

                        RecordCard {
                            id: timeW8Charging
                            imageSource: "qrc:/Images/battery.svg"
                            cardColor: GlobalValues.colorTimeW8Charging
                            recordText: qsTr("TIME W8 CHARGING")
                            recordValue: qsTr("99 h")
                        }

                        RecordCard {
                            id: anyIdea
                            imageSource: "qrc:/Images/unlock.svg"
                            cardColor: "#cddc39"
                            recordText: qsTr("ANY IDEA?")
                            recordValue: qsTr("0.0")
                        }

                    }
                }

                DropShadow {
                    anchors.fill: whiteBacgroundRectangleRecords
                    horizontalOffset: 4
                    verticalOffset: 4
                    radius: 6.0
                    samples: 10
                    color: "#40000000"
                    source: whiteBacgroundRectangleRecords
                }

            }

            HeadingText {
                id: contactText
                width: parent.width
                height: 30
                text: qsTr("CONTACT")
            }

            Item {
                id: contactItem
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.95
                height: 200

                Rectangle {
                    id: whiteBacgroundRectangleContact
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: 200
                    radius: 5

                    Column{
                        anchors.fill: parent
                        anchors.margins: 30
                        spacing: 15

                        Text {
                            text: qsTr("LEM Wrocław")
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.letterSpacing: 2
                            font.pixelSize: 24
                            font.weight: Font.Black
                        }

                        Text {
                            text: qsTr("Marcin Komorek")
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.letterSpacing: 2
                            font.pixelSize: 16
                            font.weight: Font.Bold
                        }

                        Text {
                            text: qsTr("m.komorek98@gmail.com")
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.letterSpacing: 2
                            font.pixelSize: 16
                            font.weight: Font.Bold
                        }

                        Text {
                            text: qsTr("https://github.com/mKomorek")
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.letterSpacing: 2
                            font.pixelSize: 16
                            font.weight: Font.Bold
                        }
                    }
                }

                DropShadow {
                    anchors.fill: whiteBacgroundRectangleContact
                    horizontalOffset: 4
                    verticalOffset: 4
                    radius: 6.0
                    samples: 10
                    color: "#40000000"
                    source: whiteBacgroundRectangleContact
                }
            }

            HeadingText {
                id: licensesText
                width: parent.width
                height: 30
                text: qsTr("LICENSES")
            }

            Item {
                id: licensesItem
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.95
                height: 360

                Rectangle {
                    id: whiteBacgroundRectangleLicenses
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: 360
                    radius: 5

                    Text {
                        text: qsTr("paste the license of qt, icons and other libs")
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.letterSpacing: 2
                        font.pixelSize: 16
                        font.weight: Font.Bold
                    }
                }

                DropShadow {
                    anchors.fill: whiteBacgroundRectangleLicenses
                    horizontalOffset: 4
                    verticalOffset: 4
                    radius: 6.0
                    samples: 10
                    color: "#40000000"
                    source: whiteBacgroundRectangleLicenses
                }
            }

            Item {
                width: parent.width
                height: 20
            }
        }
    }
}
