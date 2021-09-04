import QtQuick 2.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

// @disable-check M129
T.PageIndicator {
    id: control

    property int size: ControlSize.H48

    implicitWidth: control.count * ( height + spacing )
    implicitHeight: Theme.getControlHeight( control.size ) / 4
    spacing: 10

    delegate: Rectangle {
        width: Theme.getControlHeight( control.size ) / 4
        height: Theme.getControlHeight( control.size ) / 4
        radius: height / 2

        color: {
            if ( mouseArea.pressed ) return Theme.accent[900]
            if ( mouseArea.containsMouse ) return Theme.accent[700]
            return Theme.accent[500]
        }

        // @disable-check M325
        opacity: index === control.currentIndex ? 1 : 0.5

        MouseArea {
            id: mouseArea
            enabled: control.interactive
            anchors.fill: parent
            hoverEnabled: true
            onClicked: control.currentIndex = index
        }
    }

    contentItem: Row {
        spacing: control.spacing
        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }
}
