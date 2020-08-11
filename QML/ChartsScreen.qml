import QtQuick 2.0
import QtQuick.Controls 2.14

Item {
    id: topItem
    onVisibleChanged: view.currentIndex = 0

    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent

        Item {
            id: firstPage
            Chart {
                id: speedChart
                anchors.fill: parent
                headingText: qsTr("SPEED CHART")
            }
        }

        Item {
            id: secondPage
            Chart {
                id: batteryChargeChart
                anchors.fill: parent
                headingText:  qsTr("BATTERY CHARGE CHART")
            }
        }
    }

    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
