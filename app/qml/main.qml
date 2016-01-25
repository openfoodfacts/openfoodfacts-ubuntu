import QtQuick 2.4
import Ubuntu.Components 1.3
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.0
import "qrc:///component/qml/component"


MainView {
    id: openFoodFacts
    objectName: "openFoodFacts"
    applicationName: "openfoodfacts.ubuntouch-fr"

    width: units.gu(40)
    height: units.gu(68)

    //Theme.name = "Ubuntu.Components.Themes.SuruDark"
    headerColor: openFoodFacts.settings.color;

    /* theme.palette: Palette {
           normal.background: UbuntuColors.blue
       }
    Component.onCompleted: { console.log(i18n.domain)
        console.log(i18n.language)
        if(settings.allergen === undefined)
            settings.allergen = []
    }*/

    // for display the right icon in RadialButton
    property string currentPage : ""

    function getHistoryArray() {
        var history = [], hM_l = openFoodFacts.historyModel.count;
        for (var i=0; i<hM_l; i++){
            var item = openFoodFacts.historyModel.get(i);
            history.push({"label": item.label, "codebarre": item.codebarre});
        }

        console.log("historyModel to array, size : "+history.length);
        return history;
    }

    // historyListModel
    property ListModel historyModel: ListModel { id :historyModel}

    property ListModel allergenModel :     ListModel {
        id: allergenModel;
        dynamicRoles: true;
        Component.onCompleted: {
            allergenModel.append({
                                     "label": i18n.tr("gluten"),
                                     "products" : i18n.tr("gluten, wheat, rye, barley, oats, spelt, kamut, wheat semolina"),
                                     "products_fr" : "gluten, blé, seigle, orge, avoine, épeautre, sarrasin, kamut, son de blé, blé complet, gluten de blé, fibre de blé, malt d'orge, malt, froment, farine de blé, farine de froment"
                                 } );
            allergenModel.append({
                                     "label": i18n.tr("crustaceans"),
                                     "products" : i18n.tr("crustaceans, crab, lobster, crayfish, prawn, shrimp"),
                                     "products_fr" : "crustacés, crustacé, crabe, crabes, homard, homards, langouste, langoustine, gambas, crevettes, crevette"} );
            allergenModel.append({
                                     "label": i18n.tr("eggs"),
                                     "products" : i18n.tr("eggs, egg, egg yolk"),
                                     "products_fr" : "œufs, œuf, oeufs, oeuf, blanc d'oeuf, jaune d'oeuf, blanc d'œuf, jaune d'œuf, blanc d'œufs, jaune d'œufs, oeuf frais, œuf frais, œufs frais, oeufs frais" } );
            allergenModel.append({
                                     "label": i18n.tr("fish"),
                                     "products" : i18n.tr("fish, fishes, cod, mackerel, flounder, halibut, turbot, haddock, salmon, sole, trout, tuna, sardine, sardines"),
                                     "products_fr" : "poisson, poissons, cabillaud, morue, maquereau, flétan, turbot, colin, haddock, aiglefin, saumon, sole, truite, thon, sardine, sardines, loup, colin d'Alaska, anchois, brochet, hareng, harengs, merlu, lieu, merlan, saumon fumé" } );

            allergenModel.append({
                                     "label": i18n.tr("peanuts"),
                                     "products" : i18n.tr("peanuts, peanut, arachis hypogaea"),
                                     "products_fr" : "arachides, arachide, cacahuètes, cacahuète, cacahouètes, cacahouète, arachis hypogaea" } );

            allergenModel.append({
                                     "label": i18n.tr("soybeans"),
                                     "products" : i18n.tr("soybeans, soya, soja, soia, soy"),
                                     "products_fr" : "soja, soya, soia, sojas, son de soja, lécithine de soja, tonyu, graines de soja" } );

            allergenModel.append({
                                     "label": i18n.tr("milk"),
                                     "products" : i18n.tr("milk, lactose, whey, dairy, butter, cream, yogurt, cheese, yoghurt"),
                                     "products_fr" : "lactose, laitier, laitiere, laitiers, crème, beurre, bas-beurre, babeurre, beurre patissier, petit-lait, yaourt, fromage, méton, lait cru, Emmental, comte, bleu, edam, lactique, lactiques, ferments lactiques, cheddar, reblochon, parmesan, mimolette, crème de lait, fromage de vache, fromage de chèvre, gouda, lait écrémé, lait entier, lactoserum, lactosérum, mozzarella, protéines de lait, crème fraiche, ricotta, fromage blanc, mascarpone, caséinate, caséine" } );

            allergenModel.append({
                                     "label": i18n.tr("nuts"),
                                     "products" : i18n.tr("nuts, almonds, hazelnuts, walnuts, cashews, cashew, pecan nuts, pecan,  Brazil nuts, pistachio nuts, macadamia, Queensland nuts"),
                                     "products_fr" :"fruits à coque, amandes, noisettes, noix, noix de cajou, noix de pécan, noix du Brésil, pistaches, noix de Macadamia, noix du Queensland, fruits secs, autres fruits secs"} );

            allergenModel.append({
                                     "label": i18n.tr("celery"),
                                     "products" : i18n.tr("celery"),
                                     "products_fr" :"céleri, céleri-rave"} );

            allergenModel.append({
                                     "label": i18n.tr("mustard"),
                                     "products" : i18n.tr("mustard, brassica"),
                                     "products_fr" :"moutarde, graines de moutarde"} );

            allergenModel.append({
                                     "label": i18n.tr("sesame"),
                                     "products" : i18n.tr("sesame seeds, sesame"),
                                     "products_fr" :"graines de sésame, sésame"} );

            allergenModel.append({
                                     "label": i18n.tr("sulfur"),
                                     "products" : i18n.tr("sulphur dioxide and sulphites, sulphur dioxide, sulphites, sulfites, bisulfite, metabisulfite, E150b, E150d, E220, E221, E222, E223, E224, E225, E226, E227, E228"),
                                     "products_fr" :"anhydride sulfureux et sulfites, anhydride sulfureux, sulfites, sulfite, sulphites, sulphite, bisulfite, metabisulfite, disulfite, disulfites, disulfite de sodium, disulfite de potassium, E150b, E150d, E220, E221, E222, E223, E224, E225, E226, E227, E228"} );

            allergenModel.append({
                                     "label": i18n.tr("molluscs"),
                                     "products" : i18n.tr("molluscs, mollusc, mollusks, mollusk, squid, cuttlefish, oysters, oyster, mussles, mussle, clams, clam, scallops, scallop"),
                                     "products_fr" :"mollusques, mollusque, poulpe, seiche, encornet, calamar, calmar, huitres, huitre, moules, moule, noix de saint-jacques, noix de st-jacques, escargot, escargots"} );

            allergenModel.append({
                                     "label": i18n.tr("lupin"),
                                     "products" : i18n.tr("lupin"),
                                     "products_fr" :"lupin"} );
        }
    }

    // persistent app settings:
    property var settings: Settings {

        property bool firstRun: true

        property bool scanhomepage: false
        property bool visiblecomposition: true
        property bool visiblenutrition:	true
        property bool visibleingredient:	true
        property bool visiblecharacteristics:	true

        property string color:  '#48c1ba'
        property string fontColor : "white";

        property var allergen;

        property bool developerModeEnabled:	false;
        property var history;
    }

    PageStack {
        id: pageStack
        height: parent.height
        Component.onCompleted: {
            console.log("###### on Component completion #####")
            // Show the welcome wizard only when running the app for the first time
             if (settings.firstRun) {
                 console.log("[LOG]: Detecting first time run by user. Starting welcome wizard.")
                 push(Qt.resolvedUrl("qrc:///welcomewizard/qml/welcomewizard/WelcomeWizard.qml"))
             } else {
                     push(mainpage);
             }

            if(typeof openFoodFacts.settings.allergen === 'undefined') {
                console.log("allergen is undefined, let's create a new one");
                openFoodFacts.settings.allergen = [];
            }

            // deal with history
            if(typeof openFoodFacts.settings.history === 'undefined') {
                console.log("history is undefined, let's create a new one");
                openFoodFacts.settings.history = [];
            }
            console.log("Retrieve history with : "+ openFoodFacts.settings.history.length +" elemets");
            var history_l = openFoodFacts.settings.history.length
            for (var i=0; i<history_l; i++){
                var item = openFoodFacts.settings.history[i];
                openFoodFacts.historyModel.insert(i,{"label": item.label, "codebarre": item.codebarre})
            }
        }
        Component.onDestruction: {
            console.log("####### On component destruction ###### ");
            openFoodFacts.settings.history = getHistoryArray();
            console.log("Store an history with : "+ openFoodFacts.settings.history.length +" elemets");
        }

        Page {
            title: i18n.tr("OpenFoodFacts")
            id: mainpage
            Component.onCompleted: openFoodFacts.currentPage="Main"

            head {
                actions: [
                    Action {
                        text: i18n.tr("Settings")
                        iconName: "settings"
                        onTriggered: {
                            pageStack.push(Qt.resolvedUrl("Settings.qml"));
                        }
                    }
                ]
                foregroundColor: openFoodFacts.settings.fontColor;
            }


            Rectangle {
                id:rect1
                anchors.fill:parent
                color: "#EDEDEC"
                Column {
                    spacing: units.gu(2)
                    anchors {
                        right: parent.right
                        left: parent.left

                    }

                    Rectangle {
                        id: headerpicture
                        width: parent.width;
                        height: units.gu(20)
                        color: "#EDEDEC"

                        Image {
                            id : picturebackgroundtop;
                            source:"nutrition.jpg";
                            width: parent.width;
                            height: units.gu(15)
                            fillMode: Image.PreserveAspectCrop

                        }

                        Image {
                            id : productImage;
                            fillMode: Image.PreserveAspectCrop
                            visible: false // Do not forget to make original pic insisible
                        }


                        Rectangle {
                            id: mask
                            anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: picturebackgroundtop.bottom;
                            width: units.gu(9)
                            height: units.gu(9)
                            color: "#EDEDEC"
                            radius: 120
                            clip: true
                            visible: true

                            Rectangle {
                                id: mask2
                                anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: mask.verticalCenter;
                                width: units.gu(8)
                                height: units.gu(8)
                                color: openFoodFacts.settings.color;
                                radius: 120
                                clip: true
                                visible: true

                                Icon {
                                    id: shootIcon
                                    name: "camera-app-symbolic"
                                    anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter;
                                    width: units.gu(5)
                                    height: units.gu(5)
                                    color: "#FFFFFF"
                                }
                            }

                            MouseArea {
                                anchors.fill: mask
                                onClicked: {
                                    pageStack.push(Qt.resolvedUrl("barcodeReader.qml"));
                                }
                            }
                        }
                    } // header picture


                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: units.gu(1)

                        TextField {
                            id: barcodeinput
                            height: units.gu(4)
                            placeholderText: i18n.tr("Enter your product's name or product's barcode")
                            //inputMethodHints : Qt.ImhDigitsOnly
                        }


                        Button {
                            objectName: "envoyer"
                            width: units.gu(4)
                            height: units.gu(4)
                            iconName: "search"
                            onClicked: {
                                function isNumeric(n) {
                                    return !isNaN(parseFloat(n)) && isFinite(n);
                                }

                                var searchValue = barcodeinput.text;

                                // if it's a barcode
                                if (isNumeric(searchValue)) {
                                    pageStack.push(Qt.resolvedUrl("ProductView.qml"), {"barcode": searchValue});
                                } else {
                                    pageStack.push(Qt.resolvedUrl("ProductSearchResult.qml"), {"productNameSearch": searchValue});
                                }
                            }
                        } // send button

                    }
                }
            }

        } //page

    } //pagestack

    RadialBottomEdge {
        id:radialBottom;
        actions: [

            RadialAction {
                iconName: "search"
                iconColor: UbuntuColors.coolGrey
                enabled : openFoodFacts.currentPage !== "Main";
                onTriggered : {
                    if (pageStack.depth > 0) {
                        pageStack.clear();
                    }
                    openFoodFacts.currentPage="Main";
                    pageStack.push(mainpage);
                }
            },

            /*RadialAction {
                iconName: "add"
                iconColor: "white"
                backgroundColor: UbuntuColors.green
                enabled : openFoodFacts.currentPage !== "AddProduct"
                onTriggered: {
                    openFoodFacts.currentPage="AddProduct";
                    pageStack.push(Qt.resolvedUrl("addproduct.qml"));
                }
            },*/

            RadialAction {
                iconName: "settings"
                iconColor: UbuntuColors.coolGrey
                enabled : openFoodFacts.currentPage !== "Settings"
                onTriggered: {
                    openFoodFacts.currentPage="Settings";
                    pageStack.push(Qt.resolvedUrl("Settings.qml"));
                }
            },

            RadialAction {
                iconName: "browser-timeline"
                iconColor: UbuntuColors.coolGrey
                enabled : openFoodFacts.currentPage !== "History"
                onTriggered: {
                    openFoodFacts.currentPage="History";
                    pageStack.push(Qt.resolvedUrl("history.qml"));
                }
            }
        ] // RadialAction list
    }

} //mainview
