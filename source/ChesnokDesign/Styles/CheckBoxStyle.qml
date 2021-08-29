import QtQuick 2.12
import QtQml 2.12

import ChesnokDesign 1.0
import ApplicationTheme 1.0

Item {
    id: buttonStyle

    QtObject
    {
        id: lightTheme

        readonly property color textColor: Theme.neumorphicGrayScale[1000]
    }

    QtObject
    {
        id: darkTheme

        readonly property color textColor: Theme.neumorphicGrayScale[100]
    }

    QtObject
    {
        id: checkedColors

        readonly property color normalBackgroundColor: Theme.accent[400]
        readonly property color hoverBackgroundColor: Theme.accent[500]
        readonly property color pressedBackgroundColor: Theme.accent[600]
        readonly property color normalBorderColor: Theme.transparent
        readonly property color hoverBorderColor: Theme.transparent
        readonly property color pressedBorderColor: Theme.transparent
    }

    QtObject
    {
        id: uncheckedColors

        readonly property color normalBackgroundColor: Theme.transparent
        readonly property color hoverBackgroundColor: Utils.getAlphaColor( Theme.basic[600], 0.5 )
        readonly property color pressedBackgroundColor: Utils.getAlphaColor( Theme.basic[800], 0.6 )
        readonly property color normalBorderColor: Theme.basic[600]
        readonly property color hoverBorderColor: Utils.getAlphaColor( Theme.basic[700], 0.9 )
        readonly property color pressedBorderColor: Utils.getAlphaColor( Theme.basic[800], 0.9 )
    }

    QtObject
    {
        id: borderWidth

        readonly property int checkedBorderWidth: 0
        readonly property int uncheckedBorderWidth: 1
    }

    function getNormalBackgroundColor( checked )
    {
        return checked ? checkedColors.normalBackgroundColor :
                         uncheckedColors.normalBackgroundColor

    }

    function getHoverBackgroundColor( checked )
    {
        return checked ? checkedColors.hoverBackgroundColor :
                         uncheckedColors.hoverBackgroundColor
    }

    function getPressedBackgroundColor( checked )
    {
        return checked ? checkedColors.pressedBackgroundColor :
                         uncheckedColors.pressedBackgroundColor
    }

    function getNormalBorderColor( checked )
    {
        return checked ? checkedColors.normalBorderColor :
                         uncheckedColors.normalBorderColor

    }

    function getHoverBorderColor( checked )
    {
        return checked ? checkedColors.hoverBorderColor :
                         uncheckedColors.hoverBorderColor
    }

    function getPressedBorderColor( checked )
    {
        return checked ? checkedColors.pressedBorderColor :
                         uncheckedColors.pressedBorderColor
    }

    function getTextColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.textColor
            case ThemeMode.Dark:  return darkTheme.textColor
        }
    }

    function getBorderWidth( checked )
    {
        return checked ? borderWidth.checkedBorderWidth : borderWidth.uncheckedBorderWidth
    }
}
