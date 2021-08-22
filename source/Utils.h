#pragma once

#include <QColor>
#include <QObject>

/**
 * @brief Вспомогательные функции для QML
 */
class Utils : public QObject
{
	Q_OBJECT
public:
    Utils( QObject *parent = nullptr );

	/**
	 * @brief Изменение alpha-канала в указанном цвете
	 * @param color Цвет, из QML можно присылать строку
	 * @param alpha Значение alpha-канала в диапазоне [0; 1]
	 */
    Q_INVOKABLE static QColor getAlphaColor( QColor color, double alpha );
};
