import QtQuick 2.12
import QtQml 2.12

import ChesnokDesign 1.0
import ApplicationTheme 1.0

Item {
    id: buttonStyle

    QtObject
    {
        id: colorObject

        readonly property color darkColor: Theme.neumorphicGrayScale[1000]
        readonly property color lightColor: Theme.neumorphicGrayScale[100]
    }

    function getColor()
    {
        switch ( Theme.currentTheme )
        {
            case ThemeMode.Light: return colorObject.darkColor
            case ThemeMode.Dark:  return colorObject.lightColor
        }
    }

    function getFontWeight( style )
    {
        switch ( style )
        {
            case LabelStyle.Header1:
            case LabelStyle.Header2:
            case LabelStyle.Header3:
            case LabelStyle.Header4:
                return Font.Bold

            case LabelStyle.Paragraph1:
            case LabelStyle.Paragraph2:
            case LabelStyle.Paragraph3:
            case LabelStyle.Paragraph4:
                return Font.DemiBold

            case LabelStyle.Base1:
            case LabelStyle.Base2:
            case LabelStyle.Base3:
            case LabelStyle.Base4:
                return Font.Normal

            default:
                return Font.Normal
        }
    }

    function getFontPointSize( style )
    {
        switch ( style )
        {
            case LabelStyle.Header1: return 28
            case LabelStyle.Header2: return 18
            case LabelStyle.Header3: return 16
            case LabelStyle.Header4: return 15

            case LabelStyle.Paragraph1: return 18
            case LabelStyle.Paragraph2: return 14
            case LabelStyle.Paragraph3: return 13
            case LabelStyle.Paragraph4: return 12

            case LabelStyle.Base1: return 16
            case LabelStyle.Base2: return 15
            case LabelStyle.Base3: return 13
            case LabelStyle.Base4: return 12

            default: return 14
        }
    }

    // TODO: ???
    function getFontFamily( style )
    {
        return "Inter"
    }
}
