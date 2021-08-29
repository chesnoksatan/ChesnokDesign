pragma Singleton

import QtQuick 2.12
import QtQml 2.12

import "./Styles"

import ApplicationTheme 1.0
import ChesnokDesign 1.0

Item {
    id: styleObject

    Component.onCompleted: {
        setTheme(ThemeMode.Light)
        setAccentColor(MainColor.BlueShade)
    }

    property var currentTheme

    property color backgroundColor: currentTheme === ThemeMode.Light ? basic[0] : basic[1500]
    property color neumorphicBackgroundColor: currentTheme === ThemeMode.Light ? neumorphicGrayScale[200] : neumorphicGrayScale[700]
    property color neumorphicReverseBackgroundColor: currentTheme === ThemeMode.Light ? neumorphicGrayScale[700] : neumorphicGrayScale[200]
    readonly property color accentBackgroundColor: accent[1000]
    property color alternativeBackgroundColor: currentTheme === ThemeMode.Light ? basic[400] : basic[1400]

    property var accent
    readonly property var basic: basicColors.basic
    readonly property var neumorphicGrayScale: neumorphic.grayScale
    readonly property color transparent: "Transparent"

    readonly property Item buttonStyle: ButtonStyle {}
    readonly property Item neumorphicStyle: NeumorphicStyle {}
    readonly property Item checkBoxStyle: CheckBoxStyle {}

    QtObject
    {
        id: neumorphic

        readonly property var grayScale:
        {
            100: "#F3F4F8",
            200: "#D2D4DA",
            300: "#B3B5BD",
            400: "#9496A1",
            500: "#777986",
            600: "#5B5D6B",
            700: "#4E555D",
            800: "#404252",
            900: "#282A3A",
            1000: "#1C1E2F",
            1100: "#161829",
            1200: "#101223",
            1300: "#0F1020",
            1400: "#0E0F1D",
            1500: "#0D0E1A"
        }
    }

    QtObject
    {
        id: basicColors

        readonly property var basic:
        {
            0:   "#FCFCFD",
            100: "#F4F5F5",
            200: "#EBECEC",
            300: "#DEDFE0",
            400: "#D3D4D5",
            500: "#C8CACC",
            600: "#BDBFC1",
            700: "#B3B5B7",
            800: "#A7A9AC",
            900: "#919599",
            1000: "#686D71",
            1100: "#45494D",
            1200: "#3A3D40",
            1300: "#303234",
            1400: "#282B2D",
            1450: "#242628",
            1500: "#212325",
            1600: "#1B1C1D",
            9999: "#161617"
        }
    }

    QtObject
    {
        id: accentColors

        readonly property var __BlueColors:
        {
            100: "#99c1f1",
            200: "#62a0ea",
            300: "#3584e4",
            400: "#1c71d8",
            500: "#1a5fb4",
            600: "#144887",
            700: "#113C71",
            800: "#0D305A",
            900: "#07182D",
            1000: "#040C17"
        }

        readonly property var __GreenColors:
        {
            100: "#8ff0a4",
            200: "#57e389",
            300: "#33d17a",
            400: "#2ec27e",
            500: "#26a269",
            600: "#1D7A4F",
            700: "#135135",
            800: "#0F3D28",
            900: "#0A291B",
            1000: "#05150E"
        }

        readonly property var __YellowColors:
        {
            100: "#f9f06b",
            200: "#f8e45c",
            300: "#f6d32d",
            400: "#f5c211",
            500: "#e5a50a",
            600: "#AC7C08",
            700: "#735305",
            800: "#573F04",
            900: "#3A2A03",
            1000: "#1D1502"
        }

        readonly property var __OrangeColors:
        {
            100: "#ffbe6f",
            200: "#ffa348",
            300: "#ff7800",
            400: "#e66100",
            500: "#c64600",
            600: "#953500",
            700: "#632300",
            800: "#4B1B00",
            900: "#321200",
            1000: "#190900"
        }

        readonly property var __RedColors:
        {
            100: "#f66151",
            200: "#ed333b",
            300: "#e01b24",
            400: "#c01c28",
            500: "#a51d2d",
            600: "#7C1622",
            700: "#530F17",
            800: "#3F0C12",
            900: "#2A080C",
            1000: "#150406"
        }

        readonly property var __PurpleColors:
        {
            100: "#dc8add",
            200: "#c061cb",
            300: "#9141ac",
            400: "#813d9c",
            500: "#613583",
            600: "#492863",
            700: "#311B42",
            800: "#251532",
            900: "#190E21",
            1000: "#0D0711"
        }
    }

    function setTheme( theme )
    {
        currentTheme = theme
    }

    function setAccentColor( accent )
    {
        switch(accent)
        {
            case MainColor.BlueShade: styleObject.accent = accentColors.__BlueColors; break;
            case MainColor.GreenShade: styleObject.accent = accentColors.__GreenColors; break;
            case MainColor.YellowShade: styleObject.accent = accentColors.__YellowColors; break;
            case MainColor.OrangeShade: styleObject.accent = accentColors.__OrangeColors; break;
            case MainColor.RedShade: styleObject.accent = accentColors.__RedColors; break;
            case MainColor.PurpleShade: styleObject.accent = accentColors.__PurpleColors; break;
        }
    }

    function getControlHeight( size )
    {
        switch ( size )
        {
            case ControlSize.H24: return 24;
            case ControlSize.H32: return 32;
            case ControlSize.H38: return 38;
            case ControlSize.H40: return 40;
            case ControlSize.H46: return 46;
            case ControlSize.H48: return 48;
        }
    }
}
