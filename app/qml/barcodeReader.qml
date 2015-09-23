/*import QtQuick 2.0
import Ubuntu.Components 1.1
import QtMultimedia 5.0
import Ubuntu.Content 0.1*/

import QtQuick 2.4
import Ubuntu.Components 1.1
import QtMultimedia 5.4
import Ubuntu.Content 1.1

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
        }
    }


    Camera {
        id: camera

        flash.mode: Camera.FlashTorch

        focus.focusMode: Camera.FocusContinuous
        focus.focusPointMode: Camera.FocusPointCenter

        Component.onCompleted: {
            captureTimer.start()
        }
    }

    Timer {
        id: captureTimer
        interval: 400
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

    Component.onCompleted: {
        qrCodeReader.scanRect = Qt.rect(mainView.mapFromItem(videoOutput, 0, 0).x, mainView.mapFromItem(videoOutput, 0, 0).y, videoOutput.width, videoOutput.height)
    }

    // We must use Item element because Screen component does not work with QtObject
    Item {
        id: device
        property string naturalOrientation: Screen.primaryOrientation == Qt.LandscapeOrientation ? "landscape" : "portrait"
        visible: false
    }

}


