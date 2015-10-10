import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem
import Qt.labs.settings 1.0
import Ubuntu.Components 1.2 as Toolkit
import Ubuntu.Components.Popups 0.1

Page {
    id: settingsPage

    title: i18n.tr("Settings")
    signal settingsChanged()

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
    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

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
                visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Global")+"</font>"
            }


            ListItem.MultiValue {
                visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                showDivider: false
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Allergen")+"</font>"
                values:  ["<font color=\"#b3b3b3\">"+
                    ((openFoodFacts.settings.allergenegg !== "egg")? openFoodFacts.settings.allergenegg + "" : ""),
                    ((openFoodFacts.settings.allergenpeanut !== "peanut")? openFoodFacts.settings.allergenpeanut + "" : ""),
                    ((openFoodFacts.settings.allergencereal !== "cereal")? openFoodFacts.settings.allergencereal + "" : ""),
                    ((openFoodFacts.settings.allergencrustacean !== "crustacean")? openFoodFacts.settings.allergencrustacean + "" : ""),
                    ((openFoodFacts.settings.allergenfish !== "fish")? openFoodFacts.settings.allergenfish + "" : ""),
                    ((openFoodFacts.settings.allergensoy !== "soy")? openFoodFacts.settings.allergensoy + "" : ""),
                    ((openFoodFacts.settings.allergenmilk !== "milk")? openFoodFacts.settings.allergenmilk + "" : "")
                       +"</font>"  ]
                progression: true
                onTriggered: {
                    pageStack.push(Qt.resolvedUrl("Allergen.qml"));
                }
            }


                Component {
                     id: dialog
                     Dialog {
                         id: dialogue
                         title: "Choose a color"
                         Row {
                             id: row
                             width: parent.width
                             spacing: units.gu(1)
                             Button {
                                 width: parent.width/2
                                 text: ""
                                 color:  "#48c1ba"
                                 onClicked: PopupUtils.close(dialogue),
                                 openFoodFacts.settings.color = "#48c1ba";
                             }
                             Button {
                                 width: parent.width/2
                                 text: ""
                                 color:  "#DD4814"
                                 onClicked: PopupUtils.close(dialogue),
                                 openFoodFacts.settings.color = "#DD4814";
                             }
                         }
                         Row {
                             id: row2
                             width: parent.width
                             spacing: units.gu(1)
                             Button {
                                 width: parent.width/2
                                 text: ""
                                 color:  "#77216F"
                                 onClicked: PopupUtils.close(dialogue),
                                 openFoodFacts.settings.color = "#77216F";
                             }
                             Button {
                                 width: parent.width/2
                                 text: ""
                                 color:  "#AEA79F"
                                 onClicked: PopupUtils.close(dialogue),
                                 openFoodFacts.settings.color = "#AEA79F";
                             }
                         }
                         Row {
                             id: row3
                             width: parent.width
                             spacing: units.gu(1)


                             TextField {
                                 id: barcodeinput
                                 width: parent.width/1.2
                                 placeholderText: i18n.tr("Example : #1ab6ef")
                             }

                             Button {
                                 width: parent.width/6
                                 text: "ok"
                                 color:  "#38B44A"
                                 onClicked: ((barcodeinput.text == "")? openFoodFacts.settings.color = "#1ab6ef" : openFoodFacts.settings.color = barcodeinput.text),
                                            PopupUtils.close(dialogue)
                             }
                         }

                     }
                }
                ListItem.SingleValue {
                    visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                    showDivider: false
                    progression: true
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Theme")+"</font>"
                    onClicked: PopupUtils.open(dialog)
                }



/*

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
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Viewing Information")+"</font>"
            }

            ListItem.Standard {
                showDivider: false
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Product characteristics")+"</font>"
                control: Switch {
                    id: characteristicswitch
                    checked: openFoodFacts.settings.visiblecharacteristics
                    onClicked: { openFoodFacts.settings.visiblecharacteristics = checked;
                    }
                  }
            }

            ListItem.Standard {
                showDivider: false
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("ingredients")+"</font>"
                control: Switch {
                    id: ingredientwitch
                    checked: openFoodFacts.settings.visibleingredient
                    onClicked: { openFoodFacts.settings.visibleingredient = checked;
                    }
                  }
            }

            ListItem.Standard {
                showDivider: false
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Nutrition facts")+"</font>"
                control: Switch {
                    id: nutritionwitch
                    checked: openFoodFacts.settings.visiblenutrition
                    onClicked: { openFoodFacts.settings.visiblenutrition = checked;
                    }
                  }
                }

            ListItem.Standard {
                showDivider: false
                text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Composition")+"</font>"
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
}
