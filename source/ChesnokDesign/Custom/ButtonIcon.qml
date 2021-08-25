import QtQuick 2.8
import QtGraphicalEffects 1.0

import ChesnokDesign 1.0

Button {
    id: control

    style: ButtonColorStyle.Primary
    size: ButtonSize.H24

    property alias icon: icon

    Icon {
        id: icon
        anchors.centerIn: parent
        size: Theme.buttonStyle.getHeight( control.size )
        color: Theme.buttonStyle.getIconColor( control.style )
    }
}
