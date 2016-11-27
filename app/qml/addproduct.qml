import QtQuick 2.4
import Ubuntu.Components 1.3
import ProductAdder 1.0
import QtMultimedia 5.4

Page {
    id: addproductmain

    header: PageHeader {
        id: pageHeader
        title: i18n.tr("Add product")
        StyleHints {
            foregroundColor: openFoodFacts.settings.fontColor;
            backgroundColor: openFoodFacts.settings.color;
        }

    }

    Product {
        id:productAdder
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

    }


    VideoOutput {
        id: videoOutput
        anchors { fill: parent; topMargin: pageHeader.height }
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
            onClicked:  {
                productAdder.addPicture("123654789877", "front");
                camera.stop();
            }
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
        id: captureZone
        x: videoOutput.x
        y: videoOutput.y
        width: videoOutput.width
        height: videoOutput.height *0.85
        border.color: "red"
        border.width: 1
        color:"transparent"
    }

    Rectangle {
        id : mapGreyToBottom
        color: "black"
        opacity: 0.8
        x: captureZone.x
        y: videoOutput.y + captureZone.height;
        width: videoOutput.width
        height: addproductmain.height - captureZone.height;
        Text {
            id: tapToRecord
            text: i18n.tr("tape to take a picture");
            color: "white"
            font.family: "Helvetica"
            font.pointSize: 24
        }
    }


    Button {
        text: "grabme"
        onClicked: {
            productAdder.grab();

        }
    }
    Component.onCompleted: {
        openFoodFacts.currentPage="addproduct"
        productAdder.scanRect = Qt.rect(openFoodFacts.mapFromItem(captureZone, 0, 0).x, openFoodFacts.mapFromItem(captureZone, 0, 0).y, captureZone.width, captureZone.height);
    }
}
