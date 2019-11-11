import QtQuick 2.4
import Ubuntu.Components 1.3
import "qrc:///component/qml/component"
import "qrc:///component/qml/component/allergen.js" as ALLERGEN
import QtGraphicalEffects 1.0


Page {
    id: pageProductView
    header: PageHeader {
        title: titleLabel.text;

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
                labelbarcode.text=pageProductView.barcode;
                
                nbAdditives.text = _json.additives_n;
    
                //if (_json.image_nutrition_url) {productImagenutr.source = _json.image_nutrition_url;};
                
                //if (_json.image_ingredients_url) {productImageingr.source = _json.image_ingredients_url;}else{ pictureButtoningr.visible = false; pictureButtoningr.height = units.gu(0); }

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

                //var serving_size = _json.serving_size || 'n/a';
                //sizeproduct.text = "<b><br/>"+i18n.tr("Serving size")+" : </b>" + serving_size;

                var energy_100g = (typeof _json.nutriments.energy_100g !== "undefined") ? roundDecimal(_json.nutriments.energy_100g) : "n/a";
                var energy_unit = (typeof _json.nutriments.energy_unit !== "undefined") ? _json.nutriments.energy_unit : " ";
                var energy_serving  = (typeof _json.nutriments.energy_serving  !== "undefined") ? roundDecimal(_json.nutriments.energy_serving)  : "n/a";
                energy.text = energy_100g + " " + energy_unit ;

                var fat_100g = (typeof _json.nutriments.fat_100g !== "undefined") ? roundDecimal(_json.nutriments.fat_100g) : "n/a";
                var fat_unit = (typeof _json.nutriments.fat_unit !== "undefined") ? _json.nutriments.fat_unit : " ";
                var fat_serving  = (typeof _json.nutriments.fat_serving  !== "undefined") ? roundDecimal(_json.nutriments.fat_serving)  : "n/a";
                fat.text = fat_100g + " " + fat_unit;
                fatIcon.source = Qt.resolvedUrl("qrc:///assets/"+_json.nutrient_levels.fat+".svg")

                //saturated-fat_100g.text = _json.nutriments.saturated-fat_100g + " " + _json.nutriments.saturated-fat_unit;
                //saturated-fat_serving.text = _json.nutriments.saturated\-fat_serving + " " + _json.nutriments.saturated-fat_unit;

                var carbohydrates_100g = (typeof _json.nutriments.carbohydrates_100g !== "undefined") ? roundDecimal(_json.nutriments.carbohydrates_100g) : "n/a";
                var carbohydrates_unit = (typeof _json.nutriments.carbohydrates_unit !== "undefined") ? _json.nutriments.carbohydrates_unit : " ";
                var carbohydrates_serving  = (typeof _json.nutriments.carbohydrates_serving  !== "undefined") ? roundDecimal(_json.nutriments.carbohydrates_serving)  : "n/a";
                //carbohydrates.text = carbohydrates_100g + " " + carbohydrates_unit;

                var sugars_100g = (typeof _json.nutriments.sugars_100g !== "undefined") ? roundDecimal(_json.nutriments.sugars_100g) : "n/a";
                var sugars_unit = (typeof _json.nutriments.sugars_unit !== "undefined") ? _json.nutriments.sugars_unit : " ";
                var sugars_serving  = (typeof _json.nutriments.sugars_serving  !== "undefined") ? roundDecimal(_json.nutriments.sugars_serving)  : "n/a";
                sugars.text = sugars_100g + " " + sugars_unit;
                sugarsIcon.source = Qt.resolvedUrl("qrc:///assets/"+_json.nutrient_levels.sugars+".svg")
    
    
                var fiber_100g = (typeof _json.nutriments.fiber_100g !== "undefined") ? roundDecimal(_json.nutriments.fiber_100g) : "n/a";
                var fiber_unit = (typeof _json.nutriments.fiber_unit !== "undefined") ? _json.nutriments.fiber_unit : " ";
                var fiber_serving  = (typeof _json.nutriments.fiber_serving  !== "undefined") ? roundDecimal(_json.nutriments.fiber_serving) : "n/a";
                fiber.text = fiber_100g + " " + fiber_unit;

                var proteins_100g = (typeof _json.nutriments.proteins_100g !== "undefined") ? roundDecimal(_json.nutriments.proteins_100g) : "n/a";
                var proteins_unit = (typeof _json.nutriments.proteins_unit !== "undefined") ? _json.nutriments.proteins_unit : " ";
                var proteins_serving  = (typeof _json.nutriments.proteins_serving  !== "undefined") ? roundDecimal(_json.nutriments.proteins_serving)  : "n/a";
                proteins.text = proteins_100g + " " + proteins_unit;

                var salt_100g = (typeof _json.nutriments.salt_100g !== "undefined") ? roundDecimal(_json.nutriments.salt_100g) : "n/a";
                var salt_unit = (typeof _json.nutriments.salt_unit !== "undefined") ? _json.nutriments.salt_unit : " ";
                var salt_serving  = (typeof _json.nutriments.salt_serving  !== "undefined") ? roundDecimal(_json.nutriments.salt_serving)  : "n/a";
                salt.text = salt_100g + " " + salt_unit;
                saltIcon.source = Qt.resolvedUrl("qrc:///assets/"+_json.nutrient_levels.salt+".svg")
    
                var sodium_100g = (typeof _json.nutriments.sodium_100g !== "undefined") ? roundDecimal(_json.nutriments.sodium_100g): "n/a";
                var sodium_unit = (typeof _json.nutriments.sodium_unit !== "undefined") ? _json.nutriments.sodium_unit : " ";
                var sodium_serving  = (typeof _json.nutriments.sodium_serving  !== "undefined") ? roundDecimal(_json.nutriments.sodium_serving)  : "n/a";
                //sodium.text = sodium_100g + " " + sodium_unit;

                if (ALLERGEN.isContainsAllergen(ingredients_text_with_allergens) === true) {
                    allergenWarning.visible = true;
                    allergenIcon.source = Qt.resolvedUrl("qrc:///assets/high.svg")
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
                
                activity.running = false
                
            } else {
                activity.visible = false
                pageProductView.productFound = "0";
            }
        }
    }


    ActivityIndicator {
        id:activity
        anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
        objectName: "activityindicator_standard"
        anchors.leftMargin: units.gu(10)
        running: true
    }


    Flickable {
        id: mainContent
        anchors { 
            left: parent.left
            right: parent.right 
            top: header.bottom
            bottom: parent.bottom
        }
        contentHeight: contentProduct.height
        flickableDirection: Flickable.VerticalFlick
        clip: true

        Column{
            id: contentProduct
            anchors { 
                left: parent.left
                right: parent.right 
                top: header.bottom
                bottom: parent.bottom
            }
            spacing: units.gu(2)
                
                Item{
                    height: units.gu(1)
                    width: parent.width
                }
                
                Row{
                    id: headerProduct
                    width: parent.width
                    height: childrenRect.height
                        
                    Item{
                        id: margeProductImage
                        width: units.gu(20)
                        height: units.gu(15)
                            
                        Image{
                            id: productImage
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            width: units.gu(15)
                            height: units.gu(15)
                            fillMode: Image.PreserveAspectCrop
                        }
                    }
                    
                    Column{
                        width: parent.width-margeProductImage.width
                        height: units.gu(15)
                        spacing: units.gu(1)
                            
                        Label{
                            id: titleLabel
                            textSize: Label.Large
                            wrapMode: Text.Wrap
                            width: parent.width

                        }
                        Label{
                            id: labelbarcode
                            textSize: Label.Small
                        }
                        Image {
                            id: imagenutr
                            fillMode: Image.PreserveAspectFit
                            width: parent.width
                            height: units.gu(5)
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    
                }
                
                Column{
                    width: parent.width

                    Rectangle{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        height: categorieDetail.height+units.gu(2)
                        radius: units.gu(0.5)
                        color: theme.palette.normal.base

                        Label{
                            id: categorieDetail
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: units.gu(2)
                            text: i18n.tr("Composition")
                        }
                        Label{
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: units.gu(2)
                            text: i18n.tr("for 100 g")
                            color: theme.palette.normal.backgroundSecondaryText
                        }

                    }

                    
                    ListItem {
                        id: allergenWarning
                        visible: false
                        height: layoutallergen.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layoutallergen
                            title.text: i18n.tr("Allergen")
                            title.color: "#ED3146"
                            subtitle.text: i18n.tr("Presence of allergen")
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/allergen.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: allergenImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: allergenImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }
                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                
                                Label {
                                    id: nbAllergen
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: allergenIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                
                            }
                            
                            
                        }
                    }
                    
                    ListItem {
                        height: layout.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layout
                            title.text: i18n.tr("Additives")
                            subtitle.text: i18n.tr("Presence of additives")
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/additives.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: additivesImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: additivesImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }
                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                
                                Label {
                                    id: nbAdditives
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: additivesIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                Item{
                                    height: parent.height/2
                                    width: parent.height/2
                                    anchors.verticalCenter: parent.verticalCenter

                                    Icon {
                                        name: "down"
                                        antialiasing: true
                                        color: theme.palette.normal.backgroundSecondaryText
                                        visible: false
                                        id: nextImage
                                        anchors.fill: parent
                                     }
                                     ColorOverlay{
                                         visible: false//todo
                                         anchors.fill: parent
                                         source: nextImage
                                         color: theme.palette.normal.backgroundSecondaryText
                                         antialiasing: true
                                     }
                                }
                                
                            }
                            
                            
                        }
                    }
                    
               Column{
                   id: detailAdditives
                    visible: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width-units.gu(4)
                    spacing: units.gu(1)
                    
                    
                    Text{
                        id: detailAdditivesText
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }

                    
                }//column detail additives
                                        
                    
                    ListItem {
                        height: layout2.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layout2
                            title.text: i18n.tr("Calorie")
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/energy.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: energyImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: energyImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }
                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                
                                Label {
                                    id: energy
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: energyIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                
                            }
                            
                            
                        }
                    }
                    
                    ListItem {
                        height: layout3.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layout3
                            title.text: i18n.tr("Fat")
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/saturatedfat.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: saturatedfatImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: saturatedfatImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }
                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                
                                Label {
                                    id: fat
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: fatIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                
                            }
                            
                            
                        }
                    }                 
                    
                    
                    ListItem {
                        height: layout4.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layout4
                            title.text: i18n.tr("Sugars")
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/sugars.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: sugarsImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: sugarsImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }
                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                
                                Label {
                                    id: sugars
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: sugarsIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                
                            }
                            
                            
                        }
                    }        

                    ListItem {
                        height: layout6.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layout6
                            title.text: i18n.tr("Salt")
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/salt.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: saltImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: saltImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }
                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                
                                Label {
                                    id: salt
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: saltIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                
                            }
                            
                            
                        }
                    }
                    
                    
                    ListItem {
                        height: layout5.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layout5
                            title.text: i18n.tr("Proteins")
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/proteins.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: proteinsImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: proteinsImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }
                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                
                                Label {
                                    id: proteins
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: proteinsIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                
                            }
                            
                            
                        }
                    }
                    
                    
                    ListItem {
                        height: layout7.height + (divider.visible ? divider.height : 0)

                        ListItemLayout {
                            id: layout7
                            title.text: i18n.tr("Dietary fiber")
                                
                            Item{
                                SlotsLayout.position: SlotsLayout.Leading;
                                height: parent.height/2
                                width: parent.height/2
                                    
                                Icon {
                                    source: Qt.resolvedUrl("qrc:///assets/fiber.svg")
                                    antialiasing: true
                                    color: theme.palette.normal.backgroundText
                                    visible: false
                                    id: fiberImage
                                    anchors.fill: parent
                                 }
                                 ColorOverlay{
                                     anchors.fill: parent
                                     source: fiberImage
                                     color: theme.palette.normal.backgroundText
                                     antialiasing: true
                                 }
                            }    

                            Row{
                                SlotsLayout.position: SlotsLayout.Trailing;
                                height: parent.height/2
                                spacing: units.gu(1)
                                    
                                Label {
                                    id: fiber
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Icon{
                                     id: fiberIcon
                                     height: units.gu(2) 
                                     width: units.gu(2)   
                                     anchors.verticalCenter: parent.verticalCenter
                                }
                                
                            }
                            
                            
                        }
                    }
                       

                }//Column composition
            
                Column{
                    width: parent.width
                    spacing: units.gu(1)

                    Rectangle{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        height: categorieDetail.height+units.gu(2)
                        radius: units.gu(0.5)
                        color: theme.palette.normal.base

                        Label{
                            id: categorieCharacteristics
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: units.gu(2)
                            text: i18n.tr("Characteristics")
                        }

                    }
            

                    Text{
                        id: descproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: quantproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }

                    Text{
                        id: packproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)  
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: brandproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: catproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: oriproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: manuproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: purcproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: storproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: counproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    
                    
                }//column characteristics
            
            
                Column{
                    width: parent.width
                    spacing: units.gu(1)
                        
                    Rectangle{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        height: categorieDetail.height+units.gu(2)
                        radius: units.gu(0.5)
                        color: theme.palette.normal.base

                        Label{
                            id: categorieIngredients
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: units.gu(2)
                            text: i18n.tr("Ingredients")
                        }

                    }
                    
                    
                  Text{
                        id: ingrproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }

                    Text{
                        id: allergenproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }
                    Text{
                        id: tracproduct
                        wrapMode: Text.Wrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width-units.gu(4)
                        color: theme.palette.normal.backgroundText
                    }

                    
                }//column Ingredients

            
            
            
            
                Item{
                    height: units.gu(3)
                    width: parent.width
                }
        }

    } //Flickable
        
    



}

