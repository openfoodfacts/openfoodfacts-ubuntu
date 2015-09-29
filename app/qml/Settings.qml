import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem
import Qt.labs.settings 1.0
import Ubuntu.Components 1.2 as Toolkit

Page {
    id: settingsPage

    title: i18n.tr("Settings")
    signal settingsChanged()


    head.backAction: Action {
        iconName: "back"
            onTriggered: { //openFoodFacts.settings.userallergen = userallergen.text;
                pageStack.pop();
            }

    }


    head {
        actions: [

            Action {
                text: i18n.tr("about")
                iconName: "info"
                onTriggered: {
                    pageStack.push(Qt.resolvedUrl("About.qml"));
                }
            }
        ]
    }

    Flickable {
        id: flickable

        anchors.fill: parent
        contentHeight: settingsColumn.height + units.gu(10)


        Column {
            id: settingsColumn
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            ListItem.Header {
                visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                text: i18n.tr("Global")
            }


            ListItem.Standard {
                visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                showDivider: false
                text: i18n.tr("Allergen")
                progression: true
                onTriggered: {
                    pageStack.push(Qt.resolvedUrl("Allergen.qml"));
                }
            }

/*

            Item {
                id: templateallergen

                property string title
                property real titleWidth: units.gu(10)
                property alias spacing: contentallergen.spacing
                default property alias content: contentallergen.children

                height: Math.max(contentallergen.height, labelallergen.height)
                width: parent.width


                Label {
                    id: labelallergen
                    text: "Allergen"
                    width: templateallergen.titleWidth
                    anchors.left: parent.left
                    anchors.top: contentallergen.top
                    anchors.topMargin: 2; anchors.leftMargin: 16;

                }

                Row {
                    id: contentallergen

                    anchors.left: labelallergen.right
                    anchors.leftMargin: units.gu(2)
                    anchors.right: parent.right
                    anchors.rightMargin: units.gu(2)
                    spacing: units.gu(2)

                    TextArea {
                        id:userallergen
                         objectName: "allergen"
                         placeholderText: "1 by lines"
                         autoSize: true
                         width: parent.width
                         text: openFoodFacts.settings.userallergen
                    }
                }
            }



            ListItem.Standard {
                showDivider: false
                text: i18n.tr("Offline Mode")
                control: Switch {
                    id: offlinemode
                    checked: openfoodfacts.settings.offlinemode

                }
            }

*/
            ListItem.Header {
                text: i18n.tr("Viewing Information")
            }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("Product characteristics")
                control: Switch {
                    id: characteristicswitch
                    checked: openFoodFacts.settings.visiblecharacteristics
                    onClicked: { openFoodFacts.settings.visiblecharacteristics = checked;
                    }
                  }
            }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("ingredients")
                control: Switch {
                    id: ingredientwitch
                    checked: openFoodFacts.settings.visibleingredient
                    onClicked: { openFoodFacts.settings.visibleingredient = checked;
                    }
                  }
            }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("Nutrition facts")
                control: Switch {
                    id: nutritionwitch
                    checked: openFoodFacts.settings.visiblenutrition
                    onClicked: { openFoodFacts.settings.visiblenutrition = checked;
                    }
                  }
                }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("Composition")
                control: Switch {
                    id: compositionwitch
                    checked: openFoodFacts.settings.visiblecomposition
                    onClicked: { openFoodFacts.settings.visiblecomposition = checked;
                    }
                }
            }


        }
    }
}
