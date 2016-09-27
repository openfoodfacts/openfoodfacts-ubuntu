import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {
    id: allergen

    header: PageHeader {
        title: i18n.tr("Allergen");
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

        ListView {
            anchors.fill: parent
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            anchors.topMargin: units.gu(1)
            spacing: units.gu(1)

            model: openFoodFacts.allergenModel
            delegate: Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    //anchors.verticalCenter: egg.verticalCenter
                    anchors.left: parent.left
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

                Label {
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color;
                    text: label;
                }
            }
        }


    }
}
