import QtQuick 2.4
import Ubuntu.Components 1.2
import "qrc:///component/qml/component"
import Ubuntu.Components.ListItems 1.0 as ListItem
import QtGraphicalEffects 1.0


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
            picturebackgroundtop.source = _json.image_small_url;
            labelbarcode.text=pageProductView.barcode;

            var generic_name = _json.generic_name || 'n/a';
            descproduct.text = "<b>Dénomination générique : </b>" + generic_name;
            var quantity = _json.quantity || 'n/a';
            quantproduct.text = "<b>Quantité : </b>" + quantity;
            var packaging = _json.packaging || 'n/a';
            packproduct.text = "<b>Conditionnement : </b>" + packaging;
            var brands = _json.brands || 'n/a';
            brandproduct.text = "<b>Marques : </b>" + brands;

            var categories = _json.categories || 'n/a';
            catproduct.text = "<b>Catégories : </b>" + categories;
            var origins = _json.origins || 'n/a';
            oriproduct.text = "<b>Origine des ingrédients : </b>" + origins;
            var manufacturing_places = _json.manufacturing_places || 'n/a';
            manuproduct.text = "<b>Lieux de fabrication ou de transformation : </b>" + manufacturing_places;
            var purchase_places = _json.purchase_places || 'n/a';
            purcproduct.text = "<b>Ville et pays d'achat : </b>" + purchase_places;
            var stores = _json.stores || 'n/a';
            storproduct.text = "<b>Magasins : </b>" + stores;
            var countries = _json.countries || 'n/a';
            counproduct.text = "<b>Pays de vente : </b>" + countries;
            var ingredients_text = _json.ingredients_text || 'n/a';
            ingrproduct.text = "<b>Ingrédients : </b>" + _json.ingredients_text;
            var traces = _json.traces || 'n/a';
            tracproduct.text = "<b>Traces éventuelles : </b>" + traces;
            imagenutr.source = "http://static.openfoodfacts.org/images/misc/" + _json.nutrition_grade_fr + ".338x72.png";
            var serving_size = _json.serving_size || 'n/a';
            sizeproduct.text = "<b><br/>Taille d'une portion : </b>" + serving_size;

            var energy_100g = (typeof _json.nutriments.energy_100g !== "undefined") ? _json.nutriments.energy_100g : "n/a";
            var energy_unit = (typeof _json.nutriments.energy_unit !== "undefined") ? _json.nutriments.energy_unit : " ";
            var energy_serving  = (typeof _json.nutriments.energy_serving  !== "undefined") ? _json.nutriments.energy_serving  : "n/a";
            energy.value = "<font color=\"#620000\">" + energy_100g + " " + energy_unit + "</font> | <font color=\"#002762\">" + energy_serving + " " + energy_unit + "</font>";
            var fat_100g = (typeof _json.nutriments.fat_100g !== "undefined") ? _json.nutriments.fat_100g : "n/a";
            var fat_unit = (typeof _json.nutriments.fat_unit !== "undefined") ? _json.nutriments.fat_unit : " ";
            var fat_serving  = (typeof _json.nutriments.fat_serving  !== "undefined") ? _json.nutriments.fat_serving  : "n/a";
            fat.value = "<font color=\"#620000\">" + fat_100g + " " + fat_unit + "</font> | <font color=\"#002762\">" + fat_serving + " " + fat_unit + "</font>";

            //saturated-fat_100g.text = _json.nutriments.saturated-fat_100g + " " + _json.nutriments.saturated-fat_unit;
            //saturated-fat_serving.text = _json.nutriments.saturated\-fat_serving + " " + _json.nutriments.saturated-fat_unit;

            var carbohydrates_100g = (typeof _json.nutriments.carbohydrates_100g !== "undefined") ? _json.nutriments.carbohydrates_100g : "n/a";
            var carbohydrates_unit = (typeof _json.nutriments.carbohydrates_unit !== "undefined") ? _json.nutriments.carbohydrates_unit : " ";
            var carbohydrates_serving  = (typeof _json.nutriments.carbohydrates_serving  !== "undefined") ? _json.nutriments.carbohydrates_serving  : "n/a";
            carbohydrates.value = "<font color=\"#620000\">" + carbohydrates_100g + " " + carbohydrates_unit + "</font> | <font color=\"#002762\">" + carbohydrates_serving + " " + carbohydrates_unit + "</font>";

            var sugars_100g = (typeof _json.nutriments.sugars_100g !== "undefined") ? _json.nutriments.sugars_100g : "n/a";
            var sugars_unit = (typeof _json.nutriments.sugars_unit !== "undefined") ? _json.nutriments.sugars_unit : " ";
            var sugars_serving  = (typeof _json.nutriments.sugars_serving  !== "undefined") ? _json.nutriments.sugars_serving  : "n/a";
            sugars.value = "<font color=\"#620000\">" + sugars_100g + " " + sugars_unit + "</font> | <font color=\"#002762\">" + sugars_serving + " " + sugars_unit + "</font>";

            var fiber_100g = (typeof _json.nutriments.fiber_100g !== "undefined") ? _json.nutriments.fiber_100g : "n/a";
            var fiber_unit = (typeof _json.nutriments.fiber_unit !== "undefined") ? _json.nutriments.fiber_unit : " ";
            var fiber_serving  = (typeof _json.nutriments.fiber_serving  !== "undefined") ? _json.nutriments.fiber_serving  : "n/a";
            fiber.value = "<font color=\"#620000\">" + fiber_100g + " " + fiber_unit + "</font> | <font color=\"#002762\">" + fiber_serving + " " + fiber_unit + "</font>";

            var proteins_100g = (typeof _json.nutriments.proteins_100g !== "undefined") ? _json.nutriments.proteins_100g : "n/a";
            var proteins_unit = (typeof _json.nutriments.proteins_unit !== "undefined") ? _json.nutriments.proteins_unit : " ";
            var proteins_serving  = (typeof _json.nutriments.proteins_serving  !== "undefined") ? _json.nutriments.proteins_serving  : "n/a";
            proteins.value = "<font color=\"#620000\">" + proteins_100g + " " + proteins_unit + "</font> | <font color=\"#002762\">" + proteins_serving + " " + proteins_unit + "</font>";

            var salt_100g = (typeof _json.nutriments.salt_100g !== "undefined") ? _json.nutriments.salt_100g : "n/a";
            var salt_unit = (typeof _json.nutriments.salt_unit !== "undefined") ? _json.nutriments.salt_unit : " ";
            var salt_serving  = (typeof _json.nutriments.salt_serving  !== "undefined") ? _json.nutriments.salt_serving  : "n/a";
            salt.value = "<font color=\"#620000\">" + salt_100g + " " + salt_unit + "</font> | <font color=\"#002762\">" + salt_serving + " " + salt_unit + "</font>";

            var sodium_100g = (typeof _json.nutriments.sodium_100g !== "undefined") ? _json.nutriments.sodium_100g : "n/a";
            var sodium_unit = (typeof _json.nutriments.sodium_unit !== "undefined") ? _json.nutriments.sodium_unit : " ";
            var sodium_serving  = (typeof _json.nutriments.sodium_serving  !== "undefined") ? _json.nutriments.sodium_serving  : "n/a";
            sodium.value = "<font color=\"#620000\">" + sodium_100g + " " + sodium_unit + "</font> | <font color=\"#002762\">" + sodium_serving + " " + sodium_unit + "</font>";
        }
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
                contentHeight: labelbarcode.height + headerpicture.height + sectioncaract.height + sectionnutr.height + sectioningr.height + sectiontablenutr.height + 80
                flickableDirection: Flickable.VerticalFlick
                clip: true

                Rectangle {
                    id: headerpicture
                    width: helpScreen.width;
                    height: units.gu(25)
                    color: "#EDEDEC"

                    Image {
                        id : picturebackgroundtop;
                        width: helpScreen.width;
                        height: units.gu(15)
                    }
                    FastBlur {
                        anchors.fill: picturebackgroundtop
                        source: picturebackgroundtop
                        radius: 62
                    }

                    Image {
                        id : productImage;
                        fillMode: Image.PreserveAspectCrop
                        visible: false // Do not forget to make original pic insisible
                    }

                    Rectangle {
                        id: mask
                        anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
                        width: units.gu(18)
                        height: units.gu(18)
                        color: "#EDEDEC";
                        radius: 120
                        clip: true
                        visible: false
                    }

                    OpacityMask {
                        anchors.fill: mask
                        source: productImage
                        maskSource: mask
                    }
                } // header picture

                Column {
                    id: content
                    anchors.fill: parent; anchors.topMargin: headerpicture.height; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 5;
                    spacing:15;

                    Label {
                        id: titleLabel
                        wrapMode: Text.WordWrap
                        fontSize: "x-large"
                        width:content.width;
                        visible: false
                    }

                    Label {
                        id: labelbarcode
                        width:content.width;
                        objectName: "label"
                        fontSize: "x-small"
                        horizontalAlignment : Text.AlignHCenter
                        color:"#48c1ba";
                    }

                    UbuntuShape {
                        id: sectioncaract
                        width: content.width
                        height: labelsectioncaract.height + descproduct.height + quantproduct.height + packproduct.height + brandproduct.height
                                + catproduct.height + oriproduct.height + manuproduct.height + purcproduct.height + storproduct.height +
                                counproduct.height + 20
                        color : "#ffffff";

                        Column {
                            id: contentsectioncaract
                            anchors.fill: sectioncaract; anchors.topMargin: 10; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 10;

                            Label {
                                id: labelsectioncaract
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                                fontSize: "large"
                                color: "#48c1ba"
                                text: "<b>Caractéristiques du produit</b><br/>"
                                font.underline : true
                            }

                            Text{
                                id: descproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: quantproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }

                            Text{
                                id: packproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: brandproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: catproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: oriproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: manuproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: purcproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: storproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                            Text{
                                id: counproduct
                                wrapMode: Text.Wrap
                                width:contentsectioncaract.width;
                                objectName: "label"
                            }
                        }}

                    UbuntuShape {
                        id: sectioningr
                        width: content.width
                        height: labelsectioningr.height + ingrproduct.height + tracproduct.height + 20
                        color : "#ffffff";

                        Column {
                            id: contentsectioningr
                            anchors.fill: sectioningr; anchors.topMargin: 10; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 10;

                            Label {
                                id: labelsectioningr
                                wrapMode: Text.Wrap
                                width:contentsectioningr.width;
                                objectName: "label"
                                fontSize: "large"
                                color: "#48c1ba"
                                text: "<b>Ingrédients</b><br/>"
                                font.underline : true
                            }

                            Text{
                                id: ingrproduct
                                wrapMode: Text.Wrap
                                width:contentsectioningr.width;
                                objectName: "label"
                            }
                            Text{
                                id: tracproduct
                                wrapMode: Text.Wrap
                                width:contentsectioningr.width;
                                objectName: "label"
                            }
                        }}

                    UbuntuShape {
                        id: sectionnutr
                        width: content.width
                        height: labelsectionnutr.height + imagenutr.height + sizeproduct.height + 20
                        color : "#ffffff";

                        Column {
                            id: contentsectionnutr
                            anchors.fill: sectionnutr; anchors.topMargin: 10; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 10;

                            Label {
                                id: labelsectionnutr
                                wrapMode: Text.Wrap
                                width:content.width;
                                objectName: "label"
                                fontSize: "large"
                                color: "#48c1ba"
                                text: "<b>Informations nutritionnelles</b><br/>"
                                font.underline : true
                            }

                            Image {
                                id: imagenutr
                                fillMode: Image.PreserveAspectFit
                                width:contentsectionnutr.width;
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text{
                                id: sizeproduct
                                wrapMode: Text.Wrap
                                width:contentsectionnutr.width;
                                objectName: "label"
                            }
                        }}

                    UbuntuShape {
                        id: sectiontablenutr
                        width: content.width
                        height: tablenutri.height + energy.height + fat.height + carbohydrates.height + sugars.height + fiber.height + proteins.height + salt.height + sodium.height + 20
                        color : "#ffffff";

                        Column {
                            id: contentsectiontablenutr
                            anchors.fill: sectiontablenutr; anchors.topMargin: 10; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 10;

                            ListItem.SingleValue {
                                id:tablenutri
                                text: "<b><font color=\"#000000\">Composition par</b></font>"
                                value: "<b><font color=\"#620000\">100 g/ml</font></b> | <b><font color=\"#002762\">portion</font></b>"
                            }
                            ListItem.Divider { }

                            ListItem.SingleValue {
                                id: energy
                                text: "<font color=\"#000000\">Énergie</font>"
                            }
                            ListItem.SingleValue {
                                id: fat
                                text: "<font color=\"#000000\">Matières grasses</font><br/><font color=\"#000000\">et Lipides</font>"
                            }
                            //ListItem.SingleValue {
                            //    id: saturated-fat_100g
                            //    text: "<font color=\"#000000\">    dont Saturé</font>"
                            //}
                            ListItem.SingleValue {
                                id: carbohydrates
                                text: "<font color=\"#000000\">Glucides</font>"
                            }
                            ListItem.SingleValue {
                                id: sugars
                                text: "<font color=\"#000000\">    dont Sucres</font>"
                            }
                            ListItem.SingleValue {
                                id: fiber
                                text: "<font color=\"#000000\">Fibres alimentaires</font>"
                            }
                            ListItem.SingleValue {
                                id: proteins
                                text: "<font color=\"#000000\">Protéines</font>"
                            }
                            ListItem.SingleValue {
                                id: salt
                                text: "<font color=\"#000000\">Sel</font>"
                            }
                            ListItem.SingleValue {
                                id: sodium
                                text: "<font color=\"#000000\">    Sodium</font>"
                            }
                        }}

                }

            }
        }
    }



}

