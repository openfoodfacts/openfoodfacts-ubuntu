import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Popups 1.0

Page {
    id: addfooddiary

    title: i18n.tr("Add a product to diary");
    head {
        actions: [

            Action {
                text: i18n.tr("Validate")
                iconName: "ok"
                onTriggered: {

                }
            }
        ]
        backAction: Action {
            id: leaveSearchAction
            text: "Cancel"
            iconName: "close"
            onTriggered: pageStack.pop()
        }
        foregroundColor: openFoodFacts.settings.fontColor;
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




    } //Column
    } //Flickable
    } //Rectangle





}
