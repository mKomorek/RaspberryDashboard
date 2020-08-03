import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.4
import QtGraphicalEffects 1.0
import View 1.0

Item {
    id: topItem
    anchors.fill: parent

    function setClockType(currentIndex) {
        if (currentIndex === 0)
            GlobalValues.hmi_typeOfClock = RadialBar.MinToMax
        if (currentIndex === 1)
            GlobalValues.hmi_typeOfClock = RadialBar.FullDial
        if (currentIndex === 2)
            GlobalValues.hmi_typeOfClock = RadialBar.NoDial

        topItem.checkAndSetClockStartAngle()
    }

    function checkAndSetClockStartAngle() {
        if(GlobalValues.hmi_typeOfClock === RadialBar.FullDial)
        {
            GlobalValues.hmi_startAngle = 0
            GlobalValues.hmi_spanAngle = 360
        }
        if(GlobalValues.hmi_typeOfClock === RadialBar.MinToMax)
        {
            GlobalValues.hmi_startAngle = 40
            GlobalValues.hmi_spanAngle = 280
        }
    }

    ListModel {
        id: colorModel
        ListElement { text: "Green Color" }
        ListElement { text: "Dark Pink" }
        ListElement { text: "Blue" }
        ListElement { text: "Orange" }
        ListElement { text: "Purple" }
        ListElement { text: "Dark Orange" }
        ListElement { text: "Perl" }
    }

    HeadingText {
        text: qsTr("UI SETTINGS")
    }

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

    DropShadow {
        anchors.fill: hmiClock
        horizontalOffset: 3
        verticalOffset: 2
        radius: 4.0
        samples: 10
        color: "#40000000"
        source: hmiClock
    }

    Rectangle {
        id: whiteBackgoundRectangleColumn
        anchors.right: parent.right
        anchors.left: hmiClock.right
        anchors.margins: 30
        anchors.verticalCenter: parent.verticalCenter
        color: GlobalValues.colorWhite
        radius: GlobalValues.whiteBacgroundRectangleRadius
        width: parent.width * 0.4
        height: parent.height * 0.80

        ScrollView {
            id: scrol
            anchors.fill: parent
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff
            clip: true

            Column {
                id: column
                width: scrol.width
                anchors.top: parent.top
                anchors.topMargin: 15
                spacing: 12

                Text {
                    id: typeOfClockText
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    font.pixelSize: 16
                    font.letterSpacing: 2
                    font.weight: Font.Medium
                    text: qsTr("TYPE OF CLOCK")
                }

                ComboBox {
                    id: typeOfClockComboBox
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 40
                    height: 50
                    model: ListModel {
                        id: typeModel
                        ListElement { text: "Standard Clock" }
                        ListElement { text: "Full Clock" }
                        ListElement { text: "Only Value" }
                    }
                    onCurrentIndexChanged: {
                        topItem.setClockType(typeOfClockComboBox.currentIndex)
                        hmiClock.update()
                    }
                }

                Text {
                    id: maxValueText
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    font.pixelSize: 16
                    font.letterSpacing: 2
                    font.weight: Font.Medium
                    text: qsTr("MAX VALUE")
                }

                SpinBox {
                    id: maxValueTextField
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 40
                    height: 50
                    value: GlobalValues.hmi_maxValueProgressBar
                    from: 1
                    to: 250
                    onValueModified: {
                        GlobalValues.hmi_maxValueProgressBar = value
                        hmiClock.update()
                    }
                }

                Text {
                    id: widthOfProgressBarText
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    font.pixelSize: 16
                    font.letterSpacing: 2
                    font.weight: Font.Medium
                    text: qsTr("WIDTH OF PROGRESS BAR")
                }

                SpinBox {
                    id: widthOfProgressBarTextField
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 40
                    height: 50
                    value: GlobalValues.hmi_progressBarWidth
                    from: 10
                    to: 50
                    onValueModified: {
                        GlobalValues.hmi_progressBarWidth = value
                        hmiClock.update()
                    }
                }

                Text {
                    id: ecoColor
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    font.pixelSize: 16
                    font.letterSpacing: 2
                    font.weight: Font.Medium
                    text: qsTr("ECO TYPE OF RIDE COLOR")
                }

                ComboBox {
                    id: ecoProgressColorComboBox
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 40
                    height: 50
                    model: colorModel
                    onCurrentValueChanged: {
                        if (currentIndex == 0)
                            GlobalValues.colorEco = "#43a047"
                        if (currentIndex == 1)
                            GlobalValues.colorEco = "#c61e5d"
                        if (currentIndex == 2)
                            GlobalValues.colorEco = "#1e5dc6"
                        if (currentIndex == 3)
                            GlobalValues.colorEco = "#e67f22"
                        if (currentIndex == 4)
                            GlobalValues.colorEco = "#8e42ae"
                        if (currentIndex == 5)
                            GlobalValues.colorEco = "#e84c3d"
                        if (currentIndex == 6)
                            GlobalValues.colorEco = "#fafafa"
                        hmiClock.progressColor = GlobalValues.colorEco
                        hmiClock.textColor = GlobalValues.colorEco
                        hmiClock.update()
                    }
                }

                Text {
                    id: normalColor
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    font.pixelSize: 16
                    font.letterSpacing: 2
                    font.weight: Font.Medium
                    text: qsTr("NORMAL TYPE OF RIDE COLOR")
                }

                ComboBox {
                    id: normalProgressColorComboBox
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 40
                    height: 50
                    model: colorModel
                    onCurrentValueChanged: {
                        if (currentIndex == 0)
                            GlobalValues.colorNormal = "#43a047"
                        if (currentIndex == 1)
                            GlobalValues.colorNormal = "#c61e5d"
                        if (currentIndex == 2)
                            GlobalValues.colorNormal = "#1e5dc6"
                        if (currentIndex == 3)
                            GlobalValues.colorNormal = "#e67f22"
                        if (currentIndex == 4)
                            GlobalValues.colorNormal = "#8e42ae"
                        if (currentIndex == 5)
                            GlobalValues.colorNormal = "#e84c3d"
                        if (currentIndex == 6)
                            GlobalValues.colorNormal = "#fafafa"
                        hmiClock.progressColor = GlobalValues.colorNormal
                        hmiClock.textColor = GlobalValues.colorNormal
                        hmiClock.update()
                    }
                }

                Text {
                    id: dynamicColor
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    font.pixelSize: 16
                    font.letterSpacing: 2
                    font.weight: Font.Medium
                    text: qsTr("DYNAMIC TYPE OF RIDE COLOR")
                }

                ComboBox {
                    id: dynamicProgressColorComboBox
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 40
                    height: 50
                    model: colorModel
                    onCurrentValueChanged: {
                        if (currentIndex == 0)
                            GlobalValues.colorDynamic = "#43a047"
                        if (currentIndex == 1)
                            GlobalValues.colorDynamic = "#c61e5d"
                        if (currentIndex == 2)
                            GlobalValues.colorDynamic = "#1e5dc6"
                        if (currentIndex == 3)
                            GlobalValues.colorDynamic = "#e67f22"
                        if (currentIndex == 4)
                            GlobalValues.colorDynamic = "#8e42ae"
                        if (currentIndex == 5)
                            GlobalValues.colorDynamic = "#e84c3d"
                        if (currentIndex == 6)
                            GlobalValues.colorDynamic = "#fafafa"
                        hmiClock.progressColor = GlobalValues.colorDynamic
                        hmiClock.textColor = GlobalValues.colorDynamic
                        hmiClock.update()
                    }
                }

                Button {
                    id: setDefault
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 40
                    height: 50
                    Material.background: GlobalValues.colorButton
                    Material.accent: GlobalValues.colorBlack
                    flat: true
                    highlighted: true
                    font.pixelSize: 18
                    text: "SET DEFAULT"
                    onClicked: restoreDefaultSettings.visible = true
                }

                Rectangle {
                    width: 1
                    height: 30
                }
            }
        }
    }

    DropShadow {
        anchors.fill: whiteBackgoundRectangleColumn
        horizontalOffset: 4
        verticalOffset: 4
        radius: 6.0
        samples: 10
        color: "#40000000"
        source: whiteBackgoundRectangleColumn
    }

    YesNoDialog {
        id: restoreDefaultSettings
        visible: false
        dialogText: qsTr("THE DEFAULT SETTINGS WILL BE RESTORED!")
        onOkClicked: {
            topItem.setClockType(0)
            GlobalValues.hmi_maxValueProgressBar = 200
            GlobalValues.hmi_progressBarWidth = 30
            GlobalValues.colorEco = "#43a047"
            GlobalValues.colorNormal = "#fafafa"
            GlobalValues.colorDynamic = "#c61e5d"
            hmiClock.update()
            visible = false
        }
        onCancelClicked: visible = false
    }
}
