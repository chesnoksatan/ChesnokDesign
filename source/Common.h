#pragma once

#include <QColor>
#include <QObject>

namespace ApplicationTheme {

class Theme
{
    Q_GADGET
public:
    enum Value
    {
        Light,
        Dark
    };
    Q_ENUM( Value )

private:
    explicit Theme() { }
};

class ColorShade
{
    Q_GADGET
public:
    enum Value
    {
        BlueShade,
        GreenShade,
        YellowShade,
        OrangeShade,
        RedShade,
        PurpleShade
    };
    Q_ENUM( Value )

private:
    explicit ColorShade() { }
};

} // namespace ApplicationTheme

namespace ButtonStyle {

class ButtonColorStyle
{
    Q_GADGET
public:
    enum Value
    {
        Base,
        Base2,
        Primary,
        Secondary
    };
    Q_ENUM( Value )

private:
    explicit ButtonColorStyle() { }
};

class ButtonSize
{
    Q_GADGET
public:
    enum Value
    {
        H24,
        H32,
        H38,
        H40,
        H46,
        H48
    };
    Q_ENUM( Value )

private:
    explicit ButtonSize() { }
};

class NeumorphicButtonStyle
{
    Q_GADGET
public:
    enum Value
    {
        Inner,
        Outer
    };
    Q_ENUM( Value )

private:
    explicit NeumorphicButtonStyle() { }
};

} // namespace ButtonStyle

class NotificationType
{
    Q_GADGET
public:
    enum Value
    {
        Fail,
        Success,
        Question,
        Warning
    };
    Q_ENUM( Value )

private:
    explicit NotificationType() { }
};
