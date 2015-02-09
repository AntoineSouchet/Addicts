/*
 * Utils.cpp
 *
 *  Created on: 9 févr. 2015
 *      Author: as250818
 */

#include "Utils.h"
#include <QtCore/qobject.h>

Utils::Utils(QObject *parent) : QObject(parent)
{
    m_iValue = 0;
}

Utils::~Utils()
{
}

QString Maj(QString title)
{
    if (!title.isEmpty())
    {
        title = title[0].toUpper()+title.remove(0,1);
    }
    return title;
}

