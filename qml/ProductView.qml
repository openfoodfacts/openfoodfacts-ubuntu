import QtQuick 2.4
import Ubuntu.Components 1.2
import Ubuntu.Components.ListItems 1.0 as ListItem
import "component"


Page {
    title: titleLabel.text;
    id: pageProductView

    property string barcode:"";
    onBarcodeChanged: console.log(pageProductView.barcode)
    property var jsonData

    JSONListModel {
        id: openFoodFactJSON
        source: "http://fr.openfoodfacts.org/api/v0/produit/" + pageProductView.barcode + ".json";
        query: "$[*]"
        onJsonChanged: {
           var _json = openFoodFactJSON.model.get(0);
            titleLabel.text = _json.product_name;
            productImage.source = _json.image_small_url;
            labelbarcode.text=pageProductView.barcode;

            descproduct.text = "<b>Dénomination générique : </b>" + _json.generic_name;
            quantproduct.text = "<b>Quantité : </b>" + _json.quantity;
            packproduct.text = "<b>Conditionnement : </b>" + _json.packaging;
            brandproduct.text = "<b>Marques : </b>" + _json.brands;
            catproduct.text = "<b>Catégories : </b>" + _json.categories;
            oriproduct.text = "<b>Origine des ingrédients : </b>" + _json.origins;
            manuproduct.text = "<b>Lieux de fabrication ou de transformation : </b>" + _json.manufacturing_places;
            purcproduct.text = "<b>Ville et pays d'achat : </b>" + _json.purchase_places;
            storproduct.text = "<b>Magasins : </b>" + _json.stores;
            counproduct.text = "<b>Pays de vente : </b>" + _json.countries;
            ingrproduct.text = "<b>Ingrédients : </b>" + _json.ingredients_text;
            tracproduct.text = "<b>Traces éventuelles : </b>" + _json.traces;
            imagenutr.source = "http://static.openfoodfacts.org/images/misc/" + _json.nutrition_grade_fr + ".338x72.png";
            sizeproduct.text = "<b><br/>Taille d'une portion : </b>" + _json.serving_size;
            //3029330003533
        }
     }

    Rectangle {
        id:main
        anchors.fill: parent; anchors.topMargin: 5; anchors.leftMargin: 5; anchors.rightMargin: 5; anchors.bottomMargin: 5;
        color: "#EDEDEC"

        Rectangle {
            id:helpScreen
            width:main.width; height:main.height
            color: "#EDEDEC"

            Flickable {
                 anchors.fill: parent
                 contentWidth: helpText.width;
                 contentHeight: labelbarcode.height + pictureproduct.height + labelsectioncaract.height +
                                descproduct.height + quantproduct.height + packproduct.height + brandproduct.height +
                                catproduct.height + oriproduct.height + labelsectioningr.height + ingrproduct.height +
                                labelsectionnutr.height + imagenutr.height + oriproduct.height + purcproduct.height +
                                storproduct.height + counproduct.height + tracproduct.height + sizeproduct.height +
                                manuproduct.height
                 flickableDirection: Flickable.VerticalFlick
                 clip: true


              Column {

                 Label {
                         id: titleLabel
                          wrapMode: Text.WordWrap
                          fontSize: "x-large"
                          width:helpScreen.width;
                          visible: false
                     }

                 UbuntuShape {
                        id: pictureproduct
                         width: units.gu(15)
                         height: units.gu(15)
                         anchors.horizontalCenter: parent.horizontalCenter
                         image: Image {
                              id : productImage;
                                }
                }

                 Label {
                     id: labelbarcode
                     anchors.horizontalCenter: parent.horizontalCenter
                     objectName: "label"
                     fontSize: "x-small"
                 }

                 Label {
                     id: labelsectioncaract
                     wrapMode: Text.Wrap
                     width:helpScreen.width;
                     objectName: "label"
                     fontSize: "large"
                     text: "Caractéristique du produit<br/>"
                     font.underline : true

                 }

                 Text{
                      id: descproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: quantproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }

                 Text{
                      id: packproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: brandproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: catproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: oriproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: manuproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: purcproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: storproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Text{
                      id: counproduct
                       wrapMode: Text.Wrap
                       width:helpScreen.width;
                       objectName: "label"
                }
                 Label {
                     id: labelsectioningr
                     wrapMode: Text.Wrap
                     width:helpScreen.width;
                     objectName: "label"
                     fontSize: "large"
                     text: "<br/>Ingrédients<br/>"
                     font.underline : true
                 }
                Text{
                     id: ingrproduct
                      wrapMode: Text.Wrap
                      width:helpScreen.width;
                      objectName: "label"
                }
                Text{
                     id: tracproduct
                      wrapMode: Text.Wrap
                      width:helpScreen.width;
                      objectName: "label"
                }

                 Label {
                     id: labelsectionnutr
                     wrapMode: Text.Wrap
                     width:helpScreen.width;
                     objectName: "label"
                     fontSize: "large"
                     text: "<br/>Informations nutritionnelles<br/>"
                     font.underline : true
                 }

                Image {
                    id: imagenutr
                     fillMode: Image.PreserveAspectFit
                     width:helpScreen.width;
                     anchors.horizontalCenter: parent.horizontalCenter
                }
                Text{
                     id: sizeproduct
                      wrapMode: Text.Wrap
                      width:helpScreen.width;
                      objectName: "label"
                }



                }

        }
    }
}



}

