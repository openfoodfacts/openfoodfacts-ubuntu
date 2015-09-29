/*import QtQuick 2.0
import Ubuntu.Components 1.1
import QtMultimedia 5.0
import Ubuntu.Content 0.1*/

import QtQuick 2.4
import Ubuntu.Components 1.1
import QtMultimedia 5.4
import Ubuntu.Content 1.1
import QtSensors 5.3

import Ubuntu.Components.ListItems 1.0
import Ubuntu.Components.Popups 1.0
import CodeReader 1.0
import QtQuick.Window 2.0
import "qrc:///component/qml/component"



Page {
    id: grabCodePage
    title: i18n.tr("Reading barcode")

    QRCodeReader {
        id: qrCodeReader

        onValidChanged: {
            if (valid) {
                var barcodeValue = qrCodeReader.text;
                pageStack.push(Qt.resolvedUrl("qrc:///qml/ProductView.qml"), {"barcode": barcodeValue});
                //pageStack.pop();
            }
            else {
                mycamera.unlock();
                captureTimer.restart();
            }

        }
    }

    Item {


        anchors {
            fill: parent
        }

        Camera {
            id: mycamera

            flash.mode: Camera.FlashTorch

            focus.focusMode:  Camera.FocusContinuous // +Camera.FocusMacro
            focus.focusPointMode: Camera.FocusPointCenter

            onLockStatusChanged: {
                mytext.text = mycamera.lockStatus
                if(mycamera.lockStatus === Camera.Locked) {
                    mycamera.imageCapture.captureToLocation('./toto.jpg');
                    //mytext.text = "captured"
                    //mycamera.imageCapture.capture();
                    captureTimer.stop();
                }

            }

            imageCapture {
                    onImageCaptured: {
                        photopreview.source = preview
                        //mytext.text = capturedImagePath
                        //preview can be use for decode, but imageSaved have better quality
                    }

                    onImageSaved: {
                        //print(path)
                        //mytext2.text = "decoding"
                        qrCodeReader.decode(path);
                    }

                    onCaptureFailed: {
                        mytext.text = message;
                    }
            }

//        Component.onCompleted: {
//            captureTimer.start()
//        }
    }

    Image {
        anchors {
            fill: parent
        }
        id: photopreview
    }

    Timer {
        id: captureTimer
        interval: 200
        repeat: true
        onTriggered: {
           // -100 is gravity*gravity approximation
           var accel = -100+accelero.reading.x*accelero.reading.x + accelero.reading.y*accelero.reading.y + accelero.reading.z*accelero.reading.z;
           if(1 > accel && -1 < accel)
            {
               mycamera.searchAndLock();
               //captureTimer.stop();
           }
           else
               mytext.text = accel;

            //mytext.text = accelero.accelerationMode;
            //print("capturing");
//            qrCodeReader.grab();
        }
    }

    VideoOutput {
        id:videoOutput
        anchors {
            fill: parent
        }
        fillMode: Image.PreserveAspectCrop
        orientation: device.naturalOrientation === "portrait"  ? -90 : 0
        source: mycamera
        focus: visible
        MouseArea {
            anchors.fill: parent;
            onClicked: mycamera.searchAndLock()
        }
    }
    Item {
        width: parent.width
        height: units.gu(16)
        Label {
            width:parent.width
            id:mytext
            text: "Infos"
            horizontalAlignment: Text.AlignRight
            wrapMode: Text.WordWrap
            fontSize: "small"
            color: UbuntuColors.lightAubergine
            anchors.centerIn: parent

        }
    }


    Accelerometer {
        id:accelero
    }

    Component.onCompleted: {
        captureTimer.start();
        accelero.accelerationMode = Accelerometer.Combined;
        accelero.active = true;
    }

}
    /*Label {
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
            margins: units.gu(1)
        }
        text: i18n.tr("Scan a QR Code containing account information")
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        fontSize: "large"
    }*/

//    Component.onCompleted: {
//        qrCodeReader.scanRect = Qt.rect(mainView.mapFromItem(videoOutput, 0, 0).x, mainView.mapFromItem(videoOutput, 0, 0).y, videoOutput.width, videoOutput.height)
//    }

    // We must use Item element because Screen component does not work with QtObject
//    Item {
//        id: device
//        property string naturalOrientation: Screen.primaryOrientation == Qt.LandscapeOrientation ? "landscape" : "portrait"
//        visible: false
//    }

}


