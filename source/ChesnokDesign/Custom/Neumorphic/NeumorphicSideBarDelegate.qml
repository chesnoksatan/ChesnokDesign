import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

import ChesnokDesign 1.0

Item {
    id: delegate

    width: parent.width
    activeFocusOnTab: true

    property bool expanded: delegate.width > 100
    property string name: modelData.name

    property bool selected
    signal select()

    Item {
        id: control
        anchors.fill: parent

        Rectangle {
            id: bg
            anchors.fill: parent
            radius: Theme.neumorphicStyle.getRadius( root.size )
            color: {
                if(mouseArea.pressed) return Theme.neumorphicStyle.getPressedBackgroundColor()
                if(mouseArea.containsMouse) return Theme.neumorphicStyle.getHoverBackgroundColor()
                return Theme.neumorphicStyle.getNormalBackgroundColor()
            }
            border.width: Theme.neumorphicStyle.getBorderWidth(false)
            border.color: Theme.neumorphicStyle.getBorderColor(false)

            layer.enabled: delegate.selected
            layer.effect: InnerShadow {
                horizontalOffset: {
                    if(mouseArea.pressed) return Theme.neumorphicStyle.getPressedShadowOffset()
                    if(mouseArea.containsMouse) return Theme.neumorphicStyle.getHoveredShadowOffset()
                    return Theme.neumorphicStyle.getNormalShadowOffset()
                }
                verticalOffset: horizontalOffset
                samples: Theme.neumorphicStyle.getShadowSamples( NeumorphicButtonStyle.Inner )
                radius: Theme.neumorphicStyle.getShadowRadius( NeumorphicButtonStyle.Inner )
                color: "#35373E"

                Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
                Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
            }
        }
    }

    Icon {
        id: icon

        color: "#FAFBFF"

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: delegate.left
        anchors.leftMargin: 4

        source: modelData.iconSource ? modelData.iconSource : ""
        group: modelData.iconGroup ? modelData.iconGroup : ""
        name: modelData.iconName ? modelData.iconName : ""

        size: delegate.height - 8
        z: 2
    }

    Label {
        id: caption
        color: Theme.neumorphicStyle.getTextColor()
        text: delegate.name ? delegate.name : ""
        visible: delegate.expanded && delegate.name
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: icon.right
        anchors.leftMargin: 8

        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.DemiBold
        z: 2
    }

    InnerShadow {
        anchors.fill: control
        source: control
        horizontalOffset: {
            if(mouseArea.pressed) return -Theme.neumorphicStyle.getPressedShadowOffset()
            if(mouseArea.containsMouse) return -Theme.neumorphicStyle.getHoveredShadowOffset()
            return -Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( NeumorphicButtonStyle.Inner )
        radius: Theme.neumorphicStyle.getShadowRadius( NeumorphicButtonStyle.Inner )
        color: "#AAFAFBFF"
        visible: delegate.selected

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: delegate.select()
    }
}

//Item {
//    id: delegate


//    MouseArea {
//        id: mouseArea
//        anchors.fill: parent
//        hoverEnabled: true
//        onClicked: delegate.select()
//    }

//    Rectangle {
//        id: background

//        anchors.fill: parent

//        color: {
//            if(mouseArea.pressed) return Theme.neumorphicStyle.getPressedBackgroundColor()
//            if(mouseArea.hovered) return Theme.neumorphicStyle.getHoverBackgroundColor()
//            return Theme.neumorphicStyle.getNormalBackgroundColor()
//        }
//        radius: 5

//        layer.enabled: selected
//        layer.effect: InnerShadow {
//            horizontalOffset: {
//                if(mouseArea.pressed) return Theme.neumorphicStyle.getPressedShadowOffset()
//                if(mouseArea.hovered) return Theme.neumorphicStyle.getHoveredShadowOffset()
//                return Theme.neumorphicStyle.getNormalShadowOffset()
//            }
//            verticalOffset: horizontalOffset
//            samples: Theme.neumorphicStyle.getShadowSamples( NeumorphicButtonStyle.Inner )
//            radius: Theme.neumorphicStyle.getShadowRadius( NeumorphicButtonStyle.Inner )
//            color: "#35373E"
//            visible: selected

//            Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
//            Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
//        }
//    }

//    InnerShadow {
//        anchors.fill: background
//        source: background
//        horizontalOffset: {
//            if(mouseArea.pressed) return -Theme.neumorphicStyle.getPressedShadowOffset()
//            if(mouseArea.hovered) return -Theme.neumorphicStyle.getHoveredShadowOffset()
//            return -Theme.neumorphicStyle.getNormalShadowOffset()
//        }
//        verticalOffset: horizontalOffset
//        samples: Theme.neumorphicStyle.getShadowSamples( NeumorphicButtonStyle.Inner )
//        radius: Theme.neumorphicStyle.getShadowRadius( NeumorphicButtonStyle.Inner )
//        color: "#AAFAFBFF"
//        visible: selected

//        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
//        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
//    }

//    DropShadow {
//        anchors.fill: background
//        source: background
//        horizontalOffset: {
//            if(mouseArea.pressed) return Theme.neumorphicStyle.getPressedShadowOffset()
//            if(mouseArea.hovered) return Theme.neumorphicStyle.getHoveredShadowOffset()
//            return Theme.neumorphicStyle.getNormalShadowOffset()
//        }
//        verticalOffset: horizontalOffset
//        samples: Theme.neumorphicStyle.getShadowSamples( NeumorphicButtonStyle.Outer )
//        radius: Theme.neumorphicStyle.getShadowRadius( NeumorphicButtonStyle.Outer )
//        color: "#35373E"
//        visible: !selected

//        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
//        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
//    }

//    DropShadow {
//        anchors.fill: background
//        source: background
//        horizontalOffset: {
//            if(mouseArea.pressed) return -Theme.neumorphicStyle.getPressedShadowOffset()
//            if(mouseArea.hovered) return -Theme.neumorphicStyle.getHoveredShadowOffset()
//            return -Theme.neumorphicStyle.getNormalShadowOffset()
//        }
//        verticalOffset: horizontalOffset
//        samples: Theme.neumorphicStyle.getShadowSamples( NeumorphicButtonStyle.Outer )
//        radius: Theme.neumorphicStyle.getShadowRadius( NeumorphicButtonStyle.Outer )
//        color: "#55FAFBFF"
//        visible: !selected

//        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
//        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
//    }
//}
