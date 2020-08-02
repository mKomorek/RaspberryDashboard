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
            ConnectionSettings {
                id: connectionSettings
                anchors.fill: parent
            }
        }

        Item {
            id: secondPage
            UISettings {
                id: uiSettings
                anchors.fill: parent
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

