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

        ColumnLayout {
            spacing: 16
            Repeater {
                id: rep3
                model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                CheckBox {
                    size: modelData
                    enabled: index !== 5
                    checked: index !== 3
                }
            }
        }

        ColumnLayout {
            spacing: 16
            Repeater {
                id: rep4
                model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                NeumorphicCheckBox {
                    size: modelData
                    enabled: index !== 5
                    checked: index !== 3
                }
            }
        }

        ColumnLayout {
            spacing: 16
            Repeater {
                id: rep5
                model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                Switch {
                    size: modelData
                    enabled: index !== 5
                    checked: index !== 3
                }
            }
        }

        ColumnLayout {
            spacing: 16
            Repeater {
                id: rep6
                model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                NeumorphicSwitch {
                    size: modelData
                    enabled: index !== 5
                    checked: index !== 3
                }
            }
        }

        ColumnLayout {
            spacing: 16
            Repeater {
                id: rep7
                model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                RadioButton {
                    size: modelData
                    enabled: index !== 5
                    checked: index === 3
                }
            }
        }

        ColumnLayout {
            spacing: 16
            Repeater {
                id: rep8
                model: [ControlSize.H24, ControlSize.H32, ControlSize.H38, ControlSize.H40, ControlSize.H46, ControlSize.H48]
                NeumorphicRadioButton {
                    size: modelData
                    enabled: index !== 5
                    checked: index === 3
                }
            }
        }
    }
}
