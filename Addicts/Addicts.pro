APP_NAME = Addicts

CONFIG += qt warn_on cascades10
QT += network

LIBS += -lbbsystem
LIBS += -lbb
LIBS += -lbbdata
LIBS += -lbbplatform
LIBS += -lbbplatformbbm 

include(config.pri)
