import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12  as Controls
import QtGraphicalEffects 1.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

Item {
    id: root

    property int size: ControlSize.H24
    property alias text: text.text
    property bool checked: true
    readonly property int style: NeumorphicButtonStyle.Outer

    signal canceled()
    signal clicked()
    signal doubleClicked()
    signal pressAndHold()
    signal pressed()
    signal released()
    signal toggled()

    implicitWidth: text.text !== "" ? text.implicitWidth + indicator.implicitWidth : indicator.implicitWidth
    implicitHeight: Theme.getControlHeight( root.size )

    property real spacing: 8

    Controls.Label {
        id: text
        color:
        {
            if( !root.enabled ) return Utils.getAlphaColor( Theme.neumorphicStyle.getTextColor(), 0.7 )
            if( mouseArea.containsMouse ) return Utils.getAlphaColor( Theme.neumorphicStyle.getTextColor(), 0.9 )
            return Utils.getAlphaColor( Theme.neumorphicStyle.getTextColor(), 0.8 )
        }
        anchors.verticalCenter: root.verticalCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        opacity: root.enabled ? 1 : 0.48
        leftPadding: indicator.width + root.spacing
    }

    Rectangle {
        id: indicator
        implicitWidth: Theme.getControlHeight( root.size ) * 2.5
        implicitHeight: Theme.getControlHeight( root.size )
        radius: height / 2

        color:
        {
            if ( root.checked )
            {
                if ( mouseArea.pressed ) return Theme.switchStyle.getPressedBackgroundColor( root.checked )
                if ( mouseArea.containsMouse ) return Theme.switchStyle.getHoverBackgroundColor( root.checked )
                return Theme.switchStyle.getNormalBackgroundColor( root.checked )
            }
            else
            {
                if ( mouseArea.pressed ) return Theme.neumorphicStyle.getPressedBackgroundColor()
                if ( mouseArea.containsMouse ) return Theme.neumorphicStyle.getHoverBackgroundColor()
                return Theme.neumorphicStyle.getNormalBackgroundColor()
            }
        }

        border.width: Theme.neumorphicStyle.getBorderWidth( root.enabled )
        border.color: Theme.neumorphicStyle.getBorderColor( root.enabled )

        Behavior on color { ColorAnimation { duration: 200 } }

        Rectangle {
            id: subIndicator
            implicitHeight: Theme.getControlHeight( root.size ) / 1.5
            implicitWidth: height
            x: root.checked ? parent.width - width - Theme.switchStyle.getIndicatorPadding( root.size ) : Theme.switchStyle.getIndicatorPadding( root.size )
            anchors.verticalCenter: parent.verticalCenter
            radius: height / 2

            Behavior on x { PropertyAnimation { duration: 200 } }
        }

        DropShadow {
            anchors.fill: subIndicator
            source: subIndicator
            horizontalOffset: Theme.neumorphicStyle.getNormalShadowOffset()
            verticalOffset: horizontalOffset
            samples: Theme.neumorphicStyle.getShadowSamples( root.style )
            radius: Theme.neumorphicStyle.getShadowRadius( root.style )
            color: Theme.neumorphicStyle.getDarkShadowColor()
        }

        DropShadow {
            anchors.fill: subIndicator
            source: subIndicator
            horizontalOffset: -Theme.neumorphicStyle.getNormalShadowOffset()
            verticalOffset: horizontalOffset
            samples: Theme.neumorphicStyle.getShadowSamples( root.style )
            radius: Theme.neumorphicStyle.getShadowRadius( root.style )
            color: Theme.neumorphicStyle.getLightShadowColor()
        }

//        layer.enabled: root.style === NeumorphicButtonStyle.Inner && root.enabled
//        layer.effect: InnerShadow {
//            horizontalOffset:
//            {
//                if( mouseArea.pressed ) return -Theme.neumorphicStyle.getPressedShadowOffset()
//                if( mouseArea.containsMouse ) return -Theme.neumorphicStyle.getHoveredShadowOffset()
//                return -Theme.neumorphicStyle.getNormalShadowOffset()
//            }
//            verticalOffset: horizontalOffset
//            samples: Theme.neumorphicStyle.getShadowSamples( root.style )
//            radius: Theme.neumorphicStyle.getShadowRadius( root.style )
//            color: root.checked ? Theme.accent[100] : Theme.neumorphicStyle.getLightShadowColor()
//            visible: root.style === NeumorphicButtonStyle.Inner && root.enabled

//            Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
//            Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
//        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onCanceled: { root.canceled() }
        onClicked: { root.clicked() }
        onDoubleClicked: { root.doubleClicked() }
        onPressAndHold: { root.pressAndHold() }
        onPressed: { root.pressed() }
        onReleased: { root.checked = !root.checked; root.released() }
        hoverEnabled: true
    }

    function toggle()
    {
        root.checked = !root.checked
        root.toggled()
    }

    DropShadow {
        anchors.fill: indicator
        source: indicator
        horizontalOffset:
        {
            if( mouseArea.pressed ) return Theme.neumorphicStyle.getPressedShadowOffset()
            if( mouseArea.containsMouse ) return Theme.neumorphicStyle.getHoveredShadowOffset()
            return Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicStyle.getShadowRadius( root.style )
        color: Theme.neumorphicStyle.getDarkShadowColor()
        visible: root.style === NeumorphicButtonStyle.Outer && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }

    DropShadow {
        anchors.fill: indicator
        source: indicator
        horizontalOffset:
        {
            if( mouseArea.pressed ) return -Theme.neumorphicStyle.getPressedShadowOffset()
            if( mouseArea.containsMouse ) return -Theme.neumorphicStyle.getHoveredShadowOffset()
            return -Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicStyle.getShadowRadius( root.style )
        color: Theme.neumorphicStyle.getLightShadowColor()
        visible: root.style === NeumorphicButtonStyle.Outer && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }

//    InnerShadow {
//        anchors.fill: indicator
//        source: indicator
//        horizontalOffset:
//        {
//            if( mouseArea.pressed ) return Theme.neumorphicStyle.getPressedShadowOffset()
//            if( mouseArea.containsMouse ) return Theme.neumorphicStyle.getHoveredShadowOffset()
//            return Theme.neumorphicStyle.getNormalShadowOffset()
//        }
//        verticalOffset: horizontalOffset
//        samples: Theme.neumorphicStyle.getShadowSamples( root.style )
//        radius: Theme.neumorphicStyle.getShadowRadius( root.style )
//        color: Theme.neumorphicStyle.getDarkShadowColor()
//        visible: root.style === NeumorphicButtonStyle.Inner && root.enabled

//        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
//        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
//    }
}

