import QtQuick 2.4
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem

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
        anchors.fill: parent
        anchors.topMargin: units.gu(1)

        Button {
            objectName: "createhistory"
            text: "create line of history (test)"
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                openFoodFacts.settings.historyModel.insert(0, {"label": "Cigarettes croustillantes (test)", "codebarre":"3256220211475"})
            }
        }

        UbuntuListView {
            objectName: "ubuntuListView"
            width: parent.width
            height: main.height
            model: openFoodFacts.settings.historyModel
            clip: true
            spacing: units.gu(1)

            delegate: ListItem.Subtitled {
                showDivider: false
                anchors.leftMargin: units.gu(2)
                Text {
                    text: label
                    color: openFoodFacts.settings.color
                }
                subText: codebarre
                onClicked: {
                    var barcodeValue = codebarre;
                    pageStack.push(Qt.resolvedUrl("ProductView.qml"), {"barcode": barcodeValue});                }
            }
        }



/*
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
                    text: i18n.tr("Page not yet finished, thank you to return again later.")
                    //text: i18n.tr("You have not scanned product.")
                    color: "#7b7b7b"
                    width: historyColumn.width
                    wrapMode: Text.WordWrap
                    anchors.top: emptyLabel.bottom
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

*/







    }
    }
    }



}
