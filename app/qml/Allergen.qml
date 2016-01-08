import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {
    id: allergen

    title: i18n.tr("Allergen");
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }
    signal settingsChanged()

/*
    head.backAction: Action {
        iconName: "back"
            onTriggered: {
                pageStack.pop();
            }

    }
*/
    ListModel {
        id: allergenModel
        //TODO: voir a n'utiliser qu'un seule labelle et mettre la majuscule par fonction
        ListElement {
               name: "egg"
               label: "Egg"
           }
           ListElement {
               name: "peanut"
               label: "Peanut"
           }
           ListElement {
               name: "cereal"
               label: "Cereal"
           }
           ListElement {
               name: "crustacean"
               label: "Crustacean"
           }
           ListElement {
               name: "fish"
               label: "Fish"
           }
           ListElement {
               name: "soy"
               label: "Soy"
           }
           ListElement {
               name: "milk"
               label: "Milk"
           }
           ListElement {
               name: "nuts"
               label: "Nuts"
           }
           ListElement {
               name: "mustard"
               label: "Mustard"
           }
           ListElement {
               name: "celery"
               label: "Celery"
           }
           ListElement {
               name: "sesame seeds"
               label: "Sesame seeds"
           }
           ListElement {
               name: "mollusk"
               label: "Mollusk"
           }
           ListElement {
               name: "sulftur dioxide"
               label: "Sulfur dioxide"
           }
           ListElement {
               name: "lupin"
               label: "Lupin"
           }
    }

    Rectangle {
        id:main
        anchors.fill: parent;
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

            model: allergenModel
            delegate: Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    //anchors.verticalCenter: egg.verticalCenter
                    anchors.left: parent.left
                    checked: (openFoodFacts.settings.allergen.indexOf(name) !== -1)
                    onClicked: {
                        if (checked === true)
                            openFoodFacts.settings.allergen.push(name)
                        else
                            openFoodFacts.settings.allergen.splice(openFoodFacts.settings.allergen.indexOf(name), 1)
                        openFoodFacts.settings.allergenChanged();
                    }
                }

                Label {
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr(label)
                }
            }
        }


   }
}
