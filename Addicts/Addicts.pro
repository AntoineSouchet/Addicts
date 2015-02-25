APP_NAME = Addicts

CONFIG += qt warn_on cascades10
QT += network

LIBS += -lbb
LIBS += -lbbdata
LIBS += -lbbsystem
LIBS += -lbbplatform
LIBS += -lbbplatformbbm -lbbsystem

include(config.pri)
