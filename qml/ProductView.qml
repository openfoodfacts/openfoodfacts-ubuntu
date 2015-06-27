import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem
import "component"


Page {
    title: "View product : ";
    id: pageProductView


    property string barcode:"";
    onBarcodeChanged: console.log(pageProductView.barcode)
    property var jsonData

    Flickable {
        anchors.fill: parent
        JSONListModel {
            id: openFoodFactJSON
            source: "http://fr.openfoodfacts.org/api/v0/produit/" + pageProductView.barcode+".json";
            query: "$[*]"
            onJsonChanged: {
               var _json = openFoodFactJSON.model.get(0);
                titleLabel.text = _json.product_name;
                productImage.source = _json.image_small_url;
                labelbarcode.text=pageProductView.barcode;

                descproduct.text= "Dénomination générique : " + _json.generic_name;


                //3029330003533
            }
        }



        // iconSource: model.data.thumbnail
        Label {
            id: titleLabel
            wrapMode: Text.WordWrap
            fontSize: "x-large"
        }



        UbuntuShape {
            id: pictureproduct
            y: titleLabel.y + titleLabel.height + units.gu(1);

            width: units.gu(20)
            height: units.gu(20)

            image: Image {
                id : productImage;
            }
        }

        Label {
            id: labelbarcode
            y : titleLabel.y + titleLabel.height + units.gu(1); // hauteur
            x : pictureproduct.x + pictureproduct.width+ units.gu(1); // largeur
            objectName: "label"
            // anchors.horizontalCenter: parent.horizontalCenter
            fontSize: "x-small"
        }

        Text {
            id: descproduct

            x : labelbarcode.x; // largeur
            y : labelbarcode.y + labelbarcode.height + units.gu(1);
            objectName: "label"

        }

    }

    /*  Flickable {


            Label {
                id: featureproduct
                objectName: "label"
                fontSize: "large"
                font.weight: Font.DemiBold
                text: "Caractéristiques du produit :"
            }

            Text {
                width: parent.width
                wrapMode: Text.WordWrap
                id: descproduct
                objectName: "label"
                text: "Dénomination générique : " + jsonData["product"]["generic_name"]
            }
            Text {
                width: parent.width
                wrapMode: Text.WordWrap
                id: condiproduct
                objectName: "label"
                text: "Conditionnement : " + jsonData["product"]["packaging_tags"]
            }
            Text {
                width: parent.width
                wrapMode: Text.WordWrap
                id: marqueproduct
                objectName: "label"
                text: "Marques : " + jsonData["product"]["brands_tags"]
            }
            Text {
                width: parent.width
                wrapMode: Text.WordWrap
                id: catproduct
                objectName: "label"
                text: "Catégories : " + jsonData["product"]["categories"]
            }
            Text {
                width: parent.width
                wrapMode: Text.WordWrap
                id: oriproduct
                objectName: "label"
                text: "Origine des ingrédients : " + jsonData["product"]["countries"]
            }
            Text {
                width: parent.width
                wrapMode: Text.WordWrap
                id: saleproduct
                objectName: "label"
                text: "Pays de vente : " + jsonData["product"]["origins"]
            }




            Label {
                id: ingredients
                objectName: "label"
                fontSize: "large"
                font.weight: Font.DemiBold
                text: "<br/>Ingrédients :"
            }
            Text {
                // For text to wrap, a width has to be explicitly provided
                width: parent.width
                wrapMode: Text.WordWrap
                id: ingredientsproduct
                objectName: "label"
                text: "Liste des ingrédients : " + jsonData["product"]["ingredients_text"]
            }


            Label {
                id: informationproduct
                objectName: "label"
                fontSize: "large"
                font.weight: Font.DemiBold
                text: "<br/>Information nutritionnelles :"
            }


        }

    }*/
}

