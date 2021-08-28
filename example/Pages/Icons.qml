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
        contentHeight: flow.height
        contentWidth: flow.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar{}
        ScrollBar.horizontal: ScrollBar{}

        Flow {
            id: flow
            width: page.width

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
                    height: 400

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

            GroupBox {
                title:  "Custom Notifications"

                width: 500 * 2
                height: 250 * 2

                GridLayout {
                    anchors.fill: parent

                    columns: 2

                    Repeater {
                        model: FileListModel {
                            scanDir: ":/Icons/ChesnokDesign/Icons/special/"
                        }
                        Image {
                            width: 438
                            height: 174

                            sourceSize {
                                  width: 438
                                  height: 174
                            }

                            source: "qrc:/Icons/ChesnokDesign/Icons/special/" + iconName + ".svg"

                            MouseArea{
                                id: area2
                                anchors.fill: parent
                                hoverEnabled: true
                            }
                            ToolTip {
                                text: iconName
                                visible: area2.containsMouse
                            }
                        }
                    }
                }
            }
        }
    }
}
