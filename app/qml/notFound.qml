/*
import QtQuick 2.0
import Ubuntu.Components 1.1
*/

import QtQuick 2.4
import Ubuntu.Components 1.1


import "qrc:///component/qml/component"


Page {
    id: notFoundPage
    title: i18n.tr("Product not found")

    head.backAction: Action {
        iconName: "back"
            onTriggered: {
                pageStack.push(Qt.resolvedUrl("main.qml"));
            }

    }

    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: product.height
        flickableDirection: Flickable.VerticalFlick
        clip: true

    Column {
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

            }
        }









    }
    }
    }


}


