import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Page {
    id: healtjournal

    title: i18n.tr("Healt journal");
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }
    Component.onCompleted: openFoodFacts.currentPage="healtjournal";

    head.sections.model: [
        (healtjournal.head.sections.selectedIndex === 0 ? i18n.tr("Summary") : "<font color=\"#FFFFFF\">" + i18n.tr("Summary") + "</font>"),
        (healtjournal.head.sections.selectedIndex === 1 ? i18n.tr("Food Diary") : "<font color=\"#FFFFFF\">" + i18n.tr("Food Diary") + "</font>"),
        (healtjournal.head.sections.selectedIndex === 2 ? i18n.tr("Exercise Diary") : "<font color=\"#FFFFFF\">" + i18n.tr("Exercise Diary") + "</font>")
    ]


    VisualItemModel {
        id: tabs


// Summary TAB
Item {
            width: tabView.width
            height: tabView.height

            Rectangle {
                anchors.fill: parent;
                color: "#EDEDEC"



                ListItem.Standard {
                    id: dateDiarySummary
                        onClicked: calendar.visible = !calendar.visible
                        Text {

                            text: calendar.selectedDate
                            anchors.centerIn: parent



                        Calendar{
                        id: calendar
                        anchors.topMargin: 0
                        anchors.top: dateDiarySummary.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        visible: false
                        activeFocusOnTab: true
                        onClicked: {
                            visible = false;
                        }
                        style: CalendarStyle {
                            gridVisible: false
                            }
                      }

                    }

                }

                    Rectangle {
                        anchors {
                            top: dateDiarySummary.bottom
                            left: parent.left
                            right: parent.right
                        }
                        color: "#EDEDEC"


                        Item {
                            anchors.fill: parent;

                            Icon {
                                id: emptyIcon
                                name: "bookmark"
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: units.gu(10)
                                width: height
                                color: "#BBBBBB"
                            }

                            Label {
                                id: emptyLabel
                                text: "Not implemented"
                                color: "#5d5d5d"
                                font.bold: true
                                wrapMode: Text.WordWrap
                                anchors.top: emptyIcon.bottom
                                anchors.topMargin: units.gu(4)
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Label {
                                id: emptySublabel
                                text: "Page not finished yet"
                                color: "#7b7b7b"
                                wrapMode: Text.WordWrap
                                anchors.top: emptyLabel.bottom
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }


    }
} //Summary TAB

// Food Diary TAB
Item {
            width: tabView.width
            height: tabView.height

            Rectangle {
                anchors.fill: parent;
                color: "#EDEDEC"
                    Rectangle {
                        anchors {
                            top: parent.top
                            left: parent.left
                            right: parent.right
                        }
                        anchors.topMargin: units.gu(5);
                        color: "#EDEDEC"

                        Item {
                            anchors.fill: parent;

                            Image {
                                id: emptyIcon2
                                source: Qt.resolvedUrl("qrc:/images/OpenFoodFacts/plate.png");
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: units.gu(10)
                                width: height
                            }

                            Label {
                                id: emptyLabel2
                                text: "Not implemented"
                                color: "#5d5d5d"
                                font.bold: true
                                wrapMode: Text.WordWrap
                                anchors.top: emptyIcon2.bottom
                                anchors.topMargin: units.gu(4)
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Label {
                                id: emptySublabel2
                                text: "Page not finished yet"
                                color: "#7b7b7b"
                                wrapMode: Text.WordWrap
                                anchors.top: emptyLabel2.bottom
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }


    }
} //Food Diary TAB

// Exercice Diary TAB
Item {
            width: tabView.width
            height: tabView.height

            Rectangle {
                anchors.fill: parent;
                color: "#EDEDEC"
                    Rectangle {
                        anchors {
                            top: parent.top
                            left: parent.left
                            right: parent.right
                        }
                        anchors.topMargin: units.gu(5);
                        color: "#EDEDEC"

                        Item {
                            anchors.fill: parent;

                            Image {
                                id: emptyIcon3
                                source: Qt.resolvedUrl("qrc:/images/OpenFoodFacts/runman.png");
                                anchors.horizontalCenter: parent.horizontalCenter
                                height: units.gu(10)
                                width: height
                            }

                            Label {
                                id: emptyLabel3
                                text: "Not implemented"
                                color: "#5d5d5d"
                                font.bold: true
                                wrapMode: Text.WordWrap
                                anchors.top: emptyIcon3.bottom
                                anchors.topMargin: units.gu(4)
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Label {
                                id: emptySublabel3
                                text: "Page not finished yet"
                                color: "#7b7b7b"
                                wrapMode: Text.WordWrap
                                anchors.top: emptyLabel3.bottom
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }


    }
} //Exercice Diary TAB




   } //VisualItemModel

    ListView {
        id: tabView

        model: tabs
        interactive: false
        anchors.fill: parent
        orientation: Qt.Horizontal
        snapMode: ListView.SnapOneItem
        currentIndex: healtjournal.head.sections.selectedIndex
        highlightMoveDuration: UbuntuAnimation.SlowDuration
    }

}
