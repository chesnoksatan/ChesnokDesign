import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T

import ChesnokDesign 1.0

// @disable-check M129
T.TextField {
    id: control

    implicitWidth: 200
    implicitHeight: Theme.getControlHeight( control.size )

    property int size: ControlSize.H24
    property bool hasError: false

    selectByMouse: true
    font: placeholder.font
    color: Theme.inputStyle.getTextColor()
    selectionColor: Theme.inputStyle.getSelectionColor()
    selectedTextColor: Theme.inputStyle.getSelectedTextColor()
    opacity: control.enabled ? 1.0 : 0.48

    topPadding: Theme.buttonStyle.getPadding( control.size )
    bottomPadding: Theme.buttonStyle.getPadding( control.size )
    leftPadding: Theme.buttonStyle.getPadding( control.size )
    rightPadding: Theme.buttonStyle.getPadding( control.size )

    Label {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)
        text: control.placeholderText
        elide: Text.ElideRight
        verticalAlignment: control.verticalAlignment
        renderType: control.renderType
        visible: !control.length && !control.preeditText && !control.activeFocus
        style: LabelStyle.Base4
        color: Theme.inputStyle.getPlaceholderTextColor()
    }

    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        color:
        {
            if(!control.enabled) return Theme.inputStyle.getDisableBackgroundColor()
            if(control.hasError && !control.activeFocus) return Theme.inputStyle.getErrorBackgroundColor()
            return Theme.inputStyle.getNormalBackgroundColor()
        }
        border.color:
        {
            if(!control.enabled) return Theme.inputStyle.getDisabledBorderColor()
            if(control.hasError) return Utils.getAlphaColor( "#a51d2d", 0.9 ) // TODO
            if(control.activeFocus) return Theme.inputStyle.getFocusBorderColor()
            if(control.hovered) return Theme.inputStyle.getHoverBorderColor()
            return Theme.inputStyle.getNormalBorderColor()
        }
    }
}
