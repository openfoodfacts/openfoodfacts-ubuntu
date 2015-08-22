import QtQuick 2.0
import Ubuntu.Components 1.1
import QtMultimedia 5.0
import Ubuntu.Content 0.1

/*
import QtQuick 2.4
import Ubuntu.Components 1.1
import QtMultimedia 5.4
import Ubuntu.Content 1.1
*/
import "qrc:///component/qml/component"


MainView {
    id: mainView
    objectName: "mainView"
    applicationName: "openfoodfacts.ubuntouch-fr"

    width: units.gu(40)
    height: units.gu(68)

    useDeprecatedToolbar: false
    backgroundColor: "#48c1ba"
    Component.onCompleted: {
        //Theme.name = "Ubuntu.Components.Themes.SuruDark"
        i18n.domain = "OpenFoodFacts"
    }

    PageStack {
        id: pageStack
        Component.onCompleted: {
        push(Qt.resolvedUrl("barcodeReader.qml"));
         //push(pageMain)
        }

        height: parent.height
    }

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
        activeTransfer: mainView.activeTransfer
        z: 100
    }
    Connections {
        target: mainView.activeTransfer
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

    RadialBottomEdge {
        actions: [

            RadialAction {
                iconName: "settings"
                iconColor: UbuntuColors.coolGrey
            },

            RadialAction {
                iconName: "search"
                iconColor: UbuntuColors.coolGrey
                onTriggered : {
                    var barcodeValue = 3029330003533;
                     pageStack.push(Qt.resolvedUrl("ProductView.qml"), {"barcode": barcodeValue});
                }
            },

            RadialAction {
                iconName: "save"
                iconColor: "white"
                enabled: false
                backgroundColor: UbuntuColors.green
                onTriggered: console.log("save")
            },

            RadialAction {
                iconName: "add"
                iconColor: "white"
                backgroundColor: UbuntuColors.green
            }

        ]
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
