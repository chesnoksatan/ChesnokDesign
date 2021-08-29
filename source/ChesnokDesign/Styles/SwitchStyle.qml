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

        readonly property color normalBackgroundColor: Utils.getAlphaColor( Theme.basic[500], 0.9 )
        readonly property color hoverBackgroundColor: Utils.getAlphaColor( Theme.basic[700], 0.9 )
        readonly property color pressedBackgroundColor: Utils.getAlphaColor( Theme.basic[900], 0.9 )
        readonly property color normalBorderColor: Theme.basic[400]
        readonly property color hoverBorderColor: Utils.getAlphaColor( Theme.basic[900], 0.8 )
        readonly property color pressedBorderColor: Utils.getAlphaColor( Theme.basic[1100], 0.8 )
    }

    QtObject
    {
        id: borderWidth

        readonly property int checkedBorderWidth: 1
        readonly property int uncheckedBorderWidth: 0
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

    function getIndicatorPadding( controlSize )
    {
        switch ( controlSize )
        {
            case ControlSize.H24: return 3;
            case ControlSize.H32: return 4;
            case ControlSize.H38: return 5;
            case ControlSize.H40: return 6;
            case ControlSize.H46: return 7;
            case ControlSize.H48: return 8;
        }
    }
}
