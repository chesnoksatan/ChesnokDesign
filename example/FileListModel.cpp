#include "FileListModel.h"

#include <QDebug>
#include <QDir>

void FileListModel::setScanDir( QString dir )
{
    m_scanDir = dir;
    m_items.clear();
    auto list = QDir( m_scanDir ).entryList( QDir::Files );
    for ( auto fileName : list )
    {
        m_items.append( fileName.remove( ".svg" ) );
    }
}

QHash< int, QByteArray > FileListModel::roleNames() const
{
    return { { Name, "iconName" } };
}

int FileListModel::rowCount( const QModelIndex & /*parent*/ ) const
{
    return m_items.count();
}

QVariant FileListModel::data( const QModelIndex &index, int role ) const
{
    if ( index.row() >= m_items.count() )
    {
        return QVariant();
    }

    const auto &fileName = m_items.at( index.row() );

    switch ( role )
    {
    case Name:
        return fileName;
    }

    return QVariant();
}
