import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import QtQuick.XmlListModel 2.0
import "qrc:///component/qml/component"


Page {
    id: pageProductSearch
    title: i18n.tr("search result for : ") + pageProductSearch.productNameSearch;
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }
    Component.onCompleted: openFoodFacts.currentPage="ProductSearchResult";


    property string productNameSearch : "";
    onProductNameSearchChanged: {
        console.log("product name search changed : " + productNameSearch);
        searchResultModel.source =  "http://world.openfoodfacts.org/cgi/search.pl?search_terms=" + pageProductSearch.productNameSearch + "&search_simple=1&action=process&xml=1";
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

    Rectangle {
        id:main
        anchors.fill: parent; //anchors.topMargin: 5; anchors.leftMargin: 5; anchors.rightMargin: 5; anchors.bottomMargin: 5;
        color: "#EDEDEC"

        Rectangle {
            id:helpScreen
            width:main.width; height:main.height
            color: "#EDEDEC"

            Flickable {
                anchors.fill: parent
                contentWidth: helpScreen.width;
                contentHeight: searchResultView.height;
                flickableDirection: Flickable.VerticalFlick
                clip: true


    ListView {
        id:searchResultView
        //orientation: isPortrait ? ListView.Horizontal : ListView.Vertical
        anchors.fill: parent;
        model: searchResultModel
        delegate:  ListItem.Subtitled {
            iconSource: thumb_url
            Text {
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 12
                color: "black"
                text: product_name
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

