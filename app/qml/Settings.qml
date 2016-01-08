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


                                        Item {
                                            id: root
                                            clip: true
                                            width: parent.width
                                            height: units.gu(12)

                                            property color color
                                            property bool pressed: mouseArea.pressed
                                            property Component touchDelegate
                                            property variant lights
                                            property bool active: true

                                            function calculateXy(color) {
                                                if (!color.hasOwnProperty("r")) {
                                                    // Qt 4.8's color doesn't have r,g,b properties
                                                    var colorString = color.toString();
                                                    color = new Object;
                                                    color.r = 1.0 * parseInt("0x" + colorString.substring(1,3), 16) / 256;
                                                    color.g = 1.0 * parseInt("0x" + colorString.substring(3,5), 16) / 256;
                                                    color.b = 1.0 * parseInt("0x" + colorString.substring(5,7), 16) / 256;
                                                }

                                                var point = new Object;
                                                var brightness = Math.min(color.r, color.g, color.b);
                                                point.y = Math.round(root.height * brightness);
                                                var newColor = new Object;
                                                newColor.r = color.r - brightness;
                                                newColor.g = color.g - brightness;
                                                newColor.b = color.b - brightness;

                                                var sectionWidth = root.width / 6;

                                                var sections = [true, true, true];
                                                if (newColor.r > 0) {
                                                    sections[1] = false;
                                                }
                                                if (newColor.g > 0) {
                                                    sections[2] = false;
                                                }
                                                if (newColor.b > 0) {
                                                    sections[0] = false;
                                                }
                                                if (sections[0]) {
                                                    if (newColor.r > newColor.g) {
                                                        point.x = sectionWidth * newColor.g;
                                                    } else if (newColor.r == newColor.g) {
                                                        point.x = sectionWidth
                                                    } else {
                                                        point.x = sectionWidth * 2 - newColor.r * sectionWidth;
                                                    }
                                                } else if (sections[1]) {
                                                    if (newColor.g > newColor.b) {
                                                        point.x = sectionWidth * 2 + sectionWidth * newColor.b;
                                                    } else if (newColor.g == newColor.b) {
                                                        point.x = sectionWidth * 3;
                                                    } else {
                                                        point.x = sectionWidth * 4 - newColor.g * sectionWidth
                                                    }
                                                } else {
                                                    if (newColor.b > newColor.r) {
                                                        point.x = sectionWidth * 4 + sectionWidth * newColor.r
                                                    } else if (newColor.b == newColor.r) {
                                                        point.x = sectionWidth * 5;
                                                    } else {
                                                        point.x = sectionWidth * 6 - newColor.b * sectionWidth;
                                                    }
                                                }
                                                return point;
                                            }

                                            function calculateColor(x, y) {
                                                x = Math.min(Math.max(0, x), width - 1);
                                                y = Math.min(Math.max(0, y), height - 1);
                                                var color = root.color;
                                                var sectionWidth = root.width / 6;
                                                var section = Math.floor(x / sectionWidth)
                                                var sectionX = Math.floor(x % (sectionWidth - 0.00001)) // the - 0.00001 is to prevent a mismatch when rounding
                                                // sectionVal : 1.0 = sectionX : sectionWidth
                                                var sectionVal = (1.0 * sectionX / sectionWidth)

                                                // brightnessVal : 1.0 = mouseY : height
                                                var brightness = 1.0 * y / height

                                                switch (section) {
                                                case 0:
                                                    // GradientStop { position: 0.0; color: "#ff0000" }
                                                    color = Qt.rgba(1, sectionVal + brightness, brightness, 1)
                                                    break;
                                                case 1:
                                                    // GradientStop { position: 0.17; color: "#ffff00" }
                                                    color = Qt.rgba(1 - sectionVal + brightness, 1, brightness, 1)
                                                    break;
                                                case 2:
                                                    // GradientStop { position: 0.33; color: "#00ff00" }
                                                    color = Qt.rgba(brightness, 1, sectionVal + brightness, 1)
                                                    break;
                                                case 3:
                                                    // GradientStop { position: 0.5; color: "#00ffff" }
                                                    color = Qt.rgba(brightness, 1 - sectionVal + brightness, 1, 1)
                                                    break;
                                                case 4:
                                                    // GradientStop { position: 0.66; color: "#0000ff" }
                                                    color = Qt.rgba(sectionVal + brightness, brightness, 1, 1)
                                                    break;
                                                case 5:
                                                    // GradientStop { position: 0.83; color: "#ff00ff" }
                                                    color = Qt.rgba(1, brightness, 1 - sectionVal + brightness, 1)
                                                    break;
                                                }
                                                //        print("got color", color.r, color.g, color.b)
                                                return color
                                            }

                                            Rectangle {
                                                height: parent.width
                                                width: parent.height
                                                anchors.centerIn: parent
                                                rotation: -90

                                                gradient: Gradient {
                                                    GradientStop { position: 0.0; color: "#ff0000" }
                                                    GradientStop { position: 0.17; color: "#ffff00" }
                                                    GradientStop { position: 0.33; color: "#00ff00" }
                                                    GradientStop { position: 0.5; color: "#00ffff" }
                                                    GradientStop { position: 0.66; color: "#0000ff" }
                                                    GradientStop { position: 0.83; color: "#ff00ff" }
                                                    GradientStop { position: 1.0; color: "#ff0000" }
                                                }
                                            }

                                            Rectangle {
                                                anchors.fill: parent
                                                gradient: Gradient {
                                                    GradientStop { position: 0.0; color: "transparent" }
                                                    GradientStop { position: 1.0; color: "white" }
                                                }
                                            }

                                            MouseArea {
                                                id: mouseArea
                                                anchors.fill: parent
                                                preventStealing: true

                                                drag.minimumX: 0
                                                drag.maximumX: width - dndItem.width
                                                drag.minimumY: 0
                                                drag.maximumY: height - dndItem.height

                                                property variant draggedItem
                                                property variant draggedLight

                                                onPressed: {
                                                    if (root.lights) {
                                                        for (var i = 0; i < lightsDraghandleRepeater.count; i++) {
                                                            var item = lightsDraghandleRepeater.itemAt(i);
                                                            if (mouseX > item.x && mouseX < (item.x + item.width) && mouseY > item.y && mouseY < (item.y + item.height)) {

                                                                mouseArea.drag.target = dndItem;
                                                                dndItem.x = item.x;
                                                                dndItem.y = item.y;

                                                                if (dndItem.item) {
                                                                    if (dndItem.item.hasOwnProperty("text")) dndItem.item.text = i + 1;
                                                                    if (dndItem.item.hasOwnProperty("light")) dndItem.item.light = lights.get(i);
                                                                }

                                                                mouseArea.draggedLight = lights.get(i)
                                                                mouseArea.draggedItem = item;
                                                            }
                                                        }
                                                    } else {
                                                        mouseArea.drag.target = dndItem;
                                                        dndItem.x = Math.min(width - dndItem.width, Math.max(0, mouseX - dndItem.width / 2))
                                                        dndItem.y = Math.min(height - dndItem.height, Math.max(0, mouseY - dndItem.height / 2))
                                                        mouseArea.draggedItem = touchDelegateLoader;
                                                    }
                                                }
                                                onPositionChanged: {
                                                    if (mouseArea.draggedItem) {
                                                        root.color = root.calculateColor(mouseX, mouseY);
                                                        if (mouseArea.draggedLight) {
                                                            mouseArea.draggedLight.color = root.calculateColor(mouseX, mouseY);
                                                        }
                                                    }
                                                }

                                                onReleased: {
                                                    if (mouseArea.draggedItem) {
                                                        root.color = root.calculateColor(mouseX, mouseY);
                                                        if (mouseArea.draggedLight) {
                                                            mouseArea.draggedLight.color = root.calculateColor(mouseX, mouseY);
                                                        }
                                                    }
                                                    mouseArea.draggedItem = undefined;
                                                    mouseArea.draggedLight = undefined;
                                                    mouseArea.drag.target = undefined;

                                                }

                                            }

                                            Loader {
                                                id: touchDelegateLoader
                                                property variant point: calculateXy(root.color);
                                                x: item ? Math.max(0, Math.min(point.x - width * .5, parent.width - item.width)) : 0
                                                y: item ? Math.max(0, Math.min(point.y - height * .5, parent.height - item.height)) : 0
                                                sourceComponent: root.lights ? undefined : root.touchDelegate
                                                visible: mouseArea.draggedItem != touchDelegateLoader && root.active
                                                //        Behavior on x {
                                                //            enabled: !mouseArea.pressed
                                                //            NumberAnimation {}
                                                //        }
                                            }

                                            Repeater {
                                                id: lightsDraghandleRepeater
                                                model: root.lights ? lights : undefined

                                                delegate: Loader {
                                                    id: lightDelegate
                                                    sourceComponent: root.touchDelegate
                                                    property variant light: lights.get(index)
                                                    property variant point: light ? root.calculateXy(light.color) : [0, 0]
                                                    x: item ? Math.max(0, Math.min(point.x - width * .5, parent.width - item.width)) : 0
                                                    y: item ? Math.max(0, Math.min(point.y - height * .5, parent.height - item.height)) : 0
                                                    visible: mouseArea.draggedItem != lightDelegate
                                                    onLoaded: {
                                                        if (item.hasOwnProperty("text")) item.text = index + 1;
                                                        item.light = lights.get(index)
                                                    }
                                                    Behavior on x {
                                                        enabled: !mouseArea.pressed
                                                        NumberAnimation {}
                                                    }
                                                }
                                            }

                                            Loader {
                                                id: dndItem
                                                sourceComponent: root.touchDelegate
                                                visible: mouseArea.draggedItem != undefined && root.active
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
