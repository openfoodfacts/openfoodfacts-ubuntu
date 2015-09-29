/*
import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Content 0.1
*/

import QtQuick 2.4
import Ubuntu.Components 1.1
import Ubuntu.Content 1.1
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0

import "qrc:///component/qml/component"


MainView {
    id: openFoodFacts
    objectName: "openFoodFacts"
    applicationName: "openfoodfacts.ubuntouch-fr"

    width: units.gu(40)
    height: units.gu(68)

    useDeprecatedToolbar: false
    backgroundColor: "#48c1ba"
    Component.onCompleted: { console.log(i18n.domain)
        console.log(i18n.language)}
//        //Theme.name = "Ubuntu.Components.Themes.SuruDark"
//        console.log("domaine")
//    }
    // persistent app settings:
    property var settings: Settings {
        property bool visiblecomposition: true
        property bool visiblenutrition:	true
        property bool visibleingredient:	true
        property bool visiblecharacteristics:	true
        //property string userallergen:	text
        property bool developerModeEnabled:	false

    }

    PageStack {
        id: pageStack
        //Component.onCompleted: {
            //push(Qt.resolvedUrl("barcodeReader.qml"));
            //push(pageMain)
        //}
        height: parent.height
        Component.onCompleted: push(mainpage)


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
                        source:"shoot.png";
                        fillMode: Image.PreserveAspectCrop
                        visible: false // Do not forget to make original pic insisible
                    }

                    Rectangle {
                        id: mask
                        anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: picturebackgroundtop.bottom;
                        width: units.gu(9)
                        height: units.gu(9)
                        color: "#48c1ba";
                        radius: 120
                        clip: true
                        visible: true

                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
                            width: units.gu(8)
                            height: units.gu(8)
                            source:"shoot.png";
                            fillMode: Image.PreserveAspectCrop
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
                        placeholderText: i18n.tr("Enter your barcode")
                        inputMethodHints : Qt.ImhDigitsOnly
                    }


                    Button {
                        objectName: "envoyer"
                        width: units.gu(4)
                        height: units.gu(4)
                        iconName: "search"

                        onClicked: {
                            var barcodeValue = barcodeinput.text;
                            pageStack.push(Qt.resolvedUrl("ProductView.qml"), {"barcode": barcodeValue});
                        }
                    }

                }
            }
        }
    }   }
/*
    RadialBottomEdge {
        id:radialBottom;
        actions: [

            RadialAction {
                iconName: "search"
                iconColor: UbuntuColors.coolGrey
                onTriggered : {
                    pageStack.pop();
                    //pageStack.push(Qt.resolvedUrl("main.qml"));
                }
            },

            RadialAction {
                iconName: "add"
                iconColor: "white"
                backgroundColor: UbuntuColors.green
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
                onTriggered: console.log("History")
            }


        ]
    }
*/
    Connections {
        target: ContentHub
        onExportRequested: {
            // show content picker
            print("******* transfer requested!");
            /*pageStack.pop();
                pageStack.push(generateCodeComponent, {transfer: transfer})*/
        }
        onImportRequested: {
            print("**** import Requested")
            var filePath = String(transfer.items[0].url).replace('file://', '');
            //imageToDecode.source=filePath;
            //qrCodeReader.processImage(filePath);
        }

        onShareRequested: {
            print("***** share requested", transfer)
            var filePath = String(transfer.items[0].url).replace('file://', '')
            //imageToDecode.source=filePath;
            //qrCodeReader.processImage(filePath);
        }
    }

    property list<ContentItem> importItems
    property string imagesource: ""
    property var activeTransfer: null
    property bool decodingImage: false
    ContentPeer {
        id: picSourceSingle
        contentType: ContentType.Pictures
        handler: ContentHandler.Source
        selectionType: ContentTransfer.Single
    }
    ContentTransferHint {
        id: importHint
        anchors.fill: parent
        activeTransfer: openFoodFacts.activeTransfer
        z: 100
    }
    Connections {
        target: openFoodFacts.activeTransfer
        onStateChanged: {
            switch (mainView.activeTransfer.state) {
            case ContentTransfer.Charged:
                print("should process", activeTransfer.items[0].url)
                mainView.decodingImage = true;
                mainView.imagesource = activeTransfer.items[0].url;
                //imageToDecode.source=activeTransfer.items[0].url;
                mainView.activeTransfer = null;
                break;
            case ContentTransfer.Aborted:
                mainView.activeTransfer = null;
                break;
            }
        }
    }

    onImagesourceChanged: {
        //decoder.decodeImageFromFile(mainView.imagesource, 900,900,true);
    }



    /* Page {
        title: i18n.tr("OpenFoodFacts")
        id:pageMain

        head {
            actions: [

                Action {
                    // TRANSLATORS: Name of an action in the toolbar to import pictures from other applications and scan them for codes
                    text: i18n.tr("Import image")
                    iconName: "insert-image"
                    onTriggered: {
                        mainView.activeTransfer = picSourceSingle.request()
                        print("transfer request", mainView.activeTransfer)
                    }
                }
            ]
        }
        Rectangle {
            anchors.fill:parent
            color: "#EDEDEC"
            Column {
                spacing: units.gu(2)
                anchors {
                    margins: units.gu(2)
                    right: parent.right
                    left: parent.left

                }
                Button {
                    objectName: "button"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.gu(30)

                    text: i18n.tr("Detect barcode")

                    onClicked: {
                        pageStack.push(Qt.resolvedUrl("qrc:///qml/barcodeReader.qml"));
                    }
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: units.gu(1)

                    TextField {
                        id: barcodeinput
                        height: units.gu(4)
                        placeholderText: "Enter your barcode"
                        text : "3029330003533"
                        inputMethodHints : Qt.ImhDigitsOnly
                    }

                    Button {
                        objectName: "envoyer"
                        width: units.gu(4)
                        height: units.gu(4)
                        iconName: "search"

                        onClicked: {
                            var barcodeValue = barcodeinput.text;
                            pageStack.push(Qt.resolvedUrl("ProductView.qml"), {"barcode": barcodeValue});
                        }
                    }

                }
            }
        }//rectangle
    } // page
    */

}
