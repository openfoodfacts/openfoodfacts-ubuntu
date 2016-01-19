import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Qt.labs.settings 1.0
import Ubuntu.Components.Popups 0.1

Page {
    id: settingsPage

    title: i18n.tr("Settings")
    signal settingsChanged()

    head {
        actions: [

            Action {
                text: i18n.tr("about")
                iconName: "info"
                onTriggered: {
                    pageStack.push(Qt.resolvedUrl("About.qml"));
                }
            }
        ]
        foregroundColor: openFoodFacts.settings.fontColor;
    }
    Rectangle {
        id:main
        anchors.fill: parent;
        color: "#EDEDEC"

        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: settingsColumn.height
            flickableDirection: Flickable.VerticalFlick
            clip: true


            Column {
                id: settingsColumn
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }

                ListItem.Header {
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Global")+"</font>"
                }

                ListItem.MultiValue {
                    visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                    showDivider: false
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Allergen")+"</font>"
                    function addFontColor(list, color) {
                        if(list.length > 0) {
                            var txtlist = list.slice(); //local copy
                            txtlist[0] = "<font color=\""+color+"\">"+txtlist[0];
                            txtlist[txtlist.length-1] = txtlist[txtlist.length-1]+"</font>";
                            return txtlist;
                        }
                        else
                            return [];
                    }
                    values: addFontColor(openFoodFacts.settings.allergen, "#b3b3b3")
                    progression: true
                    onTriggered: {
                        pageStack.push(Qt.resolvedUrl("Allergen.qml"));
                    }
                }


                Component {
                    id: dialog
                    Dialog {
                        id: dialogue
                        title: i18n.tr("Choose a color")
                        Row {
                            id: row
                            width: main.width
                            spacing: units.gu(1)

                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "red"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "red"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "#FF0099"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "#FF0099"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "#CC0066"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "#CC0066"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "purple"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "purple"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "indigo"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "indigo"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "blue"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "blue"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "#1ab6ef"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "#1ab6ef"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "#336666"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "#336666"
                                        ;

                                    }
                                }
                            }



                        }

                        Row {
                            id: row2
                            width: main.width
                            spacing: units.gu(1)

                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "green"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "green"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "#00CC66"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "#00CC66"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "#FF9966"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "#FF9966"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "orange"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "orange"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "grey"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "grey"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "#647da4"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "#647da4"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "brown"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "brown"; }
                                }
                            }
                            Rectangle {
                                width: units.gu(3)
                                height: units.gu(3)
                                color: "black"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.close(dialogue);
                                        openFoodFacts.settings.color = "black"; }
                                }
                            }



                        }


                        Row {
                            id: row3
                            width: parent.width
                            spacing: units.gu(1)

                            /*********************************** COLOR PICKER START **************************************/

                            Component {
                                id: dialog2
                                Dialog {
                                    id: dialogue2
                                    title: "Picker"
                                    Row {
                                        id: row2
                                        width: parent.width
                                        spacing: units.gu(1)



                                        Item
                                        {
                                            width: parent.width
                                            height: width

                                            function updateSelectedColor()
                                            {
                                                ColorPickerContext.selected_red =
                                                        (1 - (cursor.y / height)) *
                                                        (1 + (cursor.x / width) * (main_red - 1))
                                                ColorPickerContext.selected_green =
                                                        (1 - (cursor.y / height)) *
                                                        (1 + (cursor.x / width) * (main_green - 1))
                                                ColorPickerContext.selected_blue =
                                                        (1 - (cursor.y / height)) *
                                                        (1 + (cursor.x / width) * (main_blue - 1))
                                            }

                                            Rectangle
                                            {
                                                width: parent.height
                                                height: parent.width
                                                transform: Rotation { angle: 90}
                                                x: parent.width
                                                y: 0
                                                gradient: Gradient
                                                {
                                                    GradientStop { position: 0.0; color: Qt.rgba(main_red, main_green, main_blue, 1)}
                                                    GradientStop { position: 1.0; color: "white" }
                                                }
                                            }

                                            Rectangle
                                            {
                                                anchors.fill: parent
                                                gradient: Gradient
                                                {
                                                    GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 0) }
                                                    GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 1) }
                                                }
                                            }

                                            Image
                                            {
                                                id: cursor
                                                x: width/2
                                                y: height/2
                                                source: "cursor.png"
                                            }

                                            MouseArea
                                            {
                                                acceptedButtons: Qt.LeftButton
                                                anchors.fill: parent
                                                onPressed:
                                                {
                                                    cursor.x = mouseX - 4
                                                    cursor.y = mouseY - 4
                                                    updateSelectedColor()
                                                }
                                                onPositionChanged:
                                                {
                                                    cursor.x = mouseX - 4
                                                    cursor.y = mouseY - 4
                                                    updateSelectedColor()
                                                }
                                            }
                                        }


                                    }

                                    Button {
                                        width: parent.width
                                        text: i18n.tr("Cancel")
                                        color:  "#fc4949"
                                        onClicked: PopupUtils.close(dialogue2);
                                    }

                                }
                            }
                            Image {
                                id : productImage;
                                visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                                source: Qt.resolvedUrl("qrc:///images/picker.png");
                                fillMode: Image.PreserveAspectCrop
                                width: units.gu(4)
                                height: units.gu(4)
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { PopupUtils.open(dialog2) }
                                }
                            }


                            /*********************************** COLOR PICKER END ***************************************/

                            TextField {
                                visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                                id: barcodeinput
                                width: parent.width/1.6
                                placeholderText: i18n.tr("Example : #1ab6ef")
                            }

                            Button {
                                visible: (openFoodFacts.settings.developerModeEnabled) //MODE DEVELOPPER
                                width: parent.width/6;
                                text: i18n.tr("ok");
                                color:  "#38B44A"
                                onClicked: ((barcodeinput.text == "")? openFoodFacts.settings.color = "#1ab6ef" : openFoodFacts.settings.color = barcodeinput.text),
                                           PopupUtils.close(dialogue)
                            }

                        }

                        Row {
                            id: row4
                            width: parent.width
                            spacing: units.gu(1)

                            Button {
                                width: parent.width
                                text: i18n.tr("Cancel")
                                color:  "#fc4949"
                                onClicked: PopupUtils.close(dialogue);
                            }
                        }


                    }
                }
                ListItem.SingleValue {
                    showDivider: false
                    progression: true
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Theme")+"</font>"
                    onClicked: PopupUtils.open(dialog)
                }

                ListItem.Header {
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Viewing Information")+"</font>"
                }

                ListItem.Standard {
                    showDivider: false
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Product characteristics")+"</font>"
                    control: Switch {
                        id: characteristicswitch
                        checked: openFoodFacts.settings.visiblecharacteristics
                        onClicked: { openFoodFacts.settings.visiblecharacteristics = checked;
                        }
                    }
                }

                ListItem.Standard {
                    showDivider: false
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("ingredients")+"</font>"
                    control: Switch {
                        id: ingredientwitch
                        checked: openFoodFacts.settings.visibleingredient
                        onClicked: { openFoodFacts.settings.visibleingredient = checked;
                        }
                    }
                }

                ListItem.Standard {
                    showDivider: false
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Nutrition facts")+"</font>"
                    control: Switch {
                        id: nutritionwitch
                        checked: openFoodFacts.settings.visiblenutrition
                        onClicked: { openFoodFacts.settings.visiblenutrition = checked;
                        }
                    }
                }

                ListItem.Standard {
                    showDivider: false
                    text: "<font color=\""+openFoodFacts.settings.color+"\">"+i18n.tr("Composition")+"</font>"
                    control: Switch {
                        id: compositionwitch
                        checked: openFoodFacts.settings.visiblecomposition
                        onClicked: { openFoodFacts.settings.visiblecomposition = checked;
                        }
                    }
                }

            }
        }
    }
}
