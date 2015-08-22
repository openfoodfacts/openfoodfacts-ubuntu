import QtQuick 2.0
import Ubuntu.Components 1.1
import QZXing 2.3
import QtMultimedia 5.4
import Ubuntu.Content 1.1
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    id: mainView
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "qfacts.nymeria"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false
    width: units.gu(40)
    height: units.gu(68)

    PageStack {
        id: pageStack
        Component.onCompleted: {
            pageStack.push(readerpage)
        }
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
            imageToDecode.source=filePath;
            //qrCodeReader.processImage(filePath);
        }

        onShareRequested: {
            print("***** share requested", transfer)
            var filePath = String(transfer.items[0].url).replace('file://', '')
            imageToDecode.source=filePath;
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
        decoder.decodeImageFromFile(mainView.imagesource, 900,900,true);
    }

    Page {
        id:readerpage
        title: i18n.tr("Barcode reader")

        Component.onCompleted: {
            //qrCodeReader.scanRect = Qt.rect(mainView.mapFromItem(videoOutput, 0, 0).x, mainView.mapFromItem(videoOutput, 0, 0).y, videoOutput.width, videoOutput.height)
        }

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

        Text {
            id: idtext;
            text: "nothing";
        }



        QZXing{
            id: decoder
            enabledDecoders: QZXing.DecoderFormat_EAN_8 | QZXing.DecoderFormat_EAN_13

            onDecodingStarted: console.log("Decoding of image started...")

            onTagFound: {
                idtext.text=tag;
                console.log("Barcode data: " + tag)
            }
            onDecodingFinished: console.log("Decoding finished " + (succeeded==true ? "successfully" :    "unsuccessfully") )
        }

        /*Camera {
            id: camera
            flash.mode: Camera.FlashTorch
            focus.focusMode: Camera.FocusContinuous
            focus.focusPointMode: Camera.FocusPointAuto

            property alias currentZoom: camera.digitalZoom
            property alias maximumZoom: camera.maximumDigitalZoom

            function startAndConfigure() {
                start();
                focus.focusMode = Camera.FocusContinuous
                focus.focusPointMode = Camera.FocusPointAuto
            }
        }

        VideoOutput {
            id: videoOutput
            anchors {
                fill: parent
            }
            fillMode: Image.PreserveAspectCrop
            orientation: device.naturalOrientation === "portrait"  ? -90 : 0
            source: camera
            focus: visible
            //visible: pageStack.depth == 1 && !mainView.decodingImage

        }
        PinchArea {
            id: pinchy
            anchors.fill: parent

            property real initialZoom
            property real minimumScale: 0.3
            property real maximumScale: 3.0
            property bool active: false

            onPinchStarted: {
                print("pinch started!")
                active = true;
                initialZoom = camera.currentZoom;
            }
            onPinchUpdated: {
                print("pinch updated")
                var scaleFactor = MathUtils.projectValue(pinch.scale, 1.0, maximumScale, 0.0, camera.maximumZoom);
                camera.currentZoom = MathUtils.clamp(initialZoom + scaleFactor, 1, camera.maximumZoom);
            }
            onPinchFinished: {
                active = false;
            }
        }*/




    }
}
