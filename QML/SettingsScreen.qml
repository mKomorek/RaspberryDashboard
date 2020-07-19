import QtQuick 2.0
import QtQuick.Controls 2.14

Item {
    id: topItem

    SwipeView {
        id: view
        currentIndex: 0
        anchors.fill: parent

        Item {
            id: firstPage
            UISettings {
                id: uiSettings
                anchors.fill: parent
            }
        }

        Item {
            id: secondPage
            Rectangle {
                width: 250
                height: 250
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
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

