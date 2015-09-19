import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem

Page {
    id: about

    title: i18n.tr("About")

    Column {
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        anchors.topMargin: units.gu(5)

        Item {
            width: parent.width
            height: units.gu(6)
            Label {
                text: qsTr("OpenFoodFacts")
                anchors.centerIn: parent
                fontSize: "x-large"
            }
        }

        Item {
            width: parent.width
            height: units.gu(15)

            UbuntuShape {
                radius: "medium"
                image: Image {
                    source: Qt.resolvedUrl("OpenFoodFacts.png")
                }
                height: units.gu(12); width: height
                anchors.centerIn: parent


            }
        }

        Item {
            width: parent.width
            height: units.gu(8)
            Label {
                text: "Version 1.1"
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
                text: qsTr("<b>Crédits</b><br />Jimmy Lejeune<br />Arnaud Ober<br />@Nymeria<br />@Kazord<br /><br /><br />ubuntouch-fr.org")
                anchors.centerIn: parent
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                width: parent.width - units.gu(12)
            }
        }


    }
}
