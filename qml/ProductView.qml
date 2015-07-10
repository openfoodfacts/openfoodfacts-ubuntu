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

            energy.value = "<font color=\"#620000\">" + _json.nutriments.energy_100g + " " + _json.nutriments.energy_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.energy_serving + " " + _json.nutriments.energy_unit + "</font>";
            fat.value = "<font color=\"#620000\">" + _json.nutriments.fat_100g + " " + _json.nutriments.fat_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.fat_serving + " " + _json.nutriments.fat_unit + "</font>";

            //saturated-fat_100g.text = _json.nutriments.saturated-fat_100g + " " + _json.nutriments.saturated-fat_unit;
            //saturated-fat_serving.text = _json.nutriments.saturated-fat_serving + " " + _json.nutriments.saturated-fat_unit;

            carbohydrates.value = "<font color=\"#620000\">" + _json.nutriments.carbohydrates_100g + " " + _json.nutriments.carbohydrates_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.carbohydrates_serving + " " + _json.nutriments.carbohydrates_unit + "</font>";
            sugars.value = "<font color=\"#620000\">" + _json.nutriments.sugars_100g + " " + _json.nutriments.sugars_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.sugars_serving + " " + _json.nutriments.sugars_unit + "</font>";
            fiber.value = "<font color=\"#620000\">" + _json.nutriments.fiber_100g + " " + _json.nutriments.fiber_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.fiber_serving + " " + _json.nutriments.fiber_unit + "</font>";
            proteins.value = "<font color=\"#620000\">" + _json.nutriments.proteins_100g + " " + _json.nutriments.proteins_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.proteins_serving + " " + _json.nutriments.proteins_unit + "</font>";
            salt.value = "<font color=\"#620000\">" + _json.nutriments.salt_100g + " " + _json.nutriments.salt_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.salt_serving + " " + _json.nutriments.salt_unit + "</font>";
            sodium.value = "<font color=\"#620000\">" + _json.nutriments.sodium_100g + " " + _json.nutriments.sodium_unit + "</font> | <font color=\"#002762\">" + _json.nutriments.sodium_serving + " " + _json.nutriments.sodium_unit + "</font>";


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
                 contentWidth: helpScreen.width;
                 contentHeight: labelbarcode.height + pictureproduct.height + labelsectioncaract.height +
                                descproduct.height + quantproduct.height + packproduct.height + brandproduct.height +
                                catproduct.height + oriproduct.height + labelsectioningr.height + ingrproduct.height +
                                labelsectionnutr.height + imagenutr.height + oriproduct.height + purcproduct.height +
                                storproduct.height + counproduct.height + tracproduct.height + sizeproduct.height +
                                manuproduct.height + tablenutri.height + energy.height + fat.height + carbohydrates.height +
                                sugars.height + fiber.height + proteins.height + salt.height + sodium.height
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
                         height: units.gu(20)
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
                     text: "<b>Caractéristique du produit</b><br/>"
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
                     text: "<br/><b>Ingrédients</b><br/>"
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
                     text: "<br/><b>Informations nutritionnelles</b><br/>"
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





                ListItem.SingleValue {
                    id:tablenutri
                    text: "<b>Composition</b>"
                    value: "<b><font color=\"#620000\">Pour 100 g/ml</font></b> | <b><font color=\"#002762\">Par portion</font></b>"
                }
                ListItem.Divider { }

                ListItem.SingleValue {
                    id: energy
                    text: "Énergie"
                }
                ListItem.SingleValue {
                    id: fat
                    text: "Matières grasses / Lipides"
                }
                ListItem.SingleValue {
                    id: carbohydrates
                    text: "Glucides"
                }
                ListItem.SingleValue {
                    id: sugars
                    text: "    dont Sucres"
                }
                ListItem.SingleValue {
                    id: fiber
                    text: "Fibres alimentaires"
                }
                ListItem.SingleValue {
                    id: proteins
                    text: "Protéines"
                }
                ListItem.SingleValue {
                    id: salt
                    text: "Sel"
                }
                ListItem.SingleValue {
                    id: sodium
                    text: "    Sodium"
                }



                }

        }
    }
}



}

