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
    property int style: NeumorphicButtonStyle.Outer

    signal canceled()
    signal clicked()
    signal doubleClicked()
    signal pressAndHold()
    signal pressed()
    signal released()
    signal toggled()

    implicitWidth: 128
    implicitHeight: Theme.buttonStyle.getHeight( root.size )

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
                color: Theme.neumorphicButtonStyle.getTextColor()
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                opacity: root.enabled ? 1 : 0.48
            }

        background: Rectangle {
            id: bg
            radius: Theme.neumorphicButtonStyle.getRadius( root.size )
            color: {
                if(control.pressed) return Theme.neumorphicButtonStyle.getPressedBackgroundColor()
                if(control.hovered) return Theme.neumorphicButtonStyle.getHoverBackgroundColor()
                return Theme.neumorphicButtonStyle.getNormalBackgroundColor()
            }

            border.width: Theme.neumorphicButtonStyle.getBorderWidth( root.enabled )
            border.color: Theme.neumorphicButtonStyle.getBorderColor( root.enabled )

            Behavior on color {  ColorAnimation { duration: 100 } }

            layer.enabled: root.style === NeumorphicButtonStyle.Inner && root.enabled
            layer.effect: InnerShadow {
                horizontalOffset: {
                    if(control.pressed) return Theme.neumorphicButtonStyle.getPressedShadowOffset()
                    if(control.hovered) return Theme.neumorphicButtonStyle.getHoveredShadowOffset()
                    return Theme.neumorphicButtonStyle.getNormalShadowOffset()
                }
                verticalOffset: horizontalOffset
                samples: Theme.neumorphicButtonStyle.getShadowSamples( root.style )
                radius: Theme.neumorphicButtonStyle.getShadowRadius( root.style )
                color: Theme.neumorphicButtonStyle.getDarkShadowColor()
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
            if(control.pressed) return Theme.neumorphicButtonStyle.getPressedShadowOffset()
            if(control.hovered) return Theme.neumorphicButtonStyle.getHoveredShadowOffset()
            return Theme.neumorphicButtonStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicButtonStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicButtonStyle.getShadowRadius( root.style )
        color: Theme.neumorphicButtonStyle.getDarkShadowColor()
        visible: root.style !== NeumorphicButtonStyle.Inner && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }

    DropShadow {
        anchors.fill: control
        source: control
        horizontalOffset: {
            if(control.pressed) return -Theme.neumorphicButtonStyle.getPressedShadowOffset()
            if(control.hovered) return -Theme.neumorphicButtonStyle.getHoveredShadowOffset()
            return -Theme.neumorphicButtonStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicButtonStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicButtonStyle.getShadowRadius( root.style )
        color: Theme.neumorphicButtonStyle.getLightShadowColor()
        visible: root.style !== NeumorphicButtonStyle.Inner && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }

    InnerShadow {
        anchors.fill: control
        source: control
        horizontalOffset: {
            if(control.pressed) return -Theme.neumorphicButtonStyle.getPressedShadowOffset()
            if(control.hovered) return -Theme.neumorphicButtonStyle.getHoveredShadowOffset()
            return -Theme.neumorphicButtonStyle.getNormalShadowOffset()
        }
        verticalOffset: horizontalOffset
        samples: Theme.neumorphicButtonStyle.getShadowSamples( root.style )
        radius: Theme.neumorphicButtonStyle.getShadowRadius( root.style )
        color: Theme.neumorphicButtonStyle.getLightShadowColor()
        visible: root.style === NeumorphicButtonStyle.Inner && root.enabled

        Behavior on horizontalOffset { PropertyAnimation { duration: 100 } }
        Behavior on verticalOffset { PropertyAnimation { duration: 100 } }
    }
}
