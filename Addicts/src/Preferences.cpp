/*
 * Preferences.cpp
 *
 *  Created on: 26 févr. 2015
 *      Author: as250818
 */

#include <src/Preferences.h>
#include <QDir>
#include <QFile>

#include <bb/data/SqlDataAccess>
using namespace bb::data;

QDir home = QDir::home();
QFile file(QDir::currentPath() + "/app/native/assets/prefs.db");
SqlDataAccess sda(QDir::currentPath() + "/app/native/assets/prefs.db");

Preferences::Preferences()
{
    // TODO Auto-generated constructor stub

}

Preferences::~Preferences()
{
    // TODO Auto-generated destructor stub
}

void Preferences::DeleteSQL()
{
    sda.execute("DROP TABLE Preferences;");
    sda.execute("CREATE TABLE Preferences(theme VARCHAR(10));");
    saveSQL("FIRST");
}
void Preferences::createSQL()
{
//    QDir home = QDir::home();
//    QFile file(QDir::currentPath() + "/app/native/assets/prefs.db");


        if(file.exists() == false)
        {
            sda.execute("CREATE TABLE Preferences(theme VARCHAR(10));");
            saveSQL("FIRST");
        }
        //SqlDataAccess sda(QDir::currentPath() + "/app/native/assets/prefs.db");



}
void Preferences::saveSQL(QString type)
{


   if (type == "FIRST")
   {
       if (getTheme() == "")
       {
           qDebug() << "FIRST insert";
           QString sqlDelete = "Delete from Preferences";
           sda.execute(sqlDelete);
           QString sqlRequest = "insert into Preferences values ('White');";
           sda.execute(sqlRequest);
       }
   }
       if (getTheme() != type)
   {
           if (type != "FIRST")
           {
               qDebug() << "Theme change insert";
               QString sqlDelete = "Delete from Preferences";
               sda.execute(sqlDelete);
               QString sqlRequest = "insert into Preferences values ('" + type + "');";
               sda.execute(sqlRequest);
           }

   }

}
//
QString Preferences::getTheme()
{
   QString sqlRequest = "Select theme from Preferences;";
   QVariant list = sda.execute(sqlRequest);
   QVariantList myList = list.value<QVariantList>();
   int recordsRead = myList.size();
   QString retour = "";
   for(int i=0; i < recordsRead; i++)
   {
       QVariantMap map = myList.at(i).value<QVariantMap>();
       qDebug() << map["theme"].toString();
       retour = map["theme"].toString();
   }
   if (retour == "")
   {
       retour = "White";
   }
   return retour;
}
