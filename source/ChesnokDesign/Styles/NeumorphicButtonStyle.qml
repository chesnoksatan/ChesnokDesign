import QtQuick 2.12
import QtQml 2.12

import ChesnokDesign 1.0
import ApplicationTheme 1.0

Item {
    id: buttonStyle

    QtObject
    {
        id: lightTheme

        readonly property color normalBackgroundColor: Theme.neumorphicGrayScale[200]
        readonly property color hoverBackgroundColor: Theme.neumorphicGrayScale[300]
        readonly property color pressedBackgroundColor: Theme.neumorphicGrayScale[400]
        readonly property color normalBorderColor: Theme.transparent
        readonly property color enabledBorderColor: Theme.neumorphicGrayScale[300]
        readonly property color textColor: Theme.neumorphicGrayScale[1000]
    }

    QtObject
    {
        id: darkTheme

        readonly property color normalBackgroundColor: Theme.neumorphicGrayScale[700]
        readonly property color hoverBackgroundColor: Theme.neumorphicGrayScale[600]
        readonly property color pressedBackgroundColor: Theme.neumorphicGrayScale[500]
        readonly property color normalBorderColor: Theme.transparent
        readonly property color enabledBorderColor: Theme.neumorphicGrayScale[300]
        readonly property color textColor: Theme.neumorphicGrayScale[100]
    }

    QtObject
    {
        id: borderWidth

        readonly property int normalBorderWidth: 0
        readonly property int enabledBorderWidth: 2
    }

    QtObject
    {
        id: shadowRadius

        readonly property int outerShadowRadius: 15
        readonly property int innerShadowRadius: 30
    }

    QtObject
    {
        id: shadowSamples

        readonly property int outerShadowSamples: 30
        readonly property int innerShadowSamples: 30
    }

    QtObject
    {
        id: shadowOffset

        readonly property int normalShadowOffset: 3
        readonly property int pressedShadowOffset: 8
        readonly property int hoveredShadowOffset: 6
    }

    function getHeight( buttonSize )
    {
        switch ( buttonSize )
        {
            case ButtonSize.H24: return 24;
            case ButtonSize.H32: return 32;
            case ButtonSize.H38: return 38;
            case ButtonSize.H40: return 40;
            case ButtonSize.H46: return 46;
            case ButtonSize.H48: return 48;
        }
    }

    function getRadius( buttonSize ) { return getHeight( buttonSize ) / 5 }

    function getPadding( buttonSize )
    {
        switch ( buttonSize )
        {
            case ButtonSize.H24: return 12;
            case ButtonSize.H32: return 16;
            case ButtonSize.H38: return 19;
            case ButtonSize.H40: return 20;
            case ButtonSize.H46: return 23;
            case ButtonSize.H48: return 24;
        }
    }

    function getNormalBackgroundColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.normalBackgroundColor
            case ThemeMode.Dark:  return darkTheme.normalBackgroundColor
        }
    }

    function getHoverBackgroundColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.hoverBackgroundColor
            case ThemeMode.Dark:  return darkTheme.hoverBackgroundColor
        }
    }

    function getPressedBackgroundColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.pressedBackgroundColor
            case ThemeMode.Dark:  return darkTheme.pressedBackgroundColor
        }
    }

    function getBorderColor( enabled )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return enabled ? lightTheme.normalBorderColor : lightTheme.enabledBorderColor
            case ThemeMode.Dark:  return enabled ? darkTheme.normalBorderColor : darkTheme.enabledBorderColor
        }
    }

    function getBorderWidth( enabled )
    {
        return enabled ? borderWidth.normalBorderWidth : borderWidth.enabledBorderWidth
    }

    function getTextColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.textColor
            case ThemeMode.Dark:  return darkTheme.textColor
        }
    }

    function getShadowRadius( style )
    {
        switch ( style )
        {
            case NeumorphicButtonStyle.Inner: return shadowRadius.innerShadowRadius
            case NeumorphicButtonStyle.Outer: return shadowRadius.outerShadowRadius
        }
    }

    function getShadowSamples( style )
    {
        switch ( style )
        {
            case NeumorphicButtonStyle.Inner: return shadowSamples.innerShadowSamples
            case NeumorphicButtonStyle.Outer: return shadowSamples.outerShadowSamples
        }
    }

    function getNormalShadowOffset() { return shadowOffset.normalShadowOffset }
    function getPressedShadowOffset() { return shadowOffset.pressedShadowOffset }
    function getHoveredShadowOffset() { return shadowOffset.hoveredShadowOffset }
}
