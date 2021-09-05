import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Templates 2.1 as T

import ChesnokDesign 1.0

// @disable-check M129
T.Switch {
    id: control

    property int size: ControlSize.H24
    checked: true

    implicitWidth: control.text !== "" ? contentItem.implicitWidth + indicator.implicitWidth : indicator.implicitWidth
    implicitHeight: Theme.getControlHeight( control.size )
    spacing: 8

    indicator: Rectangle {
        implicitWidth: Theme.getControlHeight( control.size ) * 2.5
        implicitHeight: Theme.getControlHeight( control.size )
        radius: height / 2
        opacity: control.enabled ? 1 : 0.48

        color:
        {
            if ( control.pressed ) return Theme.switchStyle.getPressedBackgroundColor( control.checked )
            if ( control.hovered ) return Theme.switchStyle.getHoverBackgroundColor( control.checked )
            return Theme.switchStyle.getNormalBackgroundColor( control.checked )
        }

        border.width: Theme.switchStyle.getBorderWidth( control.checked )
        border.color:
        {
            if ( control.pressed ) return Theme.switchStyle.getPressedBorderColor( control.checked )
            if ( control.hovered ) return Theme.switchStyle.getHoverBorderColor( control.checked )
            return Theme.switchStyle.getNormalBorderColor( control.checked )
        }

        Behavior on color { ColorAnimation { duration: 200 } }

        Rectangle {
            implicitHeight: Theme.getControlHeight( control.size ) / 1.5
            implicitWidth: height
            x: control.checked ? parent.width - width - Theme.switchStyle.getIndicatorPadding( control.size ) : Theme.switchStyle.getIndicatorPadding( control.size )
            anchors.verticalCenter: parent.verticalCenter
            radius: height / 2

            Behavior on x { PropertyAnimation { duration: 200 } }
        }
    }

    contentItem: Controls.Label {
        text: control.text
        opacity: enabled ? 1.0 : 0.48
        style: LabelStyle.Base3
        color:
        {
            if( !control.enabled ) return Utils.getAlphaColor( Theme.switchStyle.getTextColor(), 0.7 )
            if( control.hovered ) return Utils.getAlphaColor( Theme.switchStyle.getTextColor(), 0.9 )
            return Utils.getAlphaColor( Theme.switchStyle.getTextColor(), 0.8 )
        }
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + (text.length > 0 ? control.spacing : 0)
    }
}
