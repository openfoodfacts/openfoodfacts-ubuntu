import QtQuick 2.4
import Ubuntu.Components 1.3
<<<<<<< HEAD
import ProductAdder 1.0
=======
import Ubuntu.Components.ListItems 1.3 as ListItem
>>>>>>> d15a0f2acf3b39744610b0919dfbaec0d3c45e6c

Page {
    id: addproductmain

    Component.onCompleted: openFoodFacts.currentPage="addproduct"
    header: PageHeader {
        title: i18n.tr("Add product")
       StyleHints {
           foregroundColor: openFoodFacts.settings.fontColor;
           backgroundColor: openFoodFacts.settings.color;
       }

   }



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
            contentHeight: addproduct.height
            flickableDirection: Flickable.VerticalFlick
            clip: true

            Column {
                id: addproduct
                anchors.fill: parent

                Product {
                        id: productAdder

                    }


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
<<<<<<< HEAD

            Button {
                text: "grabme"
                onClicked: {
                    productAdder.grab();

                }
            }
=======
            color: "#EDEDEC"

            ListItem.Header {
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Information product")+"</font>"
            }







>>>>>>> d15a0f2acf3b39744610b0919dfbaec0d3c45e6c

        }

<<<<<<< HEAD
        Component.onCompleted: {
            productAdder.scanRect = Qt.rect(openFoodFacts.mapFromItem(emptyrect, 0, 0).x, openFoodFacts.mapFromItem(emptyrect, 0, 0).y, emptyrect.width, emptyrect.height);
        }
=======

        }

    }
    }
>>>>>>> d15a0f2acf3b39744610b0919dfbaec0d3c45e6c
    }



}
