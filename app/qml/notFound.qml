/*
import QtQuick 2.0
import Ubuntu.Components 1.1
*/

import QtQuick 2.4
import Ubuntu.Components 1.3
import "qrc:///component/qml/component"


Page {
    id: notFoundPage
    header: PageHeader {
        title: i18n.tr("Product not found");
       StyleHints {
           foregroundColor: openFoodFacts.settings.fontColor;
           backgroundColor: openFoodFacts.settings.color;
       }

   }
    Component.onCompleted: openFoodFacts.currentPage="NotFound";

    property string barcode:"";
    onBarcodeChanged: console.log(notFoundPage.barcode);

    Rectangle {
        id:main
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }
        color: "#EDEDEC"

        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: product.height
            flickableDirection: Flickable.VerticalFlick
            clip: true

            Rectangle {
                id: product
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
                            name: "find"
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: units.gu(10)
                            width: height
                            color: "#BBBBBB"
                        }

                        Label {
                            id: emptyLabel
                            text: i18n.tr("Your product was not found")
                            color: "#5d5d5d"
                            fontSize: "large"
                            font.bold: true
                            width: product.width
                            wrapMode: Text.WordWrap
                            anchors.top: emptyIcon.bottom
                            anchors.topMargin: units.gu(4)
                            horizontalAlignment: Text.AlignHCenter
                        }
                        Label {
                            id: emptyBarrecode
                            text: notFoundPage.barcode
                            color: "#5d5d5d"
                            fontSize: "small"
                            width: product.width
                            wrapMode: Text.WordWrap
                            anchors.top: emptyLabel.bottom
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                } // empty rect

            } // product rectangle
        } // flickable
    }


}


