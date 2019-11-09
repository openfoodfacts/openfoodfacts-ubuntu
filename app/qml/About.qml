import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Popups 1.0

Page {
    id: about

    header: PageHeader {
        title: i18n.tr("About");
   }


// ABOUT PAGE
    Item {
        id:rect1
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }

    Item {
      width: parent.width
      height: parent.height

    Column {
        anchors {
            left: parent.left
            right: parent.right
        }

        Item {
            width: parent.width
            height: units.gu(5)
            Label {
                text: qsTr("Open Food Facts")
                anchors.centerIn: parent
                fontSize: "x-large"
            }
        }

        Item {
            width: parent.width
            height: units.gu(14)

            UbuntuShape {
                radius: "medium"
                source: Image {
                    source: Qt.resolvedUrl("OpenFoodFacts.png");
                }
                height: units.gu(12); width: height;
                anchors.centerIn: parent;


                MouseArea {
                    anchors.fill: parent

                    onPressAndHold: {
                        if (openFoodFacts.settings.developerModeEnabled === false) {
                            openFoodFacts.settings.developerModeEnabled = true;
                        } else {
                            openFoodFacts.settings.developerModeEnabled = false;
                        }
                    } // pressAndHold
                } // MouseArea
            } // shape
        }/// item

        Item {
            width: parent.width
            height: visible ? units.gu(5) : units.gu(0)
            visible: (openFoodFacts.settings.developerModeEnabled)
            Label {
                text: "Developer mode is enabled"
                color: UbuntuColors.red
                anchors.centerIn: parent
            }
        }

        Item {
            width: parent.width
            height: units.gu(4)
            Label {
                text: "Version 2.0"
                fontSize: "large"
                color: UbuntuColors.lightAubergine
                anchors.centerIn: parent

            }
        }

        Item {
            width: parent.width
            height: units.gu(2)
        }

        Item {
            width: parent.width
            height: thankLabel.height + units.gu(2)
            Label {
                id: thankLabel
                text: qsTr("<b>Crédits</b><br />Jimmy Lejeune<br />Arnaud Ober<br />@Nymeria<br />@Kazord<br /><br /><br />ubuntouch-fr.org");
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
            }
        }
        Item {
            width: parent.width
            height: termLabel.height + units.gu(2)
            Label {
                 id: termLabel
                 text: qsTr("<a href=\"http://world.openfoodfacts.org/legal\">" + i18n.tr("Terms of use") + "</a>");
                 anchors.centerIn: parent
                 wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                 horizontalAlignment: Text.AlignHCenter
                 width: parent.width - units.gu(12)
            }
        }

    }
}
}
// ABOUT PAGE






}
