import QtQuick 2.12
import QtQml 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.0

import ChesnokDesign 1.0

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

    color: Theme.accentBackgroundColor
}
