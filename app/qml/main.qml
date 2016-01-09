import QtQuick 2.4
import Ubuntu.Components 1.3
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
//import Ubuntu.Components.Themes 1.0
import "qrc:///component/qml/component"


MainView {
    id: openFoodFacts
    objectName: "openFoodFacts"
    applicationName: "openfoodfacts.ubuntouch-fr"

    property variant myallergen: []

    width: units.gu(40)
    height: units.gu(68)

    //Theme.name = "Ubuntu.Components.Themes.SuruDark"
    headerColor: openFoodFacts.settings.color;

    /* theme.palette: Palette {
           normal.background: UbuntuColors.blue
       }
    Component.onCompleted: { console.log(i18n.domain)
        console.log(i18n.language)
        if(settings.allergen === undefined)
            settings.allergen = []
    }*/

    // persistent app settings:
    property var settings: Settings {

        property bool visiblecomposition: true
        property bool visiblenutrition:	true
        property bool visibleingredient:	true
        property bool visiblecharacteristics:	true

        property string color:  '#48c1ba'
        property string fontColor : "white";

        property var allergen: undefined

        property bool developerModeEnabled:	false

        property ListModel historyModel: ListModel {
            id: historyListModel;
        } // listModel

    }

    PageStack {
        id: pageStack
        height: parent.height
        Component.onCompleted: {
            push(mainpage);
        }
        Page {
            title: i18n.tr("OpenFoodFacts")
            id: mainpage

            head {
                actions: [
                    Action {
                        text: i18n.tr("Settings")
                        iconName: "settings"
                        onTriggered: {
                            pageStack.push(Qt.resolvedUrl("Settings.qml"));
                        }
                    }
                ]
                foregroundColor: openFoodFacts.settings.fontColor;
            }


            Rectangle {
                id:rect1
                anchors.fill:parent
                color: "#EDEDEC"
                Column {
                    spacing: units.gu(2)
                    anchors {
                        right: parent.right
                        left: parent.left

                    }

                    Rectangle {
                        id: headerpicture
                        width: parent.width;
                        height: units.gu(20)
                        color: "#EDEDEC"

                        Image {
                            id : picturebackgroundtop;
                            source:"nutrition.jpg";
                            width: parent.width;
                            height: units.gu(15)
                            fillMode: Image.PreserveAspectCrop

                        }

                        Image {
                            id : productImage;
                            fillMode: Image.PreserveAspectCrop
                            visible: false // Do not forget to make original pic insisible
                        }


                        Rectangle {
                            id: mask
                            anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: picturebackgroundtop.bottom;
                            width: units.gu(9)
                            height: units.gu(9)
                            color: "#EDEDEC"
                            radius: 120
                            clip: true
                            visible: true

                            Rectangle {
                                id: mask2
                                anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: mask.verticalCenter;
                                width: units.gu(8)
                                height: units.gu(8)
                                color: openFoodFacts.settings.color;
                                radius: 120
                                clip: true
                                visible: true

                                Icon {
                                    id: shootIcon
                                    name: "camera-app-symbolic"
                                    anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
                                    width: units.gu(5)
                                    height: units.gu(5)
                                    color: "#FFFFFF"
                                }
                            }

                            MouseArea {
                                anchors.fill: mask
                                onClicked: {
                                    pageStack.push(Qt.resolvedUrl("barcodeReader.qml"));
                                }
                                onPressed: {
                                    backgroundImage.color = "#29b3ab" }
                                onReleased: {
                                    backgroundImage.color = "#48c1ba" }
                            }
                        }
                    } // header picture


                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: units.gu(1)

                        TextField {
                            id: barcodeinput
                            height: units.gu(4)
                            placeholderText: i18n.tr("Enter your product's name or product's barcode")
                            //inputMethodHints : Qt.ImhDigitsOnly
                        }


                        Button {
                            objectName: "envoyer"
                            width: units.gu(4)
                            height: units.gu(4)
                            iconName: "search"
                            onClicked: {
                                function isNumeric(n) {
                                    return !isNaN(parseFloat(n)) && isFinite(n);
                                }

                                var searchValue = barcodeinput.text;

                                // if it's a barcode
                                if (isNumeric(searchValue)) {
                                    pageStack.push(Qt.resolvedUrl("ProductView.qml"), {"barcode": searchValue});
                                } else {
                                     pageStack.push(Qt.resolvedUrl("ProductSearchResult.qml"), {"productNameSearch": searchValue});
                                }
                            }
                        } // send button

                    }
                }
            }
        }
    }

    RadialBottomEdge {
        id:radialBottom;
        actions: [

            RadialAction {
                iconName: "search"
                iconColor: UbuntuColors.coolGrey
                onTriggered : {
                    if (pageStack.depth > 0) {
                        pageStack.clear();
                    }
                    pageStack.push(mainpage);
                }
            },

            RadialAction {
                iconName: "add"
                iconColor: "white"
                backgroundColor: UbuntuColors.green
                onTriggered: {
                    pageStack.push(Qt.resolvedUrl("addproduct.qml"));
                }
            },

            RadialAction {
                iconName: "settings"
                iconColor: UbuntuColors.coolGrey
                onTriggered: {
                    pageStack.push(Qt.resolvedUrl("Settings.qml"));
                }
            },

            RadialAction {
                iconName: "browser-timeline"
                iconColor: UbuntuColors.coolGrey
                onTriggered: {
                    pageStack.push(Qt.resolvedUrl("history.qml"));
                }
            }


        ]
    }

}
