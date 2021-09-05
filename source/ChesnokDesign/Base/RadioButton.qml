import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Templates 2.1 as T

import ChesnokDesign 1.0

// @disable-check M129
T.RadioButton {
    id: control

    property int size: ControlSize.H24
    checked: false

    implicitWidth: control.text !== "" ? contentItem.implicitWidth + indicator.implicitWidth : indicator.implicitWidth
    implicitHeight: Theme.getControlHeight( control.size )

    focusPolicy: Qt.TabFocus

    indicator: Rectangle {
        implicitWidth: Theme.getControlHeight( control.size )
        implicitHeight: Theme.getControlHeight( control.size )
        radius: height / 2
        opacity: control.enabled ? 1 : 0.48

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

        Behavior on color { ColorAnimation { duration: 200 } }
        Behavior on border.color { ColorAnimation { duration: 200 } }

        Rectangle {
            anchors.centerIn: parent
            opacity: control.checked ? 1 : 0
            implicitWidth: Theme.getControlHeight( control.size ) * 0.5
            implicitHeight: Theme.getControlHeight( control.size ) * 0.5
            radius: height / 2

            Behavior on opacity { OpacityAnimator { duration: 200 } }
        }
    }

    contentItem: Controls.Label {
        text: control.text
        opacity: enabled ? 1.0 : 0.48
        style: LabelStyle.Base3
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
