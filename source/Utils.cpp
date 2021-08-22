#include "Utils.h"

Utils::Utils( QObject *parent ) : QObject( parent )
{
}

QColor Utils::getAlphaColor( QColor color, double alpha )
{
    color.setAlphaF( alpha );
	return color;
}
