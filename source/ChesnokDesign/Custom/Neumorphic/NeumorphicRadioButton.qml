import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Templates 2.1 as T
import QtGraphicalEffects 1.12

import ChesnokDesign 1.0

T.RadioButton {
    id: control

    property int size: ControlSize.H40
    readonly property int style: NeumorphicButtonStyle.Outer
    checked: false

    implicitWidth: control.text !== "" ? contentItem.implicitWidth + indicator.implicitWidth : indicator.implicitWidth
    implicitHeight: Theme.getControlHeight( control.size )

    focusPolicy: Qt.TabFocus

    indicator: Rectangle {
        implicitWidth: Theme.getControlHeight( control.size )
        implicitHeight: Theme.getControlHeight( control.size )
        radius: height / 2
        opacity: control.enabled ? 1 : 0.48

        color:
        {
            if ( !control.enabled ) return Theme.neumorphicStyle.getNormalBackgroundColor()
            if ( control.checked )
            {
                if ( control.pressed ) return Theme.checkBoxStyle.getPressedBackgroundColor( control.checked )
                if ( control.hovered ) return Theme.checkBoxStyle.getHoverBackgroundColor( control.checked )
                return Theme.checkBoxStyle.getNormalBackgroundColor( control.checked )
            }
            else
            {
                if ( control.pressed ) return Theme.neumorphicStyle.getPressedBackgroundColor()
                if ( control.hovered ) return Theme.neumorphicStyle.getHoverBackgroundColor()
                return Theme.neumorphicStyle.getNormalBackgroundColor()
            }
        }

        border.width: Theme.neumorphicStyle.getBorderWidth( control.enabled )
        border.color: Theme.neumorphicStyle.getBorderColor( control.enabled )

        Behavior on color { ColorAnimation { duration: 200 } }
        Behavior on border.color { ColorAnimation { duration: 200 } }

        Rectangle {
            anchors.centerIn: parent
            opacity: control.checked ? 1 : 0
            implicitWidth: Theme.getControlHeight( control.size ) * 0.5
            implicitHeight: Theme.getControlHeight( control.size ) * 0.5
            radius: height / 2

            Behavior on opacity { NumberAnimation { duration: 200 } }

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 2
                verticalOffset: 2
                samples: Theme.neumorphicStyle.getShadowSamples( control.style )
                radius: Theme.neumorphicStyle.getShadowRadius( control.style )
                color: Theme.neumorphicStyle.getDarkShadowColor()
            }
        }

//        layer.enabled: control.style === NeumorphicButtonStyle.Inner && control.enabled
//        layer.effect: InnerShadow {
//            horizontalOffset: {
//                if(control.pressed) return Theme.neumorphicStyle.getPressedShadowOffset()
//                if(control.hovered) return Theme.neumorphicStyle.getHoveredShadowOffset()
//                return Theme.neumorphicStyle.getNormalShadowOffset()
//            }
//            verticalOffset: horizontalOffset
//            samples: Theme.neumorphicStyle.getShadowSamples( control.style )
//            radius: Theme.neumorphicStyle.getShadowRadius( control.style )
//            color: Theme.neumorphicStyle.getDarkShadowColor()
//            visible: control.style === NeumorphicButtonStyle.Inner && control.enabled

//            Behavior on horizontalOffset { PropertyAnimation { duration: 200 } }
//            Behavior on verticalOffset { PropertyAnimation { duration: 200 } }
//        }
    }

    contentItem: Controls.Label {
        text: control.text
        opacity: enabled ? 1.0 : 0.48
        color:
        {
            if( !control.enabled ) return Utils.getAlphaColor( Theme.checkBoxStyle.getTextColor(), 0.7 )
            if( control.hovered ) return Utils.getAlphaColor( Theme.checkBoxStyle.getTextColor(), 0.9 )
            return Utils.getAlphaColor( Theme.checkBoxStyle.getTextColor(), 0.8 )
        }
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + (text.length > 0 ? control.spacing : 0)
    }

    DropShadow {
        anchors.fill: control.indicator
        source: control.indicator
        horizontalOffset:
        {
            if( control.pressed ) return Theme.neumorphicStyle.getPressedShadowOffset()
            if( control.hovered ) return Theme.neumorphicStyle.getHoveredShadowOffset()
            return Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( control.style )
        radius: Theme.neumorphicStyle.getShadowRadius( control.style )
        color: Theme.neumorphicStyle.getDarkShadowColor()
        visible: control.style === NeumorphicButtonStyle.Outer && control.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 200 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 200 } }
    }

    DropShadow {
        anchors.fill: control.indicator
        source: control.indicator
        horizontalOffset:
        {
            if( control.pressed ) return -Theme.neumorphicStyle.getPressedShadowOffset()
            if( control.hovered ) return -Theme.neumorphicStyle.getHoveredShadowOffset()
            return -Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( control.style )
        radius: Theme.neumorphicStyle.getShadowRadius( control.style )
        color: Theme.neumorphicStyle.getLightShadowColor()
        visible: control.style === NeumorphicButtonStyle.Outer && control.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 200 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 200 } }
    }

//    InnerShadow {
//        anchors.fill: control.indicator
//        source: control.indicator
//        horizontalOffset: {
//            if(control.pressed) return -Theme.neumorphicStyle.getPressedShadowOffset()
//            if(control.hovered) return -Theme.neumorphicStyle.getHoveredShadowOffset()
//            return -Theme.neumorphicStyle.getNormalShadowOffset()
//        }
//        verticalOffset: horizontalOffset
//        samples: Theme.neumorphicStyle.getShadowSamples( control.style )
//        radius: Theme.neumorphicStyle.getShadowRadius( control.style )
//        color: Theme.neumorphicStyle.getLightShadowColor()
//        visible: control.style === NeumorphicButtonStyle.Inner && control.enabled

//        Behavior on horizontalOffset { PropertyAnimation { duration: 200 } }
//        Behavior on verticalOffset { PropertyAnimation { duration: 200 } }
//    }
}
