import QtQuick 2.12
import QtQml 2.12

import ChesnokDesign 1.0
import ApplicationTheme 1.0

Item {
    id: inputStyle

    QtObject
    {
        id: lightTheme

        readonly property color normalBackgroundColor: Utils.getAlphaColor( Theme.basic[0], 0.6 )
        readonly property color disableBackgroundColor: Theme.basic[500]
        readonly property color errorBackgroundColor: Utils.getAlphaColor( "#a51d2d", 0.1 ) // ???

        readonly property color normalBorderColor: Theme.basic[500]
        readonly property color hoverBorderColor: Theme.basic[1000]
        readonly property color focusBorderColor: Theme.accent[600]
        readonly property color disableBorderColor: Theme.basic[400]

        readonly property color textColor: Theme.basic[1400]
        readonly property color placeholderTextColor: Theme.neumorphicGrayScale[1000]
        readonly property color selectionColor: Utils.getAlphaColor( Theme.accent[600], 0.3 )
        readonly property color selectedTextColor: Theme.accent[800]
    }

    QtObject
    {
        id: darkTheme

        readonly property color normalBackgroundColor: Utils.getAlphaColor( Theme.basic[9999], 0.6 )
        readonly property color disableBackgroundColor: Utils.getAlphaColor( Theme.basic[500], 0.06 )
        readonly property color errorBackgroundColor: Utils.getAlphaColor( "#a51d2d", 0.1 ) // ???

        readonly property color normalBorderColor: Theme.basic[1100]
        readonly property color hoverBorderColor: Theme.basic[900]
        readonly property color focusBorderColor: Theme.accent[600]
        readonly property color disableBorderColor: Theme.basic[1200]

        readonly property color textColor: Theme.basic[400]
        readonly property color placeholderTextColor: Theme.neumorphicGrayScale[100]
        readonly property color selectionColor: Utils.getAlphaColor( Theme.accent[600], 0.03 )
        readonly property color selectedTextColor: Theme.accent[700]
    }

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

    function getNormalBackgroundColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.normalBackgroundColor
            case ThemeMode.Dark:  return darkTheme.normalBackgroundColor
        }
    }

    function getDisableBackgroundColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.disableBackgroundColor
            case ThemeMode.Dark:  return darkTheme.disableBackgroundColor
        }
    }

    function getErrorBackgroundColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.errorBackgroundColor
            case ThemeMode.Dark:  return darkTheme.errorBackgroundColor
        }
    }

    function getNormalBorderColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.normalBorderColor
            case ThemeMode.Dark:  return darkTheme.normalBorderColor
        }
    }

    function getHoverBorderColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.hoverBorderColor
            case ThemeMode.Dark:  return darkTheme.hoverBorderColor
        }
    }

    function getFocusBorderColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.focusBorderColor
            case ThemeMode.Dark:  return darkTheme.focusBorderColor
        }
    }

    function getDisabledBorderColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.disableBorderColor
            case ThemeMode.Dark:  return darkTheme.disableBorderColor
        }
    }

    function getTextColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.textColor
            case ThemeMode.Dark:  return darkTheme.textColor
        }
    }

    function getPlaceholderTextColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.placeholderTextColor
            case ThemeMode.Dark:  return darkTheme.placeholderTextColor
        }
    }

    function getSelectionColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.selectionColor
            case ThemeMode.Dark:  return darkTheme.selectionColor
        }
    }

    function getSelectedTextColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return lightTheme.selectedTextColor
            case ThemeMode.Dark:  return darkTheme.selectedTextColor
        }
    }
}
