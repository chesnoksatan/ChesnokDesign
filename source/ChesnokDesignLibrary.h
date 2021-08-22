#pragma once

#include <QQmlApplicationEngine>

class ChesnokDesignLibrary
{
public:
    static void initialize( QQmlEngine *engine, const char *uri );

private:
    ChesnokDesignLibrary( const ChesnokDesignLibrary & ) = delete;
    ChesnokDesignLibrary &operator=( const ChesnokDesignLibrary & ) = delete;
    ChesnokDesignLibrary() { }
};
