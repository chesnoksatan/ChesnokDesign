#pragma once

#include <QObject>

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
