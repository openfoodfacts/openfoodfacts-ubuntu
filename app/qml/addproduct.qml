import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

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



        Rectangle {
            id:emptyrect
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            color: "#EDEDEC"

            ListItem.Header {
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Information product")+"</font>"
            }










        }

    }
    }
    }



}
