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



Page {
    id: grabCodePage
    title: i18n.tr("Reading barcode");
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }

    QRCodeReader {
        id: qrCodeReader

        onValidChanged: {
            if (valid) {
                captureTimer.stop()
                var barcodeValue = qrCodeReader.text;
                pageStack.pop();
                pageStack.push(Qt.resolvedUrl("qrc:///qml/ProductView.qml"), {"barcode": barcodeValue});
            }
        }
    }


    Camera {
        id: camera

        flash.mode: Camera.FlashTorch
        digitalZoom: ((maximumDigitalZoom > 2)? 2 : maximumDigitalZoom)
        focus.focusMode: Camera.FocusContinuous
        focus.focusPointMode: Camera.FocusPointAuto

        Component.onCompleted: {
            captureTimer.start()
        }
    }

    Timer {
        id: captureTimer
        interval: 1200
        repeat: true
        onTriggered: {
            print("capturing");
            qrCodeReader.grab();
        }
    }

    VideoOutput {
        id:videoOutput
        anchors {
            fill: parent
        }

        fillMode: Image.PreserveAspectCrop
        orientation: device.naturalOrientation === "portrait"  ? -90 : 0
        source: camera
        focus: visible
        MouseArea {
            anchors.fill: parent;
            onClicked:  qrCodeReader.grab();
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


