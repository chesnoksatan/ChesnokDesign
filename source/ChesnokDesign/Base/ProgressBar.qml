import QtQuick 2.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

// @disable-check M129
T.ProgressBar {
    id: control

    property int size: ControlSize.H24

    implicitHeight: Theme.getControlHeight( control.size ) / 5

    background: Rectangle {
        anchors.fill: parent
        color: Theme.alternativeBackgroundColor
    }

    contentItem: Item {
        implicitWidth: control.width
        implicitHeight: Theme.getControlHeight( control.size ) / 5
        clip: true

        Rectangle {
            visible: !control.indeterminate
            width: control.visualPosition * control.width
            height: Theme.getControlHeight( control.size ) / 5
            color: Theme.accent[500]
        }

        Rectangle {
            id: indeterminateRect
            property real progressAnimation
            visible: control.indeterminate
            width: progressAnimation * control.width
            height: control.height
            color: Theme.accent[500]

            SequentialAnimation on progressAnimation {
                loops: Animation.Infinite
                running: control.visible && control.indeterminate

                NumberAnimation { from: 0; to: 1.0; easing.type: Easing.InQuart; duration: 1000 }
                NumberAnimation { duration: 1500 }
                NumberAnimation { from: 1.0; to: 0; easing.type: Easing.OutQuart; duration: 1000 }
            }

            SequentialAnimation on x {
                loops: Animation.Infinite
                running: control.visible && control.indeterminate

                NumberAnimation { duration: 1000 }
                NumberAnimation { from: 0; to: control.width; easing.type: Easing.OutQuart; duration: 750 }
                NumberAnimation { from: control.width; to: 0; easing.type: Easing.InQuart; duration: 750 }
                NumberAnimation { duration: 1000 }
            }
        }
    }
}
