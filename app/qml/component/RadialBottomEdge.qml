import QtQuick 2.2
import QtFeedback 5.0
import Ubuntu.Components 1.1

Item {
    id: bottomEdge
    
    property int hintSize: units.gu(8)
    property color hintColor: Theme.palette.normal.overlay
    property string hintIconName: "view-grid-symbolic"
    property alias hintIconSource: hintIcon.source
    property color hintIconColor: UbuntuColors.coolGrey
    property bool bottomEdgeEnabled: true

    property int expandAngle: 360
    property real expandedPosition: (0.85 - 0.25 * expandAngle/360) * height
    property real collapsedPosition: height - hintSize/2

    property list<RadialAction> actions
    property real actionButtonSize: units.gu(7)
    property real actionButtonDistance: 1.5* hintSize

    anchors.fill: parent

    HapticsEffect {
        id: clickEffect
        attackIntensity: 0.0
        attackTime: 50
        intensity: 1.0
        duration: 10
        fadeTime: 50
        fadeIntensity: 0.0
    }

    Rectangle {
        id: bgVisual
        
        z: 1
        color: "black"
        anchors.fill: parent
        opacity: 0.7 * ((bottomEdge.height - bottomEdgeHint.y) / bottomEdge.height)
    }
    
    Rectangle {
        id: bottomEdgeHint

        color: hintColor
        width: hintSize
        height: width
        radius: width/2
        visible: bottomEdgeEnabled

        anchors.horizontalCenter: parent.horizontalCenter
        y: collapsedPosition
        z: parent.z + 1

        Rectangle {
            id: dropShadow
            width: parent.width
            height: parent.height
            border.color: "#B3B3B3"
            color: "Transparent"
            radius: parent.radius
            z: -1
            anchors {
                centerIn: parent
                verticalCenterOffset: units.gu(-0.3)
            }
        }
        
        Icon {
            id: hintIcon
            width: hintSize/4
            height: width
            name: hintIconName
            color: hintIconColor
            anchors {
                centerIn: parent
                verticalCenterOffset: width * ((bottomEdgeHint.y - expandedPosition)
                                               /(expandedPosition - collapsedPosition))
            }
        }

        property real actionListDistance: -actionButtonDistance * ((bottomEdgeHint.y - collapsedPosition)
                                                                   /(collapsedPosition - expandedPosition))

        Repeater {
            id: actionList
            readonly property real itemSpace: bottomEdge.expandAngle/actionList.count;
            readonly property real substractAngle: (bottomEdge.expandAngle == 360 || !actionList.count) ?
                                                    0 : (actionList.count-1)/2 * itemSpace
            model: actions
            delegate: Rectangle {
                id: actionDelegate
                readonly property real radAngle: (index % actionList.count * actionList.itemSpace - actionList.substractAngle) * Math.PI / 180
                property real distance: bottomEdgeHint.actionListDistance
                z: -1
                width: actionButtonSize
                height: width
                radius: width/2
                anchors.centerIn: parent
                color: modelData.backgroundColor
                opacity: modelData.enabled ? 1.0 : 0.7
                transform: Translate {
                    x: distance * Math.sin(radAngle)
                    y: -distance * Math.cos(radAngle)
                }

                Icon {
                    anchors.centerIn: parent
                    width: parent.width/2
                    height: width
                    name: modelData.iconName
                    color: modelData.iconColor
                }

                MouseArea {
                    enabled: modelData.enabled
                    anchors.fill: parent
                    onClicked: {
                        clickEffect.start()
                        bottomEdgeHint.state = "collapsed"
                        modelData.triggered(null)
                    }
                }
            }
        }
        
        MouseArea {
            id: mouseArea
            
            property real previousY: -1
            property string dragDirection: "None"
            
            z: 1
            anchors.fill: parent
            visible: bottomEdgeEnabled
            
            preventStealing: true
            drag {
                axis: Drag.YAxis
                target: bottomEdgeHint
                minimumY: expandedPosition
                maximumY: collapsedPosition
            }
            
            onReleased: {
                if ((dragDirection === "BottomToTop") &&
                        bottomEdgeHint.y < collapsedPosition) {
                    bottomEdgeHint.state = "expanded"
                } else {
                    if (bottomEdgeHint.state === "collapsed") {
                        bottomEdgeHint.y = collapsedPosition
                    }
                    bottomEdgeHint.state = "collapsed"
                }
                previousY = -1
                dragDirection = "None"
            }

            onClicked: {
                if (bottomEdgeHint.y === collapsedPosition)
                    bottomEdgeHint.state = "expanded"
                else
                    bottomEdgeHint.state = "collapsed"
            }
            
            onPressed: {
                previousY = bottomEdgeHint.y
            }
            
            onMouseYChanged: {
                var yOffset = previousY - bottomEdgeHint.y
                if (Math.abs(yOffset) <= units.gu(2)) {
                    return
                }
                previousY = bottomEdgeHint.y
                dragDirection = yOffset > 0 ? "BottomToTop" : "TopToBottom"
            }
        }
        
        state: "collapsed"
        states: [
            State {
                name: "collapsed"
                PropertyChanges {
                    target: bottomEdgeHint
                    y: collapsedPosition
                }
            },
            State {
                name: "expanded"
                PropertyChanges {
                    target: bottomEdgeHint
                    y: expandedPosition
                }
            },
            
            State {
                name: "floating"
                when: mouseArea.drag.active
            }
        ]
        
        transitions: [
            Transition {
                to: "expanded"
                SpringAnimation {
                    target: bottomEdgeHint
                    property: "y"
                    spring: 2
                    damping: 0.2
                }
            },
            
            Transition {
                to: "collapsed"
                SmoothedAnimation {
                    target: bottomEdgeHint
                    property: "y"
                    duration: UbuntuAnimation.BriskDuration
                }
            }
        ]
    }
}
