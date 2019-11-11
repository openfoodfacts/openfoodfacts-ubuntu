import QtQuick 2.4
import Ubuntu.Components 1.3
import Qt.labs.settings 1.0
import Ubuntu.Components.Popups 0.1
import QtGraphicalEffects 1.0

Page {
    id: settingsPage

    signal settingsChanged()
    Component.onCompleted: openFoodFacts.currentPage="Settings"


    header: PageHeader {
        title: i18n.tr("Settings")

       trailingActionBar {
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
   }


    Item {
        id:main
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }

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
                    bottom: parent.bottom
                }

                ListItem {
                    height: layout2.height + (divider.visible ? divider.height : 0)
                    ListItemLayout {
                        id: layout2
                        title.text: i18n.tr("Global")
                    }
                }
             
                
            ListItem {
                height: layout.height + (divider.visible ? divider.height : 0)
                    divider.visible: false
                ListItemLayout {
                    id: layout
                    title.text: i18n.tr("Allergen")
                      
                            
                        Item{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/3
                                width: parent.height/3
                                    
                                Icon {
                                    name: "next"
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundSecondaryText
                                    visible: false
                                    id: nextImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: nextImage
                                     color: theme.palette.normal.backgroundSecondaryText
                                     antialiasing: true
                                 }
                            }
                            
                    }
    
                        MouseArea {
                            anchors.fill: parent
                            onClicked: pageStack.push(Qt.resolvedUrl("Allergen.qml")); 
                        }
    

                    }
                


                    ListItem {
                        height: layout6.height + (divider.visible ? divider.height : 0)
                            
                        MouseArea {
                            anchors.fill: parent
                            onClicked: pageStack.push(Qt.resolvedUrl("SettingsDeveloper.qml")); 
                        }
                        ListItemLayout {
                            id: layout6
                            title.text: i18n.tr("Developer settings")
                                
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    name: "security-alert"
                                    antialiasing: true
                                    color: "#ED3146"
                                    visible: false
                                    id: saltImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: saltImage
                                     color: "#ED3146"
                                     antialiasing: true
                                 }
                            }  
                            
                        Item{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/3
                                width: parent.height/3
                                    
                                Icon {
                                    name: "next"
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundSecondaryText
                                    visible: false
                                    id: nestImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: nestImage
                                     color: theme.palette.normal.backgroundSecondaryText
                                     antialiasing: true
                                 }
                            }
                            
                            
                        }
                    }


            }
        }
    }
}
