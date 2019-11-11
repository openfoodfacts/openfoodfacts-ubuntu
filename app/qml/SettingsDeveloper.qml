import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Qt.labs.settings 1.0
import Ubuntu.Components.Popups 0.1

Page {
    id: settingsPage

    signal settingsChanged()
    Component.onCompleted: openFoodFacts.currentPage="Settings"

    header: PageHeader {
        title: i18n.tr("Developer settings")


   }
    Item {
        id:main
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }

        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: settingsColumn.height
            flickableDirection: Flickable.VerticalFlick
            clip: true


            Column {
                id: settingsColumn
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }


                ListItem.Header {
                    text: i18n.tr("Developer settings")
                }

                ListItem.Standard {
                    showDivider: false
                    text: "Activate the welcome wizard at next start"
                    control: Switch {
                        id: welcomewizard
                        checked: openFoodFacts.settings.firstRun
                        onClicked: { openFoodFacts.settings.firstRun = checked;
                        }
                    }
                }



            }
        } //flickable

        Button {
            id: settingsButton
            anchors {
                bottom: parent.bottom
                bottomMargin: units.gu(3)
                horizontalCenter: parent.horizontalCenter
            }
            height: units.gu(3)
            width: parent.width/1.5
            color: UbuntuColors.red
            text: i18n.tr("Delete settings")
            onClicked: {
                openFoodFacts.settings.firstRun = true;
                openFoodFacts.settings.scanhomepage = false;
                openFoodFacts.settings.visiblecomposition = true;
                openFoodFacts.settings.visiblenutrition =	true;
                openFoodFacts.settings.visibleingredient =	true;
                openFoodFacts.settings.visiblecharacteristics =	true;
                openFoodFacts.settings.healthjournal =	false;
                openFoodFacts.settings.color =  '#48c1ba';
                openFoodFacts.settings.fontColor = "white";
                openFoodFacts.settings.allergen = [];
                openFoodFacts.settings.developerModeEnabled =	false;
                openFoodFacts.settings.history = [];
                pageStack.clear();
                pageStack.push(Qt.resolvedUrl("main.qml"));
            }
        }


    }
}
