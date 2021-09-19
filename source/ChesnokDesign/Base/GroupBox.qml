import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

// FIXME: element placement!!!

// @disable-check M129
T.GroupBox {
    id: control

    implicitWidth: contentWidth + leftPadding + rightPadding
    implicitHeight: contentHeight + topPadding + bottomPadding

    topPadding: Theme.buttonStyle.getPadding( ControlSize.H24 ) / 2
    bottomPadding: Theme.buttonStyle.getPadding( ControlSize.H24 ) / 2
    leftPadding: Theme.buttonStyle.getPadding( ControlSize.H24 ) / 2
    rightPadding: Theme.buttonStyle.getPadding( ControlSize.H24 ) / 2

    label: Label {
        x: control.leftPadding
        width: control.availableWidth

        text: control.title
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter

        opacity: enabled ? 1.0 : 0.2
        color: Theme.buttonStyle.getTextColor( ButtonColorStyle.Base2 )
        style: LabelStyle.Base4
    }

    background: Rectangle {
        y: control.topPadding + label.height
        width: parent.width
        height: parent.height - control.topPadding + control.bottomPadding

        color: Theme.transparent
        border.color: Utils.getAlphaColor( Theme.accent[600], 0.5 )
    }
}
