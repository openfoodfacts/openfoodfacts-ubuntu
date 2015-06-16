import QtQuick 2.4
import Ubuntu.Components 1.2

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "openfoodfacts.ubuntouch-fr"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    width: units.gu(100)
    height: units.gu(75)

    PageStack {
        id: pageStack
        Component.onCompleted: push(pageMain)
        Page {
            title: i18n.tr("OpenFoodFacts")
            id:pageMain

            Button {
                objectName: "button"
                width: parent.width

                text: i18n.tr("Take a picture")

                onClicked: {
                    var barcodeValue = "3029330003533";
                    console.log("picture tooken with barcode = " + barcodeValue);
                    pageStack.push(Qt.resolvedUrl("qml/ProductView.qml", {barcode: barcodeValue}))
                }
            }

        }
    }
}


