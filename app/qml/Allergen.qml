import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem

Page {
    id: about

    title: i18n.tr("Allergen")

    Flickable {
        id: flickable

        anchors.fill: parent
        contentHeight: settingsColumn.height + units.gu(10)


        Column {
            id: allergenColumn
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            ListItem.Standard {
                text: "Egg"
                selected: false
                onClicked: selected = !selected
               }
            ListItem.Standard {
                text: "Peanut"
                selected: false
                onClicked: selected = !selected
               }
            ListItem.Standard {
                text: "Fish"
                selected: false
                onClicked: selected = !selected
               }
            ListItem.Standard {
                text: "Milk"
                selected: false
                onClicked: selected = !selected
               }






        }
    }

}
