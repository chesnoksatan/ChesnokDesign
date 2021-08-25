import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.12

import ChesnokDesign 1.0

Rectangle {
    id: delegate

    width: parent.width
    activeFocusOnTab: true

    property bool selected
    signal select()

    property bool expanded: delegate.width > 100
    property string name: modelData.name

    Icon {
        id: icon

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: delegate.left
        anchors.leftMargin: 4

        source: modelData.iconSource ? modelData.iconSource : ""
        group: modelData.iconGroup ? modelData.iconGroup : ""
        name: modelData.iconName ? modelData.iconName : ""

        size: delegate.height - 8
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

    color: selected ? Theme.accent[600] : "Transparent"
    radius: 5

    Behavior on color { ColorAnimation { duration: 200 } }

    MouseArea {
        anchors.fill: parent
        onClicked: delegate.select()
    }
}
