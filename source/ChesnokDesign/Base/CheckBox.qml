import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Templates 2.1 as T

import ChesnokDesign 1.0

// @disable-check M129
T.CheckBox {
    id: control

    property int size: ControlSize.H40
    checked: true

    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding + indicator.implicitWidth
    implicitHeight: Theme.getControlHeight( control.size )

    spacing: 8
    topPadding: 2
    bottomPadding: 2
    rightPadding: 2
    leftPadding: 2

    focusPolicy: Qt.TabFocus

    indicator: Rectangle {
        implicitWidth: Theme.getControlHeight( control.size )
        implicitHeight: width
        radius: 2

        color:
        {
            if ( control.pressed ) return Theme.checkBoxStyle.getPressedBackgroundColor( control.checked )
            if ( control.hovered ) return Theme.checkBoxStyle.getHoverBackgroundColor( control.checked )
            return Theme.checkBoxStyle.getNormalBackgroundColor( control.checked )
        }

        border.width: Theme.checkBoxStyle.getBorderWidth( control.checked )
        border.color:
        {
            if ( control.pressed ) return Theme.checkBoxStyle.getPressedBorderColor( control.checked )
            if ( control.hovered ) return Theme.checkBoxStyle.getHoverBorderColor( control.checked )
            return Theme.checkBoxStyle.getNormalBorderColor( control.checked )
        }

        Behavior on color { ColorAnimation { duration: 100 } }
        Behavior on border.color { ColorAnimation { duration: 100 } }

        Icon {
            group: "basic"
            name: "check"
            size: Theme.getControlHeight( control.size )
            anchors.centerIn: parent
            color: Theme.basic[0]
            visible: control.checked
        }
    }

    contentItem: Controls.Label {
        text: control.text
        opacity: enabled ? 1.0 : 0.48
        color:
        {
            if( !control.enabled ) return Utils.getAlphaColor( Theme.checkBoxStyle.getTextColor(), 0.7 )
            if( control.hovered ) return Utils.getAlphaColor( Theme.checkBoxStyle.getTextColor(), 0.9 )
            return Utils.getAlphaColor( Theme.checkBoxStyle.getTextColor(), 0.8 )
        }
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + (text.length > 0 ? control.spacing : 0)
    }
}
