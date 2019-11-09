import QtQuick 2.4
import Ubuntu.Components 1.3
import "qrc:///component/qml/component"
import "qrc:///component/qml/component/allergen.js" as ALLERGEN

import Ubuntu.Components.ListItems 1.3 as ListItem
import QtGraphicalEffects 1.0


Page {
    id: pageProductView
    header: PageHeader {
        title: titleLabel.text;
       StyleHints {
           foregroundColor: openFoodFacts.settings.fontColor;
           backgroundColor: openFoodFacts.settings.color;
       }
            leadingActionBar.actions: [
                Action {
                    iconName: "back"
                    text: "Back"
                    onTriggered: {
                        pageStack.pop();
                    }
                }
            ]
   }
    Component.onCompleted: openFoodFacts.currentPage="ProductView";

    property string barcode:"";
    onBarcodeChanged: console.log("[ProductView] barcode = "+pageProductView.barcode);
    property string productNameSearch : "";
    
    onProductNameSearchChanged: {
        console.log("product name search changed : " + productNameSearch);
        openFoodFactJSON.source =  "https://world.openfoodfacts.org/api/v0/product/" + pageProductView.barcode + ".json";
    }

    function roundDecimal(nombre, precision){
        var precision = precision || 2;
        var tmp = Math.pow(10, precision);
        return Math.round( nombre*tmp )/tmp;
    }

    property var jsonData;
    property string productFound:"";

    onProductFoundChanged: {
        if (pageProductView.productFound === "0") {
            pageStack.pop();
            var barcodeValue = pageProductView.barcode;
            pageStack.push(Qt.resolvedUrl("notFound.qml"), {"barcode": barcodeValue});
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

    BusyIndicator {
        scale: 0.8
        visible: pageProductView.productFound === "0"
        anchors.centerIn: parent
    }

    JSONListModel {
        id: openFoodFactJSON
        source: "https://ssl-api.openfoodfacts.org/api/v0/product/" + pageProductView.barcode + ".json";
        query: "$[*]"
        onJsonChanged: {
            console.log("json changed");
            findProductTimer.start()
            var _json = openFoodFactJSON.model.get(0);

            if (typeof _json !== "undefined" && typeof _json.product_name !== "undefined" && _json.product_name !== "" ) {
                pageProductView.productFound = "1";

                titleLabel.text = _json.product_name;
                productImage.source = _json.image_small_url;
                picturebackgroundtop.source = _json.image_small_url;
                labelbarcode.text=pageProductView.barcode;

                if (_json.image_nutrition_url) {productImagenutr.source = _json.image_nutrition_url;}else{ pictureButtonnutr.visible = false; pictureButtonnutr.height = units.gu(0); }
                if (_json.image_ingredients_url) {productImageingr.source = _json.image_ingredients_url;}else{ pictureButtoningr.visible = false; pictureButtoningr.height = units.gu(0); }

                var generic_name = _json.generic_name || 'n/a';
                descproduct.text = "<b>"+i18n.tr("Common name")+ " : </b>" + generic_name;
                var quantity = _json.quantity || 'n/a';
                quantproduct.text = "<b>"+i18n.tr("Quantity")+" : </b>" + quantity;
                var packaging = _json.packaging || 'n/a';
                packproduct.text = "<b>"+i18n.tr("Packaging")+" : </b>" + packaging;
                var brands = _json.brands || 'n/a';
                brandproduct.text = "<b>"+i18n.tr("Brands")+" : </b>" + brands;

                var categories = _json.categories || 'n/a';
                catproduct.text = "<b>"+i18n.tr("Categories")+" : </b>" + categories;
                var origins = _json.origins || 'n/a';
                oriproduct.text = "<b>"+i18n.tr("Origin of ingredients")+" : </b>" + origins;
                var manufacturing_places = _json.manufacturing_places || 'n/a';
                manuproduct.text = "<b>"+i18n.tr("Manufacturing or processing places")+" : </b>" + manufacturing_places;
                var purchase_places = _json.purchase_places || 'n/a';
                purcproduct.text = "<b>"+i18n.tr("City and Country where purchased")+" : </b>" + purchase_places;
                var stores = _json.stores || 'n/a';
                storproduct.text = "<b>"+i18n.tr("Stores")+" : </b>" + stores;
                var countries = _json.countries || 'n/a';
                counproduct.text = "<b>"+i18n.tr("Countries where sold")+" : </b>" + countries;
                var ingredients_text_with_allergens = _json.ingredients_text_with_allergens || 'n/a';
                ingrproduct.text = "<b>"+i18n.tr("Ingredients")+" : </b>" + ingredients_text_with_allergens;

                var allergens = _json.allergens || 'n/a';
                allergenproduct.text = "<b>"+i18n.tr("Substances or products causing allergies or intolerances")+" : </b>" + allergens;

                var traces = _json.traces || 'n/a';

                // TRANSLATORS: an aliment can contains traces of thoses products
                tracproduct.text = "<b>"+i18n.tr("Traces")+" : </b>" + traces;
                if ( typeof _json.nutrition_grade_fr !== 'undefined') {
                    imagenutr.source = Qt.resolvedUrl("qrc:///images/" + _json.nutrition_grade_fr +".png");
                }

                var serving_size = _json.serving_size || 'n/a';
                sizeproduct.text = "<b><br/>"+i18n.tr("Serving size")+" : </b>" + serving_size;

                var energy_100g = (typeof _json.nutriments.energy_100g !== "undefined") ? roundDecimal(_json.nutriments.energy_100g) : "n/a";
                var energy_unit = (typeof _json.nutriments.energy_unit !== "undefined") ? _json.nutriments.energy_unit : " ";
                var energy_serving  = (typeof _json.nutriments.energy_serving  !== "undefined") ? roundDecimal(_json.nutriments.energy_serving)  : "n/a";
                energy.value = "<font color=\"#620000\">" + energy_100g + " " + energy_unit + "</font> | <font color=\"#002762\">" + energy_serving + " " + energy_unit + "</font>";

                var fat_100g = (typeof _json.nutriments.fat_100g !== "undefined") ? roundDecimal(_json.nutriments.fat_100g) : "n/a";
                var fat_unit = (typeof _json.nutriments.fat_unit !== "undefined") ? _json.nutriments.fat_unit : " ";
                var fat_serving  = (typeof _json.nutriments.fat_serving  !== "undefined") ? roundDecimal(_json.nutriments.fat_serving)  : "n/a";
                fat.value = "<font color=\"#620000\">" + fat_100g + " " + fat_unit + "</font> | <font color=\"#002762\">" + fat_serving + " " + fat_unit + "</font>";

                //saturated-fat_100g.text = _json.nutriments.saturated-fat_100g + " " + _json.nutriments.saturated-fat_unit;
                //saturated-fat_serving.text = _json.nutriments.saturated\-fat_serving + " " + _json.nutriments.saturated-fat_unit;

                var carbohydrates_100g = (typeof _json.nutriments.carbohydrates_100g !== "undefined") ? roundDecimal(_json.nutriments.carbohydrates_100g) : "n/a";
                var carbohydrates_unit = (typeof _json.nutriments.carbohydrates_unit !== "undefined") ? _json.nutriments.carbohydrates_unit : " ";
                var carbohydrates_serving  = (typeof _json.nutriments.carbohydrates_serving  !== "undefined") ? roundDecimal(_json.nutriments.carbohydrates_serving)  : "n/a";
                carbohydrates.value = "<font color=\"#620000\">" + carbohydrates_100g + " " + carbohydrates_unit + "</font> | <font color=\"#002762\">" + carbohydrates_serving + " " + carbohydrates_unit + "</font>";

                var sugars_100g = (typeof _json.nutriments.sugars_100g !== "undefined") ? roundDecimal(_json.nutriments.sugars_100g) : "n/a";
                var sugars_unit = (typeof _json.nutriments.sugars_unit !== "undefined") ? _json.nutriments.sugars_unit : " ";
                var sugars_serving  = (typeof _json.nutriments.sugars_serving  !== "undefined") ? roundDecimal(_json.nutriments.sugars_serving)  : "n/a";
                sugars.value = "<font color=\"#620000\">" + sugars_100g + " " + sugars_unit + "</font> | <font color=\"#002762\">" + sugars_serving + " " + sugars_unit + "</font>";

                var fiber_100g = (typeof _json.nutriments.fiber_100g !== "undefined") ? roundDecimal(_json.nutriments.fiber_100g) : "n/a";
                var fiber_unit = (typeof _json.nutriments.fiber_unit !== "undefined") ? _json.nutriments.fiber_unit : " ";
                var fiber_serving  = (typeof _json.nutriments.fiber_serving  !== "undefined") ? roundDecimal(_json.nutriments.fiber_serving) : "n/a";
                fiber.value = "<font color=\"#620000\">" + fiber_100g + " " + fiber_unit + "</font> | <font color=\"#002762\">" + fiber_serving + " " + fiber_unit + "</font>";

                var proteins_100g = (typeof _json.nutriments.proteins_100g !== "undefined") ? roundDecimal(_json.nutriments.proteins_100g) : "n/a";
                var proteins_unit = (typeof _json.nutriments.proteins_unit !== "undefined") ? _json.nutriments.proteins_unit : " ";
                var proteins_serving  = (typeof _json.nutriments.proteins_serving  !== "undefined") ? roundDecimal(_json.nutriments.proteins_serving)  : "n/a";
                proteins.value = "<font color=\"#620000\">" + proteins_100g + " " + proteins_unit + "</font> | <font color=\"#002762\">" + proteins_serving + " " + proteins_unit + "</font>";

                var salt_100g = (typeof _json.nutriments.salt_100g !== "undefined") ? roundDecimal(_json.nutriments.salt_100g) : "n/a";
                var salt_unit = (typeof _json.nutriments.salt_unit !== "undefined") ? _json.nutriments.salt_unit : " ";
                var salt_serving  = (typeof _json.nutriments.salt_serving  !== "undefined") ? roundDecimal(_json.nutriments.salt_serving)  : "n/a";
                salt.value = "<font color=\"#620000\">" + salt_100g + " " + salt_unit + "</font> | <font color=\"#002762\">" + salt_serving + " " + salt_unit + "</font>";

                var sodium_100g = (typeof _json.nutriments.sodium_100g !== "undefined") ? roundDecimal(_json.nutriments.sodium_100g): "n/a";
                var sodium_unit = (typeof _json.nutriments.sodium_unit !== "undefined") ? _json.nutriments.sodium_unit : " ";
                var sodium_serving  = (typeof _json.nutriments.sodium_serving  !== "undefined") ? roundDecimal(_json.nutriments.sodium_serving)  : "n/a";
                sodium.value = "<font color=\"#620000\">" + sodium_100g + " " + sodium_unit + "</font> | <font color=\"#002762\">" + sodium_serving + " " + sodium_unit + "</font>";

                helpScreen.visible = true;

                if (ALLERGEN.isContainsAllergen(ingredients_text_with_allergens) === true) {
                    allergendetect.color = "red";
                    labelattention.visible = true;
                    maskallergen.visible = true;
                    mask.height = units.gu(17);
                    mask.width = units.gu(17);
                }

                // add the product only if
                var product_already_in_history = false;
                for (var i=0; i < openFoodFacts.historyModel.count; i++) {
                    var hmodel = openFoodFacts.historyModel.get(i);
                    if (hmodel.codebarre === pageProductView.barcode) {
                        console.log("product already scanned");
                        // move the current item to top of list, because it's the last one visited
                        openFoodFacts.historyModel.move(i,0,1);
                        product_already_in_history = true;
                    }
                }

                if (product_already_in_history) {
                    console.log("product is already in history");
                } else {
                    console.log("product never scanned, let's add it to the history");
                    openFoodFacts.historyModel.insert(0, {"label": titleLabel.text, "codebarre": pageProductView.barcode});

                }

            } else {
                activity.visible = false
                pageProductView.productFound = "0";
            }
        }
    }


    Rectangle {
        id:main
        anchors {
            fill: parent
            topMargin: units.gu(6)
        }
        color: if (openFoodFacts.settings.color == "#3B3B3B"){ "#5D5D5D"; }else{ "#EDEDEC"; }


        ActivityIndicator {
            id:activity
            anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
            objectName: "activityindicator_standard"
            anchors.leftMargin: units.gu(10)
            running: true
        }


        Rectangle {
            id:helpScreen
            width:main.width; height:main.height
            color: if (openFoodFacts.settings.color == "#3B3B3B"){ "#5D5D5D"; }else{ "#EDEDEC"; }
            visible: false

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
                    color: if (openFoodFacts.settings.color == "#3B3B3B"){ "#5D5D5D"; }else{ "#EDEDEC"; }

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

                    Rectangle {
                        id: allergendetect
                        anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
                        width: units.gu(19)
                        height: units.gu(19)
                        color: "#EDEDEC" //CHANGE IF DETECT ALLERGEN
                        radius: 120
                        clip: true
                        visible: true

                        Image {
                            id : productImage;
                            fillMode: Image.PreserveAspectCrop
                            visible: false // Do not forget to make original pic insisible
                        }
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
                    Rectangle {
                        id: maskallergen
                        anchors.horizontalCenter: mask.horizontalCenter; anchors.verticalCenter: mask.verticalCenter;
                        width: units.gu(17)
                        height: units.gu(2)
                        color: "red";
                        visible: false
                        Label {
                            id: labelattention
                            anchors.fill: mask
                            width: maskallergen.width
                            visible: false
                            font.bold : true
                            horizontalAlignment : Text.AlignHCenter
                            color:"white";
                            text: i18n.tr("Allergen detected");
                        }
                    }
                } // header picture

                Column {
                    id: content
                    anchors.fill: parent; anchors.topMargin: headerpicture.height; anchors.leftMargin: 0; anchors.rightMargin: 0; anchors.bottomMargin: 5;
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
                        color: openFoodFacts.settings.textColor;
                    }

                    ListItem.Expandable {
                        id: sectionnutr
                        expandedHeight: contentCol2.height + units.gu(1)
                        expanded: openFoodFacts.settings.visiblenutrition
                        onClicked: {
                            if (openFoodFacts.settings.visiblenutrition === true)
                            {openFoodFacts.settings.visiblenutrition = false;
                                expendedIcon2.name = "down";}
                            else
                            {openFoodFacts.settings.visiblenutrition = true;
                                expendedIcon2.name = "up";}
                        }
                        showDivider: false

                        Column {
                            id: contentCol2
                            anchors { left: parent.left; right: parent.right }
                            Item {
                                anchors { left: parent.left; right: parent.right}
                                height: sectionnutr.collapsedHeight
                                Label {
                                    anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter}
                                    text: i18n.tr("Nutrition facts")
                                    color: openFoodFacts.settings.textColor;

                                }
                                Icon {
                                    id: expendedIcon2
                                    name: if (openFoodFacts.settings.visiblenutrition = true)
                                              expendedIcon2.name = "up"
                                          else
                                              expendedIcon2.name = "down"
                                    anchors { right: parent.right; verticalCenter: parent.verticalCenter}
                                    height: units.gu(2)
                                    width: height
                                }
                            }

                            UbuntuShape {
                                anchors { left: parent.left; right: parent.right }
                                height: imagenutr.height + sizeproduct.height + 20
                                backgroundColor: "white"

                                Column {
                                    id: contentsectionnutr
                                    anchors.fill: parent; anchors.topMargin: 10; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 10;


                                    Image {
                                        id: imagenutr
                                        fillMode: Image.PreserveAspectFit
                                        width:contentsectionnutr.width - 10;
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    Text{
                                        id: sizeproduct
                                        wrapMode: Text.Wrap
                                        width:contentsectionnutr.width;
                                        objectName: "label"
                                    }
                                }

                            }
                        }
                    }



                    ListItem.Expandable {
                        id: sectioncaract
                        expandedHeight: contentCol4.height + units.gu(1)
                        expanded: openFoodFacts.settings.visiblecharacteristics
                        onClicked: {
                            if (openFoodFacts.settings.visiblecharacteristics === true)
                            {openFoodFacts.settings.visiblecharacteristics = false;
                                expendedIcon4.name = "down";}
                            else
                            {openFoodFacts.settings.visiblecharacteristics = true;
                                expendedIcon4.name = "up";}
                        }
                        showDivider: false

                        Column {
                            id: contentCol4
                            anchors { left: parent.left; right: parent.right }
                            Item {
                                anchors { left: parent.left; right: parent.right}
                                height: sectioncaract.collapsedHeight
                                Label {
                                    anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter}
                                    text: i18n.tr("Product characteristics")
                                    color: openFoodFacts.settings.textColor;
                                }
                                Icon {
                                    id: expendedIcon4
                                    name: if (openFoodFacts.settings.visiblecharacteristics === true)
                                              expendedIcon4.name = "up"
                                          else
                                              expendedIcon4.name = "down"
                                    anchors { right: parent.right; verticalCenter: parent.verticalCenter}
                                    height: units.gu(2)
                                    width: height
                                }
                            }

                            UbuntuShape {
                                anchors { left: parent.left; right: parent.right }
                                height: descproduct.height + quantproduct.height + packproduct.height + brandproduct.height
                                        + catproduct.height + oriproduct.height + manuproduct.height + purcproduct.height + storproduct.height +
                                        counproduct.height + 20

                                backgroundColor: "white"

                                Column {
                                    id: contentsectioncaract
                                    anchors.fill: parent; anchors.topMargin: 10; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 10;

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

                                }

                            }
                        }
                    }


                    ListItem.Expandable {
                        id: sectioningr
                        expandedHeight: contentCol3.height + units.gu(1)
                        expanded: openFoodFacts.settings.visibleingredient
                        onClicked: {
                            if (openFoodFacts.settings.visibleingredient === true)
                            {openFoodFacts.settings.visibleingredient = false;
                                expendedIcon3.name = "down";}
                            else
                            {openFoodFacts.settings.visibleingredient = true;
                                expendedIcon3.name = "up";}
                        }
                        showDivider: false

                        Column {
                            id: contentCol3
                            anchors { left: parent.left; right: parent.right }
                            Item {
                                anchors { left: parent.left; right: parent.right}
                                height: sectioningr.collapsedHeight
                                Label {
                                    anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter}
                                    text: i18n.tr("Ingredients")
                                    color: openFoodFacts.settings.textColor;
                                }
                                Icon {
                                    id: expendedIcon3
                                    name: if (openFoodFacts.settings.visibleingredient = true)
                                              expendedIcon3.name = "up"
                                          else
                                              expendedIcon3.name = "down"
                                    anchors { right: parent.right; verticalCenter: parent.verticalCenter}
                                    height: units.gu(2)
                                    width: height
                                }
                            }

                            UbuntuShape {
                                anchors { left: parent.left; right: parent.right }
                                height: ingrproduct.height + allergenproduct.height + tracproduct.height + pictureButtoningr.height + productImageingr.height  + 20

                                backgroundColor: "white"

                                Column {
                                    id: contentsectioningr
                                    anchors.fill: parent; anchors.topMargin: 10; anchors.leftMargin: 8; anchors.rightMargin: 8; anchors.bottomMargin: 10;

                                    Text{
                                        id: ingrproduct
                                        wrapMode: Text.Wrap
                                        width:contentsectioningr.width;
                                        objectName: "label"
                                    }

                                    Text{
                                        id: allergenproduct
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

                                    Rectangle {
                                        id: pictureButtoningr
                                        width: parent.width
                                        height: units.gu(4)
                                        Icon {
                                            id: iconingr
                                            anchors.right: labelingr.left
                                            anchors.rightMargin: 4
                                            anchors.verticalCenter: parent.verticalCenter;
                                            name: "stock_image"
                                            width: units.gu(2)
                                            height: units.gu(2)
                                            color: UbuntuColors.warmGrey
                                        }
                                        Label {
                                        id: labelingr
                                        anchors.horizontalCenter: parent.horizontalCenter;
                                        anchors.verticalCenter: parent.verticalCenter;
                                        text: i18n.tr("View picture")
                                        }
                                        MouseArea {
                                            anchors.fill: pictureButtoningr
                                            onClicked: {
                                                productImageingr.visible = true;
                                                productImageingr.width = parent.width;
                                            }
                                        }
                                    }

                                    Image {
                                        id : productImageingr;
                                        fillMode: Image.PreserveAspectFit
                                        width: 0
                                        visible: false
                                    }

                                }

                            }
                        }
                    }



                    ListItem.Expandable {
                        id: sectiontablenutr
                        expandedHeight: contentCol1.height + units.gu(1)
                        expanded: openFoodFacts.settings.visiblecomposition
                        onClicked: {
                            if (openFoodFacts.settings.visiblecomposition === true)
                            {openFoodFacts.settings.visiblecomposition = false;
                                expendedIcon.name = "down";}
                            else
                            {openFoodFacts.settings.visiblecomposition = true;
                                expendedIcon.name = "up";}
                        }
                        showDivider: false

                        Column {
                            id: contentCol1
                            anchors { left: parent.left; right: parent.right }
                            Item {
                                anchors { left: parent.left; right: parent.right}
                                height: sectiontablenutr.collapsedHeight
                                Label {
                                    anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter}
                                    text: i18n.tr("nutritional value")
                                    color: openFoodFacts.settings.textColor;
                                }
                                Icon {
                                    id: expendedIcon
                                    name: if (openFoodFacts.settings.visiblecomposition = true)
                                              expendedIcon.name = "up"
                                          else
                                              expendedIcon.name = "down"
                                    anchors { right: parent.right; verticalCenter: parent.verticalCenter}
                                    height: units.gu(2)
                                    width: height
                                }
                            }

                            UbuntuShape {
                                anchors { left: parent.left; right: parent.right }
                                height: tablenutri.height + energy.height + fat.height + carbohydrates.height + sugars.height + fiber.height + proteins.height + salt.height + sodium.height + pictureButtonnutr.height + productImagenutr.height + 20
                                backgroundColor: "white"

                                Column {
                                    id: contentsectiontablenutr
                                    anchors.fill: parent; anchors.topMargin: 10; anchors.leftMargin: 3; anchors.rightMargin: 3; anchors.bottomMargin: 10;


                                    ListItem.SingleValue {
                                        id:tablenutri
                                        text: "<b><font color=\"#000000\">"+i18n.tr("Composition by")+"</b></font>"
                                        value: "<b><font color=\"#620000\">100 g/ml</font></b> | <b><font color=\"#002762\">"+i18n.tr("serving")+"</font></b>"
                                    }
                                    ListItem.Divider { }

                                    ListItem.SingleValue {
                                        id: energy
                                        text: "<font color=\"#000000\">"+i18n.tr("Energy")+"</font>"
                                    }
                                    ListItem.SingleValue {
                                        id: fat
                                        text: "<font color=\"#000000\">"+i18n.tr("Fat")+"</font><br/><font color=\"#000000\">"+i18n.tr("and")+" "+i18n.tr("Lipides")+"</font>"
                                    }
                                    //ListItem.SingleValue {
                                    //    id: saturated-fat_100g
                                    //    text: "<font color=\"#000000\">    dont Saturé")+"</font>"
                                    //}
                                    ListItem.SingleValue {
                                        id: carbohydrates
                                        text: "<font color=\"#000000\">"+i18n.tr("Carbohydrate")+"</font>"
                                    }
                                    ListItem.SingleValue {
                                        id: sugars
                                        text: "<font color=\"#000000\">    "+i18n.tr("of which Sugars")+"</font>"
                                    }
                                    ListItem.SingleValue {
                                        id: fiber
                                        text: "<font color=\"#000000\">"+i18n.tr("Dietary fiber")+"</font>"
                                    }
                                    ListItem.SingleValue {
                                        id: proteins
                                        text: "<font color=\"#000000\">"+i18n.tr("Proteins")+"</font>"
                                    }
                                    ListItem.SingleValue {
                                        id: salt
                                        text: "<font color=\"#000000\">"+i18n.tr("Salt")+"</font>"
                                    }
                                    ListItem.SingleValue {
                                        id: sodium
                                        text: "<font color=\"#000000\">    "+i18n.tr("Sodium")+"</font>"
                                    }

                                    Rectangle {
                                        id: pictureButtonnutr
                                        width: parent.width
                                        height: units.gu(4)
                                        Icon {
                                            id: iconnutr
                                            anchors.right: labelnutr.left
                                            anchors.rightMargin: 4
                                            anchors.verticalCenter: parent.verticalCenter;
                                            name: "stock_image"
                                            width: units.gu(2)
                                            height: units.gu(2)
                                            color: UbuntuColors.warmGrey
                                        }
                                        Label {
                                        id: labelnutr
                                        anchors.horizontalCenter: parent.horizontalCenter;
                                        anchors.verticalCenter: parent.verticalCenter;
                                        text: i18n.tr("View picture")
                                        }
                                        MouseArea {
                                            anchors.fill: pictureButtonnutr
                                            onClicked: {
                                                productImagenutr.visible = true;
                                                productImagenutr.width = parent.width;
                                            }
                                        }
                                    }

                                    Image {
                                        id : productImagenutr;
                                        fillMode: Image.PreserveAspectFit
                                        width: 0
                                        visible: false
                                    }
                                }
                            }
                        }
                    }







                }

            } //Flickable
        }
    }



}

