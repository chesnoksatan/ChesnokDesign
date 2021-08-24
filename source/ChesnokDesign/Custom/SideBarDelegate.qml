import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12

import NeumorphicStyle 1.0
import ChesnokDesign 1.0
import ButtonStyle 1.0

Rectangle {
    id: delegate

    width: parent.width
    activeFocusOnTab: true

    property bool selected
    signal select()

    property bool expanded: delegate.width > 100
    property string iconSource: modelData.iconSource
    property string name: modelData.name

    Image {
        id: icon

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: delegate.left
        anchors.leftMargin: 4

        source: delegate.iconSource ? delegate.iconSource : ""

        width: delegate.height - 8
        height: delegate.height - 8

        sourceSize {
            width: icon.width
            height: icon.height
        }
    }

    Label {
        id: caption
        color: Theme.basic[700]
        text: delegate.name ? delegate.name : ""
        visible: delegate.expanded && delegate.name
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: icon.right
        anchors.leftMargin: 8

        font.family: "Inter"
        font.pixelSize: 15
        font.weight: Font.DemiBold
    }

    color: selected ? Theme.accent[200] : "Transparent"
    radius: 5

    Behavior on color { ColorAnimation { duration: 200 } }

    MouseArea {
        anchors.fill: parent
        onClicked: delegate.select()
    }
}
