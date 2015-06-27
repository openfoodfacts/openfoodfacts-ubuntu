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
        height: parent.height

        Page {
            title: i18n.tr("OpenFoodFacts")
            id:pageMain

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

                text: i18n.tr("Take a picture")

                onClicked: {
                    var barcodeValue = "3103220022696";
                    console.log("picture tooken with barcode = " + barcodeValue);
                    pageStack.push(Qt.resolvedUrl("qml/ProductView.qml"), {"barcode": barcodeValue});
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
                          pageStack.push(Qt.resolvedUrl("qml/ProductView.qml"), {"barcode": barcodeValue});
                      }
                    }

            }
          }

        }
    }
}


