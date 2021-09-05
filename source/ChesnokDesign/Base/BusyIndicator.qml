import QtQuick 2.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

// @disable-check M129
T.BusyIndicator {
    id: control

    property int size: ControlSize.H48

    contentItem: Item {
        implicitWidth: Theme.getControlHeight( control.size )
        implicitHeight: Theme.getControlHeight( control.size )

        Item {
            id: item
            x: parent.width / 2 - 32
            y: parent.height / 2 - 32
            width: Theme.getControlHeight( control.size )
            height: Theme.getControlHeight( control.size )
            opacity: control.running ? 1 : 0

            Behavior on opacity { OpacityAnimator { duration: 200 } }

            RotationAnimator {
                target: item
                running: control.visible && control.running
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 1500
            }

            Repeater {
                id: repeater
                model: 6

                Rectangle {
                    x: item.width / 2 - width / 2
                    y: item.height / 2 - height / 2
                    implicitWidth: Theme.getControlHeight( control.size ) / 5
                    implicitHeight: Theme.getControlHeight( control.size ) / 5
                    radius: height / 2
                    color: Theme.accent[500]
                    transform: [
                        Translate { y: -Math.min(item.width, item.height) * 0.5 + 5 },
                        Rotation {
                            angle: index / repeater.count * 360
                            origin.x: width / 2
                            origin.y: width / 2
                        }
                    ]
                }
            }
        }
    }
}
