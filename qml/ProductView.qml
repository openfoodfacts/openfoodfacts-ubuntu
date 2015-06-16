import QtQuick 2.4
import Ubuntu.Components 1.2

Page {
    title: "View product"
    id: pageProductView
   property string barcode:"";
    onBarcodeChanged: console.log(pageProductView.barcode)

    Column {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
        }

        Label {
            id: label
            objectName: "label"
            text: pageProductView.barcode
        }
    }
}

