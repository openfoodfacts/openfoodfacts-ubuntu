import QtQuick 2.4
import Ubuntu.Components 1.3
import "qrc:///component/qml/component"
import Ubuntu.Components.ListItems 1.3 as ListItem
import QtGraphicalEffects 1.0


Page {
    id: pageProductSearch
    title: i18n.tr("search result for : ") + pageProductSearch.productNameSearch;
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }


    property string productNameSearch : "";
    onProductNameSearchChanged: {
        console.log("product name search changed : " + productNameSearch);
        openFoodFactJSON.source =  "http://world.openfoodfacts.org/api/v0/product/" + pageProductView.barcode + ".json";
    }

    property var jsonData;
    property string productFound:"";

    onProductFoundChanged: {
        if (pageProductView.productFound === "0") {
            pageStack.pop();
            var barcodeValue = pageProductView.barcode;
            pageStack.push(Qt.resolvedUrl("notFound.qml"), {"barcode": pageProductSearch.productNameSearch});
        }
    }


    Timer {
        id: findProductTimer
        interval: 500
        repeat: false
        onTriggered: {
            if (pageProductView.productFound !== "1") {
                pageProductView.productFound = "0";
            }
        }
    }

    ListView {
        id: openFoodFactResultList
        anchors.fill: parent
        JSONListModel {
            id: openFoodFactJSON
            source: "http://world.openfoodfacts.org/cgi/search.pl?search_terms="+pageProductSearch.productNameSearch+"&search_simple=1&jqm=1";
            query: "$.data.children[*]"
        }
        model: openFoodFactJSON.model
        delegate: ListItem.Subtitled {

            Component.onCompleted: console.log(model.data.title+"\n");
            iconSource: model.data.thumbnail
            Text {
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 12
                color: "black"
                text: model.data.title

            }
        }
    }


}

