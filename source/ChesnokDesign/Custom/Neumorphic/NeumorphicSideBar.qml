import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12  as Controls
import QtGraphicalEffects 1.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

Item {
    id: root

    property int size: ControlSize.H48

    readonly property int abbreviatedWidth: Theme.getControlHeight( root.size ) + 16
    readonly property int expandedWidth: 300
    property int currentIndex: 0
    property var model

    state: "abbreviated"
    z: 2

    property Component delegate: NeumorphicSideBarDelegate {
        width: parent.width
        height: Theme.getControlHeight( root.size )
        selected: index === root.currentIndex
        onSelect: {
            if ( root.currentIndex !== index)
                 root.currentIndex = index
        }
    }

    states: [
        State { name: "abbreviated"; PropertyChanges { target: root; width: root.abbreviatedWidth } },
        State { name: "expanded"; PropertyChanges { target: root; width: root.expandedWidth } }
    ]

    property Transition expandAnimation: Transition {
        from: "abbreviated"; to: "expanded";
        NumberAnimation {
            property: "width";
            easing.type: Easing.InCubic;
            duration: 200;
        }
    }

    property Transition abbreviateAnimation: Transition {
        from: "expanded"; to: "abbreviated";
        NumberAnimation {
            property: "width";
            easing.type: Easing.OutCubic;
            duration: 200;
        }
    }

    transitions: [ root.expandAnimation, root.abbreviateAnimation ]

    property Component backgroundDelegate: Rectangle {
        width: parent.width
        height: parent.height
        color: Theme.neumorphicBackgroundColor
    }

    Loader {
        sourceComponent: root.backgroundDelegate
        anchors.fill: parent

        layer.enabled: true
        layer.effect: DropShadow {
            horizontalOffset: Theme.neumorphicStyle.getNormalShadowOffset()
            samples: Theme.neumorphicStyle.getShadowSamples( NeumorphicButtonStyle.Inner )
            radius: Theme.neumorphicStyle.getShadowRadius( NeumorphicButtonStyle.Inner ) + 5
            color: "#252725"
        }
    }

    NeumorphicButtonIcon {
        id: controlButton
        style: NeumorphicButtonStyle.Outer
        size: root.size
        onClicked: toggleState()
        icon.group: "menu"
        icon.name: "hamburger"

        anchors {
            top: root.top
            right: root.right
            margins: 8
        }
    }

    Item {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: controlButton.bottom
            margins: 8
            topMargin: 17
        }

        ListView {
            anchors.fill: parent
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            model: root.model ? root.model : []
            delegate: root.delegate
            spacing: 8
        }
    }

    Rectangle {
        anchors {
            top: controlButton.bottom
            left: root.left
            right: root.right
            margins: 8
        }
        height: 1
        color: Utils.getAlphaColor( Theme.neumorphicGrayScale[500], 0.5 )
    }

    function expanded() { return root.state === "expanded" }
    function expand() { root.state = "expanded" }
    function abbreviate() { root.state = "abbreviated" }
    function toggleState() { if ( root.expanded() ) root.abbreviate(); else root.expand() }
}
