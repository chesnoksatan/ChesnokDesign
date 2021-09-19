import QtQuick 2.12 as Quick

import ChesnokDesign 1.0

// @disable-check M129
Quick.TextEdit {
    id: control

    readOnly: true
    selectByMouse: true

    property int style: LabelStyle.Base4

    font.family: Theme.labelStyle.getFontFamily( control.style )
    font.pointSize: Theme.labelStyle.getFontPointSize( control.style )
    font.weight: Theme.labelStyle.getFontWeight( control.style )

    color: Theme.inputStyle.getTextColor()
    selectionColor: Theme.inputStyle.getSelectionColor()
    selectedTextColor: Theme.inputStyle.getSelectedTextColor()
}
