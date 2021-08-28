import QtQuick 2.12
import QtQml 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.0

import ChesnokDesign 1.0
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

    color: Theme.backgroundColor

    NeumorphicSideBar {
        id: navigation
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        model: [
            {name: "Icons", iconGroup: "basic", iconName: "image_alt", url: "qrc:/Example/Pages/Icons.qml"},
            {name: "Buttons", iconGroup: "media", iconName: "airplay", url: "qrc:/Example/Pages/Buttons.qml"},
            {name: "Theme", iconGroup: "basic", iconName: "slider_03", url: "qrc:/Example/Pages/Theme.qml"},
        ]

        onCurrentIndexChanged: {
            loader.source = model[currentIndex].url
        }
    }

    Loader {
        id: loader
        anchors {
            left: navigation.right
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
    }

    Component.onCompleted: {
        navigation.currentIndex = 2

//        var comnponent = Qt.createComponent('qrc:/ChesnokDesign/Custom/Notification.qml');
//        var object = comnponent.createObject(window, { 'title': "", 'message': ""});
    }
}
