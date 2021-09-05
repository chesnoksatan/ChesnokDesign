import QtQuick 2.12
import QtQuick.Controls 2.12

import ChesnokDesign 1.0

Item {
    id: control

    property int size: ControlSize.H48
    property bool running: true

    implicitWidth: Theme.getControlHeight( control.size ) + 5
    implicitHeight: Theme.getControlHeight( control.size ) + 5

    property Component contentItem: Item {
        implicitWidth: Theme.getControlHeight( control.size )
        implicitHeight: Theme.getControlHeight( control.size )

        Item {
            id: item
            width: Theme.getControlHeight( control.size )
            height: Theme.getControlHeight( control.size )
            x: parent.width / 2 - 32
            y: parent.height / 2 - 32

            Timer {
                running: control.visible && control.running
                repeat: true
                interval: 100
                onTriggered: {
                    var array = repeater.model

                    var last = array[array.length - 1]
                    for ( var i = array.length - 1; i > 0 ; i-- )
                        array[i] = array[i - 1]
                    array[0] = last

                    repeater.model = array
                }
            }

            Repeater {
                id: repeater
                model: [ 1, 0.84, 0.68, 0.52, 0.36, 0.20, 0 ]

                Rectangle {
                    x: item.width / 2 - width / 2
                    y: item.height / 2 - height / 2
                    implicitWidth: Theme.getControlHeight( control.size ) / 5
                    implicitHeight: Theme.getControlHeight( control.size ) / 5
                    radius: height / 2
                    color: Theme.accent[500]
                    opacity: modelData

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

    property Component background: Rectangle {
        width: parent.width
        height: parent.height
        color: Theme.transparent
        radius: parent.height / 2
    }

    Loader {
        anchors.fill: parent
        sourceComponent: control.background
    }

    Loader {
        anchors.fill: parent
        sourceComponent: control.contentItem
        opacity: control.running ? 1 : 0
        Behavior on opacity { OpacityAnimator { duration: 200 } }
    }

}
