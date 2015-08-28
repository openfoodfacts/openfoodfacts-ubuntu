/*
import QtQuick 2.0
import Ubuntu.Components 1.1
*/

import QtQuick 2.4
import Ubuntu.Components 1.1





Page {
    id: notFoundPage
    title: i18n.tr("Product not found")

    Button {
        objectName: "button"
        anchors.horizontalCenter: parent.horizontalCenter
        width: units.gu(30)

        text: i18n.tr("No product found")


    }

}


