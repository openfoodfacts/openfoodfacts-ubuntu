import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {
    id: healtjournal

    title: i18n.tr("Healt journal");
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }
    Component.onCompleted: openFoodFacts.currentPage="healtjournal";

    head.sections.model: [
        (healtjournal.head.sections.selectedIndex === 0 ? i18n.tr("Food Diary") : i18n.tr("Food Diary")),
        (healtjournal.head.sections.selectedIndex === 1 ? i18n.tr("Exercise Diary") : i18n.tr("Exercise Diary"))
    ]


    VisualItemModel {
        id: tabs


// Food Diary TAB
Item {
            width: tabView.width
            height: tabView.height
    Rectangle {
        id:fooddiary
        anchors.fill: parent;
        color: "#EDEDEC"

        Flickable {
            id: flickablefooddiary
            anchors.fill: parent
            contentHeight: historyColumn.height
            flickableDirection: Flickable.VerticalFlick
            clip: true


        } // Flickable
    }
} //Food Diary TAB


// Exercice Diary TAB
Item {
            width: tabView.width
            height: tabView.height
    Rectangle {
        id:exercicediary
        anchors.fill: parent;
        color: "#EDEDEC"

        Flickable {
            id: flickableexercicediary
            anchors.fill: parent
            contentHeight: historyColumn.height
            flickableDirection: Flickable.VerticalFlick
            clip: true


        } // Flickable
    }
} //Exercice TAB




   } //VisualItemModel



}
