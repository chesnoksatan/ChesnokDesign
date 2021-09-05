import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import QtQuick.Templates 2.1 as T

import ChesnokDesign 1.0

// @disable-check M129
T.Label {
    id: control

    property int style: LabelStyle.Paragraph2

    color: Theme.labelStyle.getColor()

    verticalAlignment: Text.AlignVCenter

    font.family: Theme.labelStyle.getFontFamily( control.style )
    font.pointSize: Theme.labelStyle.getFontPointSize( control.style )
    font.weight: Theme.labelStyle.getFontWeight( control.style )
}
