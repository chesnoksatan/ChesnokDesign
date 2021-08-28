import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4

import ChesnokDesign 1.0

import FileListModel 1.0

Page {
    id: page
    background: Rectangle {
        anchors.fill: parent
        color: Theme.backgroundColor
    }

    Flickable{
        anchors.fill: parent
        anchors.leftMargin: 8
        contentHeight: column.height
        contentWidth: column.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}

        Column {
            id: column

            Repeater {
                model: [
                    "arrow", "attention", "basic", "brand", "calendar", "chart",
                    "communication", "device", "edit", "experimental", "file", "grid", "home",
                    "media", "menu", "misc", "notification", "system", "user"
                ]

                GroupBox {
                    id: groupBox
                    title: groupName + " group"
                    property var groupName: modelData

                    width: 400

                    GridLayout {
                        anchors.fill: parent

                        columns: 8

                        Repeater {
                            model: FileListModel {
                                scanDir: ":/Icons/ChesnokDesign/Icons/" + groupBox.groupName + "/"
                            }
                            Icon {
                                group: groupBox.groupName
                                name: iconName
                                color: Theme.neumorphicReverseBackgroundColor
                                size: 35

                                MouseArea{
                                    id: area
                                    anchors.fill: parent
                                    hoverEnabled: true
                                }
                                ToolTip {
                                    text: iconName
                                    visible: area.containsMouse
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
