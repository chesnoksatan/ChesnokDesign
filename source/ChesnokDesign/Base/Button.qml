import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Templates 2.1 as T

import ChesnokDesign 1.0

// @disable-check M129
T.Button {
    id: control

    property int style: ButtonColorStyle.Primary
    property int size: ControlSize.H24
    property bool rounded: false

    leftPadding: Theme.buttonStyle.getPadding( control.size )
    rightPadding: Theme.buttonStyle.getPadding( control.size )
    implicitHeight: background.implicitHeight

    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding

    focusPolicy: Qt.TabFocus
    hoverEnabled: true

    opacity: control.enabled ? 1 : 0.48

    contentItem: Label {
            id: label
            text: control.text
            style: {
                switch ( control.style )
                {
                case ButtonColorStyle.Base: return LabelStyle.Base3
                case ButtonColorStyle.Base2: return LabelStyle.Base3
                case ButtonColorStyle.Primary: return LabelStyle.Paragraph3
                case ButtonColorStyle.Secondary: return LabelStyle.Base4
                }
            }

            color: Theme.buttonStyle.getTextColor( control.style )
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            Controls.ToolTip {
                parent: label
                visible: label.truncated && control.hovered
                text: label.text
                timeout: 750
            }
        }

    background: Rectangle {
        id: backItem
        implicitWidth: 128
        implicitHeight: Theme.getControlHeight( control.size )
        radius: control.rounded ? height / 2 : 0
        color: {
            if(control.pressed) return Theme.buttonStyle.getPressedBackgroundColor(control.style)
            if(control.hovered) return Theme.buttonStyle.getHoverBackgroundColor(control.style)
            return Theme.buttonStyle.getNormalBackgroundColor(control.style)
        }
        border.color: {
            if(control.pressed) return Theme.buttonStyle.getPressedBorderColor(control.style)
            if(control.hovered) return Theme.buttonStyle.getHoverBorderColor(control.style)
            return Theme.buttonStyle.getNormalBorderColor(control.style)
        }
        border.width: {
            if(control.pressed) return Theme.buttonStyle.getPressedBorderWidth(control.style)
            if(control.hovered) return Theme.buttonStyle.getHoverBorderWidth(control.style)
            return Theme.buttonStyle.getNormalBorderWidth(control.style)
        }
    }
}
