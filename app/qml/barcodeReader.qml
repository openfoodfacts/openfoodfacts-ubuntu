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
            console.log("valid changed"+valid)
            if (valid) {
                captureTimer.stop();
                mytext.text = "barcode found"

                var barcodeValue = qrCodeReader.text;
                pageStack.push(Qt.resolvedUrl("qrc:///qml/ProductView.qml"), {"barcode": barcodeValue});
                //pageStack.pop();
            }
            else {
                mytext.text = "no barcode found"
                mycamera.unlock();
                captureTimer.start();
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
            exposure {
                exposureMode: Camera.ExposureAuto
            }
            focus.focusMode:  Camera.FocusContinuous // +Camera.FocusMacro
            focus.focusPointMode: Camera.FocusPointCenter

            onLockStatusChanged: {
                mytext.text = mycamera.lockStatus
                if(mycamera.lockStatus === Camera.Locked) {
                    mytext.text = "looking for barccode"
                    captureTimer.stop();
                    qrCodeReader.grab();
                    //mycamera.imageCapture.captureToLocation(qrCodeReader.tmp);
                }

            }

            /*imageCapture {
                onImageCaptured: {
                    photopreview.source = preview;
                    //mytext.text = capturedImagePath
                    //preview can be use for decode, but imageSaved have better quality
                    //qrCodeReader.decode(preview);
                }

                onImageSaved: {
                    //print(path)
                    mytext.text = path;
                    qrCodeReader.decode(path);
                    //                        //mytext.text = "decode return"
                }

                onCaptureFailed: {
                    mytext.text = message;
                    //mycamera.unlock();
                    //captureTimer.restart();
                }
            }*/

            //        Component.onCompleted: {
            //            captureTimer.start()
            //        }
        }


        Timer {
            property real lx: 0
            property real ly: 0
            property real lz: 0
            property real psi: 0.1
            id: captureTimer
            interval: 200
            repeat: true
            onTriggered: {

                if(captureTimer.lx - accelero.reading.x < captureTimer.psi && captureTimer.lx - accelero.reading.x > -1*captureTimer.psi
                        && captureTimer.ly - accelero.reading.y < captureTimer.psi && captureTimer.ly - accelero.reading.y > -1*captureTimer.psi
                        && captureTimer.lz - accelero.reading.z < captureTimer.psi && captureTimer.lz - accelero.reading.z > -1*captureTimer.psi
                        )
                {
                    if(mycamera.imageCapture.ready) {
                        mycamera.searchAndLock();
                        captureTimer.stop();
                    }
                }

                captureTimer.lx = accelero.reading.x
                captureTimer.ly = accelero.reading.y
                captureTimer.lz = accelero.reading.z
            }
        }

        VideoOutput {
            id:videoOutput
            anchors {
                fill: parent
            }
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectCrop
            orientation: device.naturalOrientation === "portrait"  ? -90 : 0
            source: mycamera
            focus: visible
            MouseArea {
                anchors.fill: parent;
                onClicked: mycamera.searchAndLock()
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


    Component.onCompleted: {
        qrCodeReader.scanRect = Qt.rect(mainView.mapFromItem(barcodeZone, 0, 0).x, mainView.mapFromItem(barcodeZone, 0, 0).y, barcodeZone.width, barcodeZone.height)
    }

    // We must use Item element because Screen component does not work with QtObject
    Item {
        id: device
        property string naturalOrientation: Screen.primaryOrientation == Qt.LandscapeOrientation ? "landscape" : "portrait"
        visible: false
    }

}


