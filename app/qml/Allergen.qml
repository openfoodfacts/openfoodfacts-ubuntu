import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem

Page {
    id: about

    title: i18n.tr("Allergen")
    signal settingsChanged()

/*
    head.backAction: Action {
        iconName: "back"
            onTriggered: {
                pageStack.pop();
            }

    }
*/
    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: allergenColumn.height + units.gu(1)
        flickableDirection: Flickable.VerticalFlick
        clip: true

        Column {
            id: allergenColumn
            spacing: units.gu(1)

            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            anchors.topMargin: units.gu(1)


            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxegg
                    anchors.verticalCenter: egg.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxegg
                    onClicked: { openFoodFacts.settings.checkboxegg = checked
                        if (checkboxegg.checked === true)
                            openFoodFacts.settings.allergenegg = egg.text
                        else
                            openFoodFacts.settings.allergenegg = ""
                    }
                }

                Label {
                    id: egg
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Egg")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxpeanut
                    anchors.verticalCenter: peanut.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxpeanut
                    onClicked: { openFoodFacts.settings.checkboxpeanut = checked
                        if (checkboxpeanut.checked === true)
                            openFoodFacts.settings.allergenpeanut = peanut.text
                        else
                            openFoodFacts.settings.allergenpeanut = ""
                    }
                }

                Label {
                    id: peanut
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Peanut")
                }
            }


            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxcereal
                    anchors.verticalCenter: cereal.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxcereal
                    onClicked: { openFoodFacts.settings.checkboxcereal = checked
                        if (checkboxcereal.checked === true)
                            openFoodFacts.settings.allergencereal = cereal.text
                        else
                            openFoodFacts.settings.allergencereal = ""
                    }
                }

                Label {
                    id: cereal
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Cereal")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxcrustacean
                    anchors.verticalCenter: crustacean.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxcrustacean
                    onClicked: { openFoodFacts.settings.checkboxcrustacean = checked
                        if (checkboxcrustacean.checked === true)
                            openFoodFacts.settings.allergencrustacean = crustacean.text
                        else
                            openFoodFacts.settings.allergencrustacean = ""
                    }
                }

                Label {
                    id: crustacean
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Crustacean")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxfish
                    anchors.verticalCenter: fish.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxfish
                    onClicked: { openFoodFacts.settings.checkboxfish = checked
                        if (checkboxfish.checked === true)
                            openFoodFacts.settings.allergenfish = fish.text
                        else
                            openFoodFacts.settings.allergenfish = ""
                    }
                }

                Label {
                    id: fish
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Fish")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxsoy
                    anchors.verticalCenter: soy.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxsoy
                    onClicked: { openFoodFacts.settings.checkboxsoy = checked
                        if (checkboxsoy.checked === true)
                            openFoodFacts.settings.allergensoy = soy.text
                        else
                            openFoodFacts.settings.allergensoy = ""
                    }
                }

                Label {
                    id: soy
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Soy")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxmilk
                    anchors.verticalCenter: milk.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxmilk
                    onClicked: { openFoodFacts.settings.checkboxmilk = checked
                        if (checkboxmilk.checked === true)
                            openFoodFacts.settings.allergenmilk = milk.text
                        else
                            openFoodFacts.settings.allergenmilk = ""
                    }
                }

                Label {
                    id: milk
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Milk")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxnuts
                    anchors.verticalCenter: nuts.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxnuts
                    onClicked: { openFoodFacts.settings.checkboxnuts = checked
                        if (checkboxnuts.checked === true)
                            openFoodFacts.settings.allergennuts = nuts.text
                        else
                            openFoodFacts.settings.allergennuts = ""
                    }
                }

                Label {
                    id: nuts
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Nuts")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxmustard
                    anchors.verticalCenter: mustard.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxmustard
                    onClicked: { openFoodFacts.settings.checkboxmustard = checked
                        if (checkboxmustard.checked === true)
                            openFoodFacts.settings.allergenmustard = mustard.text
                        else
                            openFoodFacts.settings.allergenmustard = ""
                    }
                }

                Label {
                    id: mustard
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Mustard")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxcelery
                    anchors.verticalCenter: celery.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxcelery
                    onClicked: { openFoodFacts.settings.checkboxcelery = checked
                        if (checkboxcelery.checked === true)
                            openFoodFacts.settings.allergencelery = celery.text
                        else
                            openFoodFacts.settings.allergencelery = ""
                    }
                }

                Label {
                    id: celery
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Celery")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxsesameseeds
                    anchors.verticalCenter: sesameseeds.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxsesameseeds
                    onClicked: { openFoodFacts.settings.checkboxsesameseeds = checked
                        if (checkboxsesameseeds.checked === true)
                            openFoodFacts.settings.allergensesameseeds = sesameseeds.text
                        else
                            openFoodFacts.settings.allergensesameseeds = ""
                    }
                }

                Label {
                    id: sesameseeds
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Sesame seeds")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxmollusk
                    anchors.verticalCenter: mollusk.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxmollusk
                    onClicked: { openFoodFacts.settings.checkboxmollusk = checked
                        if (checkboxmollusk.checked === true)
                            openFoodFacts.settings.allergenmollusk = mollusk.text
                        else
                            openFoodFacts.settings.allergenmollusk = ""
                    }
                }

                Label {
                    id: mollusk
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Mollusk")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxsulfurdioxide
                    anchors.verticalCenter: sulfurdioxide.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxsulfurdioxide
                    onClicked: { openFoodFacts.settings.checkboxsulfurdioxide = checked
                        if (checkboxsulfurdioxide.checked === true)
                            openFoodFacts.settings.allergensulfurdioxide = sulfurdioxide.text
                        else
                            openFoodFacts.settings.allergensulfurdioxide = ""
                    }
                }

                Label {
                    id: sulfurdioxide
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Sulfur dioxide")
                }
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    id: checkboxlupin
                    anchors.verticalCenter: lupin.verticalCenter
                    anchors.left: parent.left
                    checked: openFoodFacts.settings.checkboxlupin
                    onClicked: { openFoodFacts.settings.checkboxlupin = checked
                        if (checkboxlupin.checked === true)
                            openFoodFacts.settings.allergenlupin = lupin.text
                        else
                            openFoodFacts.settings.allergenlupin = ""
                    }
                }

                Label {
                    id: lupin
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color

                    text: i18n.tr("Lupin")
                }
            }



         }


        }
    }

}
