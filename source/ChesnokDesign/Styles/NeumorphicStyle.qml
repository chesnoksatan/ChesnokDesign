import QtQuick 2.12
import QtQml 2.12

import ChesnokDesign 1.0
import ApplicationTheme 1.0

Item {
    id: buttonStyle

    QtObject
    {
        id: lightTheme

        readonly property color normalBackgroundColor: Theme.neumorphicBackgroundColor
        readonly property color hoverBackgroundColor: Theme.neumorphicGrayScale[300]
        readonly property color pressedBackgroundColor: Theme.neumorphicGrayScale[400]
        readonly property color lightShadowColor: "#FAFBFF"
        readonly property color darkShadowColor: "#35373E"
        readonly property color normalBorderColor: Theme.transparent
        readonly property color enabledBorderColor: Theme.neumorphicGrayScale[300]
        readonly property color textColor: Theme.neumorphicGrayScale[1000]
    }

    QtObject
    {
        id: darkTheme

        readonly property color normalBackgroundColor: Theme.neumorphicBackgroundColor
        readonly property color hoverBackgroundColor: "#4A5159"
        readonly property color pressedBackgroundColor: "#454854"
        readonly property color lightShadowColor: Utils.getAlphaColor( "#FAFBFF", 0.4 )
        readonly property color darkShadowColor: "#35373E"
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

        readonly property int outerShadowRadius: 7
        readonly property int innerShadowRadius: 5
    }

    QtObject
    {
        id: shadowSamples

        readonly property int outerShadowSamples: 20
        readonly property int innerShadowSamples: 20
    }

    QtObject
    {
        id: shadowOffset

        readonly property real normalShadowOffset: 1.5
        readonly property real pressedShadowOffset: 2
        readonly property real hoveredShadowOffset: 2.5
    }

    function getRadius( buttonSize ) { return Theme.getControlHeight( buttonSize ) / 5 }

    function getPadding( size )
    {
        switch ( size )
        {
            case ControlSize.H24: return 12;
            case ControlSize.H32: return 16;
            case ControlSize.H38: return 19;
            case ControlSize.H40: return 20;
            case ControlSize.H46: return 23;
            case ControlSize.H48: return 24;
        }
    }

    function getLightShadowColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.lightShadowColor
            case ThemeMode.Dark:  return darkTheme.lightShadowColor
        }
    }

    function getDarkShadowColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.darkShadowColor
            case ThemeMode.Dark:  return darkTheme.darkShadowColor
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
