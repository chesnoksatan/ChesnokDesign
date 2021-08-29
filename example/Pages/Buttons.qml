import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4

import ChesnokDesign 1.0

Page {
    background: Rectangle {
        anchors.fill: parent
        color: Theme.neumorphicBackgroundColor
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 40
        Repeater {
            model: [{type: ButtonColorStyle.Base, name: "Base button"},
                    {type: ButtonColorStyle.Base2, name: "Base2 button"},
                    {type: ButtonColorStyle.Primary, name: "Primary button"},
                    {type: ButtonColorStyle.Secondary, name: "Secondary button"}]

            ColumnLayout {
                spacing: 16
                Repeater {
                    id: rep
                    property var buttonType: modelData
                    model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                    Button {
                        Layout.preferredWidth: 170
                        text: rep.buttonType.name
                        style: rep.buttonType.type
                        size: modelData
                        enabled: index !== 5
                        rounded: index === 2
                    }
                }
            }
        }

        Repeater {
            model: [{type: NeumorphicButtonStyle.Inner, name: "Inner button"},
                    {type: NeumorphicButtonStyle.Outer, name: "Outer button"}]

            ColumnLayout {
                spacing: 16
                Repeater {
                    id: rep2
                    property var buttonType: modelData
                    model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                    NeumorphicButton {
                        Layout.preferredWidth: 170
                        text: rep2.buttonType.name
                        style: rep2.buttonType.type
                        size: modelData
                        enabled: index !== 5
                    }
                }
            }
        }
    }
}
