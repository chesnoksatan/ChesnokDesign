import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12  as Controls
import QtGraphicalEffects 1.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

Item {
    id: root

    property int size
    property alias text: control.text
    property int style: NeumorphicButtonStyle.Inner
    property bool rounded: false

    signal canceled()
    signal clicked()
    signal doubleClicked()
    signal pressAndHold()
    signal pressed()
    signal released()
    signal toggled()

    implicitWidth: 128
    implicitHeight: Theme.getControlHeight( root.size )

    T.Button {
        id: control
        anchors.fill: parent

        onCanceled: { root.canceled() }
        onClicked: { root.clicked() }
        onDoubleClicked: { root.doubleClicked() }
        onPressAndHold: { root.pressAndHold() }
        onPressed: { root.pressed() }
        onReleased: { root.released() }
        onToggled: { root.toggled() }

        contentItem: Controls.Label {
                id: label
                text: control.text
                color: Theme.neumorphicStyle.getTextColor()
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                opacity: root.enabled ? 1 : 0.48
            }

        background: Rectangle {
            id: bg
            radius: root.rounded ? height / 2 : Theme.neumorphicStyle.getRadius( root.size )
            color: {
                if(control.pressed) return Theme.neumorphicStyle.getPressedBackgroundColor()
                if(control.hovered) return Theme.neumorphicStyle.getHoverBackgroundColor()
                return Theme.neumorphicStyle.getNormalBackgroundColor()
            }

            border.width: Theme.neumorphicStyle.getBorderWidth( root.enabled )
            border.color: Theme.neumorphicStyle.getBorderColor( root.enabled )

            Behavior on color {  ColorAnimation { duration: 100 } }

            layer.enabled: root.style === NeumorphicButtonStyle.Inner && root.enabled
            layer.effect: InnerShadow {
                horizontalOffset: {
                    if(control.pressed) return Theme.neumorphicStyle.getPressedShadowOffset()
                    if(control.hovered) return Theme.neumorphicStyle.getHoveredShadowOffset()
                    return Theme.neumorphicStyle.getNormalShadowOffset()
                }
                verticalOffset: horizontalOffset
                samples: Theme.neumorphicStyle.getShadowSamples( root.style )
                radius: Theme.neumorphicStyle.getShadowRadius( root.style )
                color: Theme.neumorphicStyle.getDarkShadowColor()
                visible: root.style === NeumorphicButtonStyle.Inner && root.enabled

                Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
                Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
            }
        }
    }

    DropShadow {
        anchors.fill: control
        source: control
        horizontalOffset: {
            if(control.pressed) return Theme.neumorphicStyle.getPressedShadowOffset()
            if(control.hovered) return Theme.neumorphicStyle.getHoveredShadowOffset()
            return Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicStyle.getShadowRadius( root.style )
        color: Theme.neumorphicStyle.getDarkShadowColor()
        visible: root.style !== NeumorphicButtonStyle.Inner && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }

    DropShadow {
        anchors.fill: control
        source: control
        horizontalOffset: {
            if(control.pressed) return -Theme.neumorphicStyle.getPressedShadowOffset()
            if(control.hovered) return -Theme.neumorphicStyle.getHoveredShadowOffset()
            return -Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicStyle.getShadowRadius( root.style )
        color: Theme.neumorphicStyle.getLightShadowColor()
        visible: root.style !== NeumorphicButtonStyle.Inner && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }

    InnerShadow {
        anchors.fill: control
        source: control
        horizontalOffset: {
            if(control.pressed) return -Theme.neumorphicStyle.getPressedShadowOffset()
            if(control.hovered) return -Theme.neumorphicStyle.getHoveredShadowOffset()
            return -Theme.neumorphicStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicStyle.getShadowRadius( root.style )
        color: Theme.neumorphicStyle.getLightShadowColor()
        visible: root.style === NeumorphicButtonStyle.Inner && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }
}
