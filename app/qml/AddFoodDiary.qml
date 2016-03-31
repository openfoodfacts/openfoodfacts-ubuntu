import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Popups 1.0

Page {
    id: addfooddiary

    title: i18n.tr("Add a product to diary");
    head {
        id: addHeader
        foregroundColor: openFoodFacts.settings.fontColor;

        contents: TextField {
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            placeholderText: "Search product..."
        }

        actions: [
            Action {
                iconName: "ok"
                text: i18n.tr("Save Product")
                onTriggered: {

                }
            },
            Action {
                iconName: "edit-clear"
                text: i18n.tr("Cancel")
                onTriggered: {

                }
            }
        ]
    }

    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: addproductfooddiary.height
        flickableDirection: Flickable.VerticalFlick
        clip: true

    Column {
        id: addproductfooddiary
        anchors.fill: parent


        ListItem.Header {
            text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Add manually")+"</font>"
        }


    } //Column
    } //Flickable
    } //Rectangle





}
