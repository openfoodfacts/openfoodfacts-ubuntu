import QtQuick 2.4
import Ubuntu.Components 1.3

Page {
    id: addproductmain

    title: i18n.tr("Add product")

    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: addproduct.height
        flickableDirection: Flickable.VerticalFlick
        clip: true

    Column {
        id: addproduct
        anchors.fill: parent



        Rectangle {
            id:emptyrect
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            anchors.topMargin: units.gu(5);
            color: "#EDEDEC"

            Item {
                id: emptyState
                anchors.fill: parent;

                Icon {
                    id: emptyIcon
                    name: "cancel"
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: units.gu(10)
                    width: height
                    color: "#BBBBBB"
                }

                Label {
                    id: emptyLabel
                    text: i18n.tr("Not implemented")
                    color: "#5d5d5d"
                    fontSize: "large"
                    font.bold: true
                    width: addproduct.width
                    wrapMode: Text.WordWrap
                    anchors.top: emptyIcon.bottom
                    anchors.topMargin: units.gu(4)
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: emptySublabel
                    text: i18n.tr("Page not yet finished, thank you to return again later.")
                    color: "#7b7b7b"
                    width: addproduct.width
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
