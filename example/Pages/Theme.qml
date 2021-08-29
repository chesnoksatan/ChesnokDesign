import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.4

import ChesnokDesign 1.0
import ApplicationTheme 1.0

Page {
    background: Rectangle {
        anchors.fill: parent
        color: Theme.neumorphicBackgroundColor
    }

    ColumnLayout {
        anchors.centerIn: parent

        Switch {
            checked: Theme.currentTheme === ThemeMode.Dark
            onClicked: Theme.setTheme( !checked ? ThemeMode.Light : ThemeMode.Dark)
        }

        ComboBox {
            model: [ "BlueShade", "GreenShade", "YellowShade", "OrangeShade", "RedShade", "PurpleShade"]
            onCurrentIndexChanged: Theme.setAccentColor(currentIndex)
            y: 40
        }

        NeumorphicCheckBox { text: "SOME TEXT" }
        NeumorphicButton { implicitWidth: 40; implicitHeight: 40 }
        CheckBox { text: "SOME TEXT" }
    }
}
