#pragma once
#include <QAbstractListModel>

/**
 * @brief Модель списка файлов в заданной директории
 */
class FileListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY( QString scanDir WRITE setScanDir )

public:
    FileListModel( QObject *parent = nullptr ) : QAbstractListModel( parent ) { }

    enum Roles
    {
        Name = Qt::UserRole + 1
    };

    void setScanDir( QString dir );

    QHash< int, QByteArray > roleNames() const override;
    int rowCount( const QModelIndex &parent = QModelIndex() ) const override;
    QVariant data( const QModelIndex &index, int role = Qt::DisplayRole ) const override;

private:
    QString m_scanDir;
    QStringList m_items;
};
