import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4

import ChesnokDesign 1.0
import ButtonStyle 1.0
import NeumorphicStyle 1.0

Page {
    background: Rectangle {
        anchors.fill: parent
        color: Theme.neumorphicBackgroundColor
    }

    Flickable{
        anchors.fill: parent
        contentHeight: layout.height
        contentWidth: layout.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}

        // Add all icons
        ColumnLayout {
            id: layout

            GridLayout {
                GridLayout {
                    columns: 11
                    columnSpacing: 22
                    rowSpacing: 22
                }
            }
        }
    }
}
