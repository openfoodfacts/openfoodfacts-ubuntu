import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Qt.labs.settings 1.0
import Ubuntu.Components.Popups 0.1

Page {
    id: settingsPage

    title: i18n.tr("Developer settings")
    signal settingsChanged()
    Component.onCompleted: openFoodFacts.currentPage="Settings"

    head {
        foregroundColor: openFoodFacts.settings.fontColor;
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
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+"Developer settings"+"</font>"
                }

                ListItem.Standard {
                    showDivider: false
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("scanner from the home page")+"</font>"
                    control: Switch {
                        id: scanhomepageswitch
                        checked: openFoodFacts.settings.scanhomepage
                        onClicked: { openFoodFacts.settings.scanhomepage = checked;
                                     pageStack.clear();
                        }
                    }
                }





            }
        }
    }
}
