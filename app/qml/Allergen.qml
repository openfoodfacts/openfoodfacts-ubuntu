import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {
    id: allergen

    header: PageHeader {
        title: i18n.tr("Allergen");
   }

    Item {
        id:main
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }

        ListView {
            anchors.fill: parent
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            spacing: units.gu(1)

            model: openFoodFacts.allergenModel
            delegate: ListItem.SingleValue {
                
                               
                showDivider: true
                progression: false
                iconSource: Qt.resolvedUrl("qrc:///component/qml/component/allergen/"+idlabel+".png");
                Text {
                    width: parent.width
                    horizontalAlignment: Text.AlignLeft
                    anchors.verticalCenter: parent.verticalCenter;
                    text: label
                    color: theme.palette.normal.backgroundText
                }
                
                CheckBox {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter;
                    checked: (openFoodFacts.settings.allergen.indexOf(label) >-1)
                    onCheckedChanged: {
                        if (checked) {
                            if (openFoodFacts.settings.allergen.indexOf(label) >-1) {
                                console.log("allergen already in array");
                            } else {
                                console.log("allergen "+label+" is not in allergen list, let's add it");
                                openFoodFacts.settings.allergen.push(label);
                            }
                        } else {
                            if(openFoodFacts.settings.allergen.indexOf(label) >-1) {
                                console.log("remove allergen "+label+" from list");
                                openFoodFacts.settings.allergen.splice(openFoodFacts.settings.allergen.indexOf(label), 1);
                            } else {
                                console.log("you try to remove "+ label+" which is not in the list");
                            }
                        }
                    }
                } 
            
            }
        }


    }
}
