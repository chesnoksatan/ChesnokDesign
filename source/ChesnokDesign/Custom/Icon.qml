import QtQuick 2.8
import QtGraphicalEffects 1.0

import ChesnokDesign 1.0

Item {
    id: icon

    property real size: 20
    property alias image: image
    property bool valid: image.status == Image.Ready

    width: size
    height: size

    property bool colorize: true
    property color color: Theme.neumorphicGrayScale[300]
    property string source

    property string group
    property string name

    Image {
        id: image

        anchors.fill: parent
        visible: source != "" && !colorize

        smooth: true
        antialiasing: true

        source: getImageSource()

        width: icon.width
        height: icon.height

        sourceSize {
              width: icon.width
              height: icon.height
        }
    }

    ColorOverlay {
        id: overlay

        anchors.fill: parent
        source: image
        color: icon.color
        cached: true
        smooth: true
        visible: image.source != "" && colorize
        opacity: icon.color.a
        antialiasing: true
    }

    function getImageSource()
    {
        if( icon.source ) return icon.source
        if( icon.name && icon.group ) return "qrc:/Icons/ChesnokDesign/Icons/" + icon.group + '/' + icon.name + ".svg"
        return ""
    }
}
