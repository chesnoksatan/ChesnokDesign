import QtQml 2.12
import QtQuick 2.12
import QtQuick.Controls 2.12

import ChesnokDesign 1.0

Item {
    id: control

    property real from: 0
    property real to: 1
    property real stepSize: 0.01
    property int decimals: 2
    property real zoom: 0.01

    implicitHeight: 100

    property Component background: Rectangle {
        color: Theme.transparent

        Rectangle {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 2
            color: Theme.accent[500]
        }

        Rectangle {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 2
            color: Theme.accent[500]
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 2
            color: Theme.accent[500]
        }
    }

    property Component indicator: Item {
        Item {
            id: indicator
            visible: mouseArea.containsMouse
            x: mouseArea.mouseX

            Rectangle {
                y: control.height - height
                x: -width / 2
                height: control.height
                width: 2
                color: Theme.accent[500]
            }

            Rectangle {
                y: control.height - height / 2
                x: -height / 2
                width: 20
                height: 20
                radius: height / 2
                color: Theme.accent[500]
            }

            Label {
                y: -height - 2
                x: -width / 2
                style: LabelStyle.Base4
                text: Number((((control.to - control.from) * indicator.x) / control.width) + control.from).toFixed(control.decimals)
                color: Theme.buttonStyle.getTextColor(ButtonColorStyle.Base2)
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onWheel: {
                if ( wheel.angleDelta.y > 0 )
                {
                    if ( (control.from < control.to) && (control.from + 2 * control.zoom < control.to))
                    {
                        control.from += control.zoom
                        control.to -= control.zoom
                    }
                }
                if ( wheel.angleDelta.y < 0 )
                {
                    control.from -= control.zoom
                    control.to += control.zoom
                }
            }
        }
    }

    Repeater {
        id: repeater
        anchors.fill: parent

        Component.onCompleted: recalculateModel()

        delegate: Item {
            Rectangle {
                width: 2
                height: index % 4 === 0 ? control.height * 0.75 : control.height * 0.4
                color: index % 4 === 0 ? Theme.accent[500] : Theme.basic[400]
                x: (control.width / (control.to - control.from)) * index * control.stepSize - width / 2
                y: control.height - height
                visible: index !== 0
            }

            Label {
                visible: index % 4 === 0
                y: index % 8 === 0 ? control.height : control.height + height
                x: (control.width / (control.to - control.from)) * index * control.stepSize - width / 2
                text: modelData
                style: LabelStyle.Base4
                color: index === 0 ? Theme.buttonStyle.getTextColor(ButtonColorStyle.Base2) : Theme.buttonStyle.getTextColor(ButtonColorStyle.Base)
            }
        }
    }

    /// Для крайней правой границы
    Label {
        text: Number(control.to).toFixed(control.decimals)
        x: control.width - width / 2
        y: control.height
        style: LabelStyle.Base4
        color: Theme.buttonStyle.getTextColor(ButtonColorStyle.Base2)
    }

    Loader {
        z: 2
        anchors.fill: parent
        sourceComponent: control.background
    }

    Loader {
        z: 3
        anchors.fill: parent
        sourceComponent: control.indicator
    }

    Connections {
        target: control

        onStepSizeChanged: recalculateModel()
        onFromChanged: recalculateModel()
        onToChanged: recalculateModel()
    }

    function recalculateModel()
    {
        var array = Array()

        for ( var i = control.from; i < control.to; i += control.stepSize )
            array.push(Number(i).toFixed(control.decimals))

        repeater.model = array
    }
}
