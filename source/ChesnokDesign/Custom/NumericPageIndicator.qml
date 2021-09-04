import QtQuick 2.12
import QtQuick.Controls 2.12

import ChesnokDesign 1.0

Item {
    id: control

    property int size: ControlSize.H48
    property bool interactive: false
    property int currentIndex: -1
    property int count: -1

    implicitWidth: height * ( count + 2 )
    implicitHeight: Theme.getControlHeight( control.size )

    property Component delegate: Rectangle {
        width: height
        height: control.height
        radius: 5

        color: {
            if(mouseArea.pressed) return Theme.buttonStyle.getPressedBackgroundColor( ButtonColorStyle.Base2 )
            if(mouseArea.containsMouse) return Theme.buttonStyle.getHoverBackgroundColor( ButtonColorStyle.Base2 )
            return Theme.buttonStyle.getNormalBackgroundColor( ButtonColorStyle.Base2 )
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: control.currentIndex = index
            enabled: control.interactive
        }

        Label {
            anchors.centerIn: parent
            font.weight: Font.DemiBold
            // @disable-check M325
            opacity: index === control.currentIndex ? 1 : 0.5
            text: String(index + 1)
            color: {
                // @disable-check M325
                if ( index !== control.currentIndex ) return "White"
                return Theme.buttonStyle.getIconColor( ButtonColorStyle.Base2 )
            }
        }
    }

    property Component contentItem: Row {
        spacing: 0
        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }

    property Component background: Rectangle {
        width: parent.width
        height: parent.height
        color: Theme.alternativeBackgroundColor
        radius: 5
    }

    property Component downIndicator: Rectangle {
        width: height
        height: control.height
        radius: 5

        Icon {
            anchors.centerIn: parent
            size: Theme.getControlHeight( control.size )
            color: Theme.buttonStyle.getIconColor( ButtonColorStyle.Base2 )
            group: "arrow"
            name: "chevron_left"
        }

        color: {
            if ( !mouseArea.enabled ) return Theme.transparent
            if(mouseArea.pressed) return Theme.buttonStyle.getPressedBackgroundColor( ButtonColorStyle.Base2 )
            if(mouseArea.containsMouse) return Theme.buttonStyle.getHoverBackgroundColor( ButtonColorStyle.Base2 )
            return Theme.buttonStyle.getNormalBackgroundColor( ButtonColorStyle.Base2 )
        }

        MouseArea {
            // @disable-check M15
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: control.decrement()
            enabled: control.currentIndex > 0
        }
    }

    property Component upIndicator: Rectangle {
        width: height
        height: control.height
        radius: 5

        Icon {
            anchors.centerIn: parent
            size: Theme.getControlHeight( control.size )
            color: Theme.buttonStyle.getIconColor( ButtonColorStyle.Base2 )
            group: "arrow"
            name: "chevron_right"
        }

        color: {
            if ( !mouseArea.enabled ) return Theme.transparent
            if(mouseArea.pressed) return Theme.buttonStyle.getPressedBackgroundColor( ButtonColorStyle.Base2 )
            if(mouseArea.containsMouse) return Theme.buttonStyle.getHoverBackgroundColor( ButtonColorStyle.Base2 )
            return Theme.buttonStyle.getNormalBackgroundColor( ButtonColorStyle.Base2 )
        }

        MouseArea {
            // @disable-check M15
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: control.increment()
            enabled: control.currentIndex < control.count - 1
        }
    }

    Loader {
        anchors.fill: parent
        sourceComponent: control.background
    }

    Loader {
        anchors.left: downIndicatorLoader.right
        anchors.right: upIndicatorLoader.left
        height: control.height
        sourceComponent: control.contentItem
    }

    Loader {
        id: downIndicatorLoader
        clip: true
        width: height
        height: control.height
        anchors.left: parent.left
        sourceComponent: control.downIndicator
    }

    Loader {
        id: upIndicatorLoader
        clip: true
        width: height
        height: control.height
        anchors.right: parent.right
        sourceComponent: control.upIndicator
    }

    function decrement()
    {
        if ( control.currentIndex > 0 )
            control.currentIndex--
    }

    function increment()
    {
        if ( control.currentIndex < control.count - 1 )
            control.currentIndex++
    }
}
