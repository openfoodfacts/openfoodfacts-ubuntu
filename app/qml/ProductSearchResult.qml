import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import QtQuick.XmlListModel 2.0
import "qrc:///component/qml/component"


Page {
    id: pageProductSearch
    header: PageHeader {
        title: i18n.tr("search result for : ") + pageProductSearch.productNameSearch;
   }


    property string productNameSearch : "";
    onProductNameSearchChanged: {
        console.log("product name search changed : " + productNameSearch);
        searchResultModel.source =  "https://ssl-api.openfoodfacts.org/cgi/search.pl?search_terms=" + pageProductSearch.productNameSearch + "&search_simple=1&action=process&xml=1";
    }

    property bool loading: searchResultModel.status === XmlListModel.Loading

    onLoadingChanged: {
        if (searchResultModel.status == XmlListModel.Ready)
            searchResultView.positionViewAtBeginning()
    }

    XmlListModel {
        id: searchResultModel
        source: ""
        query: "/opt/products"
        XmlRole { name: "code"; query: "@code/string()" }
        XmlRole { name: "thumb_url"; query: "@image_front_thumb_url/string()" }
        XmlRole { name: "product_name"; query: "@product_name/string()" }
        /*XmlRole { name: "traces"; query: "@traces/string()" }
        XmlRole { name: "allergens"; query: "@allergens/string()" }
        XmlRole { name: "brands"; query: "@brands/string()" }
        XmlRole { name: "categories"; query: "@categories/string()" }*/

    }

    Item {
        id:main
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }

        Item {
            id:helpScreen
            width:main.width; height:main.height

            Flickable {
                anchors.fill: parent
                contentWidth: helpScreen.width;
                contentHeight: searchResultModel.height
                flickableDirection: Flickable.VerticalFlick
                clip: true


    ListView {
        id:searchResultView
        //orientation: isPortrait ? ListView.Horizontal : ListView.Vertical
        anchors.fill: parent;
        model: searchResultModel
        delegate:  ListItem.SingleValue {
            
            showDivider: true
            progression: true
            iconSource: thumb_url
            Text {
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                anchors.verticalCenter: parent.verticalCenter;
                text: product_name
                color: theme.palette.normal.backgroundText
                font.bold: true
            }
            onClicked: {
                pageStack.push(Qt.resolvedUrl("qrc:///qml/ProductView.qml"), {"barcode": code});

            }
        }
    }

        }    }    }

    BusyIndicator {
        scale: 0.8
        visible: pageProductSearch.loading
        anchors.centerIn: parent
    }

}
