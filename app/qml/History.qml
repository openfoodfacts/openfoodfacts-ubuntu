import QtQuick 2.4
import Ubuntu.Components 1.2

Page {
    id: history

    title: i18n.tr("History")

    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: historyColumn.height
        flickableDirection: Flickable.VerticalFlick
        clip: true

    Column {
        id: historyColumn
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }





        Rectangle {
            id:emptyrect
            anchors.fill: parent; anchors.topMargin: units.gu(5);
            color: "#EDEDEC"

            Item {
                id: emptyState
                anchors.fill: parent;

                Icon {
                    id: emptyIcon
                    name: "browser-timeline"
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: units.gu(10)
                    width: height
                    color: "#BBBBBB"
                }

                Label {
                    id: emptyLabel
                    text: i18n.tr("Empty history")
                    color: "#5d5d5d"
                    fontSize: "large"
                    font.bold: true
                    width: historyColumn.width
                    wrapMode: Text.WordWrap
                    anchors.top: emptyIcon.bottom
                    anchors.topMargin: units.gu(4)
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: emptySublabel
                    text: i18n.tr("You have not scanned product")
                    color: "#7b7b7b"
                    width: historyColumn.width
                    wrapMode: Text.WordWrap
                    anchors.top: emptyLabel.bottom
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }









    }
    }
    }



}
