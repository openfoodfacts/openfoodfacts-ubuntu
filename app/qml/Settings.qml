import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem

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
    Label {
        anchors.centerIn: parent
        text: "Not implemented"
    }

/*
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
                text: i18n.tr("Global")
            }

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
                         objectName: "allergen"
                         placeholderText: "1 par lignes"
                         autoSize: true
                         width: parent.width
                    }
                }
            }



            Item {
                id: templatetheme

                property string title
                property real titleWidth: units.gu(10)
                property alias spacing: contenttheme.spacing
                default property alias content: contenttheme.children

                height: Math.max(contenttheme.height, labeltheme.height)
                width: parent.width


                Label {
                    id: labeltheme
                    text: "Theme"
                    width: templatetheme.titleWidth
                    anchors.left: parent.left
                    anchors.top: contenttheme.top
                    anchors.topMargin: 2; anchors.leftMargin: 16;

                }

                Row {
                    id: contenttheme

                    anchors.left: labeltheme.right
                    anchors.leftMargin: units.gu(2)
                    anchors.right: parent.right
                    anchors.rightMargin: units.gu(2)
                    spacing: units.gu(2)

                    ListItem.ItemSelector {
                        model: [i18n.tr("dark"),
                                i18n.tr("clear")]
                        containerHeight: itemHeight * 2
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


            ListItem.Header {
                text: i18n.tr("Viewing Information")
            }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("Product characteristics")
                control: Switch {
                    id: productcharact
                    checked: openfoodfacts.settings.productcharact

                }
            }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("ingredients")
                control: Switch {
                    id: ingredients
                    checked: openfoodfacts.settings.ingredients

                }
            }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("Nutrition facts")
                control: Switch {
                    id: nutritionfacts
                    checked: openfoodfacts.settings.nutritionfacts

                }
            }

            ListItem.Standard {
                showDivider: false
                text: i18n.tr("Composition")
                control: Switch {
                    id: composition
                    checked: openfoodfacts.settings.composition

                }
            }


        }
    }*/
}
