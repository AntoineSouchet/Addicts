/*
 * Preferences.h
 *
 *  Created on: 26 févr. 2015
 *      Author: as250818
 */

#ifndef PREFERENCES_H_
#define PREFERENCES_H_

class Preferences
{
public:
    Preferences();
    virtual ~Preferences();
        Q_INVOKABLE
        void createSQL();
        Q_INVOKABLE
        void saveSQL(QString type);
        Q_INVOKABLE
        QString getTheme();
        Q_INVOKABLE
        void DeleteSQL();
};

#endif /* PREFERENCES_H_ */
