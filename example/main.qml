import QtQuick 2.12
import QtQml 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.0

import ChesnokDesign 1.0
import ButtonStyle 1.0
import ApplicationTheme 1.0

import QtQuick.Layouts 1.4

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: "Chesnok Design Example"

    Settings {
        id: settings
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }

    color: Theme.alternativeBackgroundColor

    Switch {
        onCheckedChanged: Theme.setTheme( !checked ? ThemeMode.Light : ThemeMode.Dark)
    }

    ComboBox {
        model: [ "BlueShade", "GreenShade", "YellowShade", "OrangeShade", "RedShade", "PurpleShade"]
        onCurrentIndexChanged: Theme.setAccentColor(currentIndex)
        y: 40
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 40
        Repeater {
            model: [{type: ButtonColorStyle.Base, name: "Base button"},
                    {type: ButtonColorStyle.Base2, name: "Base button"},
                    {type: ButtonColorStyle.Primary, name: "Primary button"},
                    {type: ButtonColorStyle.Secondary, name: "Secondary button"}]

            ColumnLayout {
                spacing: 16
                Repeater {
                    id: rep
                    property var buttonType: modelData
                    model: [ButtonSize.H24, ButtonSize.H32, ButtonSize.H38, ButtonSize.H40, ButtonSize.H46, ButtonSize.H48]
                    Button {
                        Layout.preferredWidth: 170
                        text: rep.buttonType.name
                        style: rep.buttonType.type
                        size: modelData
                        enabled: index !== 5
                    }
                }
            }
        }
    }
}
