/*
 * Utils.h
 *
 *  Created on: 9 févr. 2015
 *      Author: as250818
 */

#ifndef UTILS_H_
#define UTILS_H_

#include <QObject>
#include <QMetaType>

class Utils : public  QObject
{
    Q_OBJECT

public:
    Utils(QObject *parent = 0);
    virtual ~Utils();
    QString Maj(QString);


private:
    int m_iValue;
};
#endif /* UTILS_H_ */
