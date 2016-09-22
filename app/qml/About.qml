import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Popups 1.0

Page {
    id: about

    title: i18n.tr("About");
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }


    head.sections.model: [
        (about.head.sections.selectedIndex === 0 ? i18n.tr("About"):"<font color='white'>"+i18n.tr("About")+"</font>"),
        (about.head.sections.selectedIndex === 1 ? i18n.tr("ChangeLog"):"<font color='white'>"+i18n.tr("ChangeLog")+"</font>"),
    ]

    VisualItemModel {
        id: tabs
// ABOUT PAGE
Item {
      width: tabView.width
      height: tabView.height
    Column {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
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
                text: "Version 1.4.1"
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
// ABOUT PAGE


// Changelog PAGE
Item {
      width: tabView.width
      height: tabView.height
      Flickable {
          id: flickable
          anchors.fill: parent
          contentHeight: itemchangelog.height
          flickableDirection: Flickable.VerticalFlick
          clip: true

      Item {
          id: itemchangelog
          width: parent.width
          height: changelog.height + units.gu(2)
          Label {
               id: changelog
               text: "
1.4.1
- New api for product view
- Update language
- Add delete settings in developer
- Add nutritional rating in first

1.4.0
- correct bug with scan barecode

1.3.2
- Add changeLog to about page
- Correct bug header in welcome wizard
- Update language

1.3.1
- Change name to \"Open Food Facts\"
- Change icon to official
- Change translate \"transifex\" to \"Launchpad\"
- Some bugfix
- Update language

1.3.0
- allergen detection
- some bugfix
- remove item from history
- New design for product page with expand data
- Add Welcome Wizard (thanks Podbird)

1.2.1
- Correct bug scan product with Component.onCompleted set multiple times

1.2.0
- Update language
- Add Croatian, German, Dutch, Polish, Spanish, Portuguese and Chinese Simplified : https://www.transifex.com/ubuntouch-fr/openfoodfacts-1
- Add barecode in page product not found
- Correct bug return of page product
- add radial button for better user experience
- improve barcode detection (better than android version)
- Update Ubuntu.Components 1.3
- Now, you can search a product by it's name

1.1.7
- Theme (choose color of app)
- Add Italian translation
- Update French translation

1.1.6
- Page des produits non trouvé remis à neuf
- Bouton de scan avec bordure revue
- Indicateur de chargement de produit ajouté

1.0.0
- First version

"
               anchors.centerIn: parent
               wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
               width: parent.width - units.gu(3)
          }
      }
      }
}
// Changelog PAGE
    }

    ListView {
        id: tabView

        model: tabs
        interactive: false
        anchors.fill: parent
        orientation: Qt.Horizontal
        snapMode: ListView.SnapOneItem
        currentIndex: about.head.sections.selectedIndex
        highlightMoveDuration: UbuntuAnimation.SlowDuration
    }



}
