import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.12

import ChesnokDesign 1.0
import NotificationType 1.0


ApplicationWindow {
    id: notification

    flags: Qt.WindowStaysOnTopHint | Qt.SplashScreen
    visible: true

    x: Screen.width - notification.width - 10
    y: Screen.height - 200

    width: 438
    height: 174
    color: "Transparent"

    property int type: NotificationType.Success
    property string title
    property string description

    Component.onCompleted: {
        animation.start()
        alive.start()
    }

    Timer {
        id: alive
        running: false
        repeat: false
        interval: 7000

        onTriggered: notification.close()
    }

    Image {
        id: image

        anchors.fill: parent
        smooth: true
        antialiasing: true

        source: getImageSource()

        sourceSize {
              width: notification.width
              height: notification.height
        }

        SequentialAnimation on opacity {
            id: animation
            running: false
            NumberAnimation { from: 0; to: 1; duration: 500 }
            NumberAnimation { duration: 6000}
            NumberAnimation { from: 1; to: 0; duration: 500 }
        }

        Label {
            id: title
            anchors.centerIn: parent
            text: notification.title
            color: Theme.buttonStyle.getTextColor( ButtonColorStyle.Primary )
            style: LabelStyle.Header3
        }

        Label {
            id: description
            anchors.top: title.bottom
            anchors.topMargin: 8
            anchors.horizontalCenter: parent.horizontalCenter
            text: notification.description
            color: Utils.getAlphaColor( Theme.buttonStyle.getTextColor( ButtonColorStyle.Primary ), 0.7 )
            style: LabelStyle.Paragraph3
        }

        ButtonIcon {
            id: closeBtn
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 8
            anchors.topMargin: 50
            icon.name: "close_small"
            icon.group: "menu"
            style: ButtonColorStyle.Base
            onClicked: notification.close()
            icon.color: Theme.buttonStyle.getTextColor( ButtonColorStyle.Primary )
        }
    }

    function getImageSource()
    {
        switch ( notification.type)
        {
        case NotificationType.Fail: return internal.fail
        case NotificationType.Success: return internal.success
        case NotificationType.Question: return internal.question
        case NotificationType.Warning: return internal.warning
        }
        return internal.success
    }

    QtObject {
        id: internal

        readonly property string fail: "qrc:/Icons/ChesnokDesign/Icons/special/fail.svg"
        readonly property string success: "qrc:/Icons/ChesnokDesign/Icons/special/success.svg"
        readonly property string question: "qrc:/Icons/ChesnokDesign/Icons/special/question.svg"
        readonly property string warning: "qrc:/Icons/ChesnokDesign/Icons/special/warning.svg"
    }
}
