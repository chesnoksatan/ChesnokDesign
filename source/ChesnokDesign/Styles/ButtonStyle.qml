import QtQuick 2.12
import QtQml 2.12

import ChesnokDesign 1.0
import ApplicationTheme 1.0

Item {
    id: buttonStyle

    QtObject
    {
        id: lightTheme

        readonly property var normalBackgroundColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.accent[300],
            "secondary": Theme.basic[200]
        }

        readonly property var hoverBackgroundColor:
        {
            "base":      Utils.getAlphaColor( Theme.basic[1400], 0.08 ),
            "base2":     Utils.getAlphaColor( Theme.basic[1400], 0.08 ),
            "primary":   Theme.accent[400],
            "secondary": Theme.basic[200]
        }

        readonly property var pressedBackgroundColor:
        {
            "base":      Utils.getAlphaColor( Theme.basic[1400], 0.12 ),
            "base2":     Utils.getAlphaColor( Theme.basic[1400], 0.12 ),
            "primary":   Theme.accent[500],
            "secondary": Theme.basic[300]
        }

        readonly property var normalBorderColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.transparent,
            "secondary": Theme.transparent
        }

        readonly property var hoverBorderColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.accent[200],
            "secondary": Theme.basic[100]
        }

        readonly property var pressedBorderColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.accent[300],
            "secondary": Theme.basic[0]
        }

        readonly property var textColor:
        {
            "base":      Theme.basic[1500],
            "base2":     Theme.accent[600],
            "primary":   Theme.basic[0],
            "secondary": Theme.accent[600]
        }

        readonly property var iconColor:
        {
            "base":      Theme.basic[0],
            "base2":     Theme.accent[600],
            "primary":   Theme.basic[1500],
            "secondary": Theme.accent[600]
        }
    }

    QtObject
    {
        id: darkTheme

        readonly property var normalBackgroundColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.accent[300],
            "secondary": Theme.basic[1200]
        }

        readonly property var hoverBackgroundColor:
        {
            "base":      Utils.getAlphaColor( Theme.basic[400], 0.08 ),
            "base2":     Utils.getAlphaColor( Theme.basic[400], 0.08 ),
            "primary":   Theme.accent[400],
            "secondary": Theme.basic[1200]
        }

        readonly property var pressedBackgroundColor:
        {
            "base":      Utils.getAlphaColor( Theme.basic[400], 0.12 ),
            "base2":     Utils.getAlphaColor( Theme.basic[400], 0.12 ),
            "primary":   Theme.accent[500],
            "secondary": Theme.basic[1300]
        }

        readonly property var normalBorderColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.transparent,
            "secondary": Theme.transparent
        }

        readonly property var hoverBorderColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.accent[200],
            "secondary": Theme.basic[1100]
        }

        readonly property var pressedBorderColor:
        {
            "base":      Theme.transparent,
            "base2":     Theme.transparent,
            "primary":   Theme.accent[300],
            "secondary": Theme.basic[1000]
        }

        readonly property var textColor:
        {
            "base":      Theme.basic[0],
            "base2":     Theme.accent[400],
            "primary":   Theme.basic[1500],
            "secondary": Theme.accent[500]
        }

        readonly property var iconColor:
        {
            "base":      Theme.basic[1500],
            "base2":     Theme.accent[600],
            "primary":   Theme.basic[0],
            "secondary": Theme.accent[600]
        }
    }

    QtObject
    {
        id: borderWidth

        readonly property var normalBorderWidth:
        {
            "base":      0,
            "base2":     0,
            "primary":   0,
            "secondary": 0
        }

        readonly property var hoverBorderWidth:
        {
            "base":      0,
            "base2":     0,
            "primary":   1,
            "secondary": 1
        }

        readonly property var pressedBorderWidth:
        {
            "base":      0,
            "base2":     0,
            "primary":   2,
            "secondary": 2
        }
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

    function getNormalBackgroundColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.normalBackgroundColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.normalBackgroundColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.normalBackgroundColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.normalBackgroundColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.normalBackgroundColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.normalBackgroundColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.normalBackgroundColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.normalBackgroundColor["secondary"]
                }
                break
            }
        }
    }

    function getHoverBackgroundColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.hoverBackgroundColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.hoverBackgroundColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.hoverBackgroundColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.hoverBackgroundColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.hoverBackgroundColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.hoverBackgroundColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.hoverBackgroundColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.hoverBackgroundColor["secondary"]
                }
                break
            }
        }
    }

    function getPressedBackgroundColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.pressedBackgroundColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.pressedBackgroundColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.pressedBackgroundColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.pressedBackgroundColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.pressedBackgroundColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.pressedBackgroundColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.pressedBackgroundColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.pressedBackgroundColor["secondary"]
                }
                break
            }
        }
    }

    function getNormalBorderColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.normalBorderColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.normalBorderColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.normalBorderColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.normalBorderColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.normalBorderColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.normalBorderColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.normalBorderColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.normalBorderColor["secondary"]
                }
                break
            }
        }
    }

    function getHoverBorderColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.hoverBorderColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.hoverBorderColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.hoverBorderColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.hoverBorderColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.hoverBorderColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.hoverBorderColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.hoverBorderColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.hoverBorderColor["secondary"]
                }
                break
            }
        }
    }

    function getPressedBorderColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.pressedBorderColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.pressedBorderColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.pressedBorderColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.pressedBorderColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.pressedBorderColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.pressedBorderColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.pressedBorderColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.pressedBorderColor["secondary"]
                }
                break
            }
        }
    }

    function getNormalBorderWidth( style )
    {
        switch ( style )
        {
            case ButtonColorStyle.Base: return borderWidth.normalBorderWidth["base"]
            case ButtonColorStyle.Base2: return borderWidth.normalBorderWidth["base2"]
            case ButtonColorStyle.Primary: return borderWidth.normalBorderWidth["primary"]
            case ButtonColorStyle.Secondary: return borderWidth.normalBorderWidth["secondary"]
        }
    }

    function getHoverBorderWidth( style )
    {
        switch ( style )
        {
            case ButtonColorStyle.Base: return borderWidth.hoverBorderWidth["base"]
            case ButtonColorStyle.Base2: return borderWidth.hoverBorderWidth["base2"]
            case ButtonColorStyle.Primary: return borderWidth.hoverBorderWidth["primary"]
            case ButtonColorStyle.Secondary: return borderWidth.hoverBorderWidth["secondary"]
        }
    }

    function getPressedBorderWidth( style )
    {
        switch ( style )
        {
            case ButtonColorStyle.Base: return borderWidth.pressedBorderWidth["base"]
            case ButtonColorStyle.Base2: return borderWidth.pressedBorderWidth["base2"]
            case ButtonColorStyle.Primary: return borderWidth.pressedBorderWidth["primary"]
            case ButtonColorStyle.Secondary: return borderWidth.pressedBorderWidth["secondary"]
        }
    }

    function getTextColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.textColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.textColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.textColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.textColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.textColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.textColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.textColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.textColor["secondary"]
                }
                break
            }
        }
    }

    function getIconColor( style )
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return lightTheme.iconColor["base"]
                    case ButtonColorStyle.Base2: return lightTheme.iconColor["base2"]
                    case ButtonColorStyle.Primary: return lightTheme.iconColor["primary"]
                    case ButtonColorStyle.Secondary: return lightTheme.iconColor["secondary"]
                }
                break
            }
            case ThemeMode.Dark:
            {
                switch ( style )
                {
                    case ButtonColorStyle.Base: return darkTheme.iconColor["base"]
                    case ButtonColorStyle.Base2: return darkTheme.iconColor["base2"]
                    case ButtonColorStyle.Primary: return darkTheme.iconColor["primary"]
                    case ButtonColorStyle.Secondary: return darkTheme.iconColor["secondary"]
                }
                break
            }
        }
    }
}
