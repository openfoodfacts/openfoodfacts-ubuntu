import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem

Page {
    id: allergen

    title: i18n.tr("Allergen");
    head {
        foregroundColor: openFoodFacts.settings.fontColor;
    }

    ListModel {
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
                "label": i18n.tr("Milk"),
                "products" : i18n.tr("milk, lactose, whey, dairy, butter, cream, yogurt, cheese, yoghurt"),
                "products_fr" : "lactose, laitier, laitiere, laitiers, crème, beurre, bas-beurre, babeurre, beurre patissier, petit-lait, yaourt, fromage, méton, lait cru, Emmental, comte, bleu, edam, lactique, lactiques, ferments lactiques, cheddar, reblochon, parmesan, mimolette, crème de lait, fromage de vache, fromage de chèvre, gouda, lait écrémé, lait entier, lactoserum, lactosérum, mozzarella, protéines de lait, crème fraiche, ricotta, fromage blanc, mascarpone, caséinate, caséine" } );

            allergenModel.append({
                "label": i18n.tr("Nuts"),
                "products" : i18n.tr("nuts, almonds, hazelnuts, walnuts, cashews, cashew, pecan nuts, pecan,  Brazil nuts, pistachio nuts, macadamia, Queensland nuts"),
                 "products_fr" :"fruits à coque, amandes, noisettes, noix, noix de cajou, noix de pécan, noix du Brésil, pistaches, noix de Macadamia, noix du Queensland, fruits secs, autres fruits secs"} );

            allergenModel.append({
                "label": i18n.tr("Celery"),
                "products" : i18n.tr("celery"),
                 "products_fr" :"céleri, céleri-rave"} );

            allergenModel.append({
                "label": i18n.tr("Mustard"),
                "products" : i18n.tr("mustard, brassica"),
                 "products_fr" :"moutarde, graines de moutarde"} );

            allergenModel.append({
                "label": i18n.tr("Sesame"),
                "products" : i18n.tr("sesame seeds, sesame"),
                 "products_fr" :"graines de sésame, sésame"} );

            allergenModel.append({
                "label": i18n.tr("Sulfur"),
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

    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

        ListView {
            anchors.fill: parent
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            anchors.topMargin: units.gu(1)
            spacing: units.gu(1)

            model: allergenModel
            delegate: Item {
                anchors.left: parent.left
                anchors.right: parent.right
                height: childrenRect.height
                anchors.leftMargin: units.gu(2)
                anchors.rightMargin: units.gu(2)

                CheckBox {
                    //anchors.verticalCenter: egg.verticalCenter
                    anchors.left: parent.left
                    checked: (openFoodFacts.settings.allergen.indexOf(label) >-1)
                    onCheckedChanged: {
                        if (checked) {
                            if (openFoodFacts.settings.allergen.indexOf(label) >-1) {
                                console.log("allergen already in array");
                            } else {
                                console.log("allergen "+label+" is not in allergen list, let's add it");
                                openFoodFacts.settings.allergen.push(label);
                            }
                        } else {
                            if(openFoodFacts.settings.allergen.indexOf(label) >-1) {
                                console.log("remove allergen "+label+" from list");
                                openFoodFacts.settings.allergen.splice(openFoodFacts.settings.allergen.indexOf(label), 1);
                            } else {
                                console.log("you try to remove "+ label+" which is not in the list");
                            }
                        }
                    }
                }

                Label {
                    fontSize: "large"
                    anchors.left: parent.left
                    anchors.leftMargin: units.gu(5)
                    color: openFoodFacts.settings.color;
                    text: products_fr;
                }
            }
        }


    }
}
