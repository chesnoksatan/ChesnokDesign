import QtQuick 2.8
import QtGraphicalEffects 1.0

import ChesnokDesign 1.0
import "../"

NeumorphicButton {
    id: control

    style: NeumorphicButtonStyle.Outer
    size: ControlSize.H24

    property alias icon: icon

    implicitWidth: implicitHeight
    implicitHeight: Theme.getControlHeight( control.size )

    Icon {
        id: icon
        anchors.centerIn: parent
        size: Theme.getControlHeight( control.size )
        color: Theme.neumorphicReverseBackgroundColor
    }
}
