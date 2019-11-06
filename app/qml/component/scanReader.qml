/*import QtQuick 2.0
import Ubuntu.Components 1.1
import QtMultimedia 5.0
import Ubuntu.Content 0.1*/

import QtQuick 2.4
import Ubuntu.Components 1.3
import QtMultimedia 5.4
import CodeReader 1.0
import QtQuick.Window 2.0
import "qrc:///component/qml/component"



Item {
    id: grabCodePage

    QRCodeReader {
        id: qrCodeReader

        onValidChanged: {
            if (valid) {
                captureTimer.stop()
                pageStack.push(Qt.resolvedUrl("qrc:///qml/ProductView.qml"), {"barcode": qrCodeReader.text});
            }
        }
    }


    Camera {
        id: camera

        //                flash.mode: torchButton.active ? Camera.FlashTorch : Camera.FlashOff
        //                flash.mode: Camera.FlashTorch

        focus.focusMode: Camera.FocusContinuous
        focus.focusPointMode: Camera.FocusPointAuto

        /* Use only digital zoom for now as it's what phone cameras mostly use.
               TODO: if optical zoom is available, maximumZoom should be the combined
               range of optical and digital zoom and currentZoom should adjust the two
               transparently based on the value. */
        property alias currentZoom: camera.digitalZoom
        property alias maximumZoom: camera.maximumDigitalZoom

        function startAndConfigure() {
            start();
            focus.focusMode = Camera.FocusContinuous
            focus.focusPointMode = Camera.FocusPointAuto
        }
        Component.onCompleted: {
            captureTimer.start()
        }
    }

    Timer {
        id: captureTimer
        interval: 2000
        repeat: true
        onTriggered: {
            print("capturing");
            qrCodeReader.grab();
        }
    }


    VideoOutput {
        id: videoOutput
        anchors {
            fill: parent
        }
        fillMode: Image.PreserveAspectCrop

        orientation: {
            var angle = Screen.primaryOrientation == Qt.PortraitOrientation ? -90 : 0;
            angle += Screen.orientation == Qt.InvertedLandscapeOrientation ? 180 : 0;
            return angle;
        }
        source: camera
        focus: visible
        MouseArea {
            anchors.fill: parent;
            onClicked:  qrCodeReader.grab();
        }
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
    }



    Rectangle {
        id: barcodeZone
        x: videoOutput.width*2/8
        y: videoOutput.height*2/8
        width: videoOutput.width/2
        height: videoOutput.height/2
        border.color: "red"
        color:"transparent"
    }

    /*
    *   Fill the screen with a gray area
    *   like that, the user can focus on the barcode
    */
    Rectangle {
        id : mapGreyToTop
        color: "black"
        opacity: 0.6
        x: videoOutput.x;
        y: videoOutput.y;
        width: videoOutput.width;
        height: barcodeZone.y;

        Text {
            id: infoTexte
            text : i18n.tr("please, wait until the focus is done");
            font.bold: true;
            color:"white";
            width: parent.width
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Rectangle {
        id : mapGreyToBottom
        color: "black"
        opacity: 0.6
        x: videoOutput.x;
        y: (videoOutput.y + videoOutput.height) - barcodeZone.y
        width: videoOutput.width;
        height: barcodeZone.y;
    }
    Rectangle {
        id : mapGreyToLeft
        color: "black"
        opacity: 0.6
        x: videoOutput.x;
        y: mapGreyToTop.y + mapGreyToTop.height;
        width: barcodeZone.x - videoOutput.x;
        height: mapGreyToBottom.y - barcodeZone.y ;
    }

    Rectangle {
        id : mapGreyToRight
        color: "black"
        opacity: 0.6
        x: videoOutput.x + barcodeZone.x + barcodeZone.width;
        y: mapGreyToTop.y + mapGreyToTop.height;
        width: barcodeZone.x - videoOutput.x;
        height: mapGreyToBottom.y - barcodeZone.y ;
    }

    Component.onCompleted: {
        camera.startAndConfigure();
        //qrCodeReader.scanRect = Qt.rect(mainView.mapFromItem(videoOutput, 0, 0).x, mainView.mapFromItem(videoOutput, 0, 0).y, videoOutput.width, videoOutput.height)
        qrCodeReader.scanRect = Qt.rect(openFoodFacts.mapFromItem(barcodeZone, 0, 0).x, openFoodFacts.mapFromItem(barcodeZone, 0, 0).y, barcodeZone.width, barcodeZone.height);
        openFoodFacts.currentPage="BarcodeReader";
    }

    // We must use Item element because Screen component does not work with QtObject
    Item {
        id: device
        property string naturalOrientation: Screen.primaryOrientation == Qt.LandscapeOrientation ? "landscape" : "portrait"
        visible: false
    }

}


