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
        title: i18n.tr("Settings")

       trailingActionBar {
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
                    text: i18n.tr("Global")
                }

                ListItem.MultiValue {
                    showDivider: false
                    text: i18n.tr("Allergen")
                    function addFontColor(list, color) {
                        if(list.length > 0) {
                            var txtlist = list.slice(); //local copy
                            txtlist[0] = "<font color=\""+color+"\">"+txtlist[0];
                            txtlist[txtlist.length-1] = txtlist[txtlist.length-1]+"</font>";
                            return txtlist;
                        }
                        else
                            return [];
                    }
                    values: addFontColor(openFoodFacts.settings.allergen, "#b3b3b3")
                    progression: true
                    onTriggered: {
                        pageStack.push(Qt.resolvedUrl("Allergen.qml"));
                    }
                }

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



                ListItem.Standard {
                    id: settingsdeveloper
                    visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                    showDivider: false
                    text: "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Developer settings"
                    progression: true
                    onTriggered: {
                        pageStack.push(Qt.resolvedUrl("SettingsDeveloper.qml"));
                    }
                    Icon {
                        id: expendedIcon4
                        name: "security-alert"
                        anchors { left: parent.left; verticalCenter: parent.verticalCenter}
                        anchors.leftMargin: 15;
                        height: units.gu(2.5)
                        width: height
                    }
                }



            }
        }
    }
}
