/****************************************************************************
** Meta object code from reading C++ file 'applicationui.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/applicationui.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'applicationui.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ApplicationUI[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      16,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      15,   14,   14,   14, 0x08,
      47,   41,   14,   14, 0x08,

 // methods: signature, parameters, type, tag, flags
     116,   14,   14,   14, 0x02,
     133,   14,   14,   14, 0x02,
     147,   14,   14,   14, 0x02,
     165,   14,   14,   14, 0x02,
     180,   14,   14,   14, 0x02,
     194,  190,   14,   14, 0x02,
     211,   14,   14,   14, 0x02,
     229,   14,  221,   14, 0x02,
     243,  237,   14,   14, 0x02,
     264,   14,   14,   14, 0x02,
     299,  288,  283,   14, 0x02,
     343,  334,  323,   14, 0x02,
     366,   14,   14,   14, 0x02,
     403,  395,   14,   14, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationUI[] = {
    "ApplicationUI\0\0onSystemLanguageChanged()\0"
    "state\0"
    "registrationStateUpdated(bb::platform::bbm::RegistrationState::Type)\0"
    "twitter(QString)\0TwitterOpen()\0"
    "facebook(QString)\0facebookOpen()\0"
    "BBMOpen()\0url\0browser(QString)\0BBWorld()\0"
    "QString\0getID()\0theme\0changeTheme(QString)\0"
    "cleanApplication()\0bool\0wordSearch\0"
    "CheckInjection(QString)\0QByteArray\0"
    "toEncode\0encodeQString(QString)\0"
    "inviteUserToDownloadViaBBM()\0message\0"
    "updatePersonalMessage(QString)\0"
};

void ApplicationUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ApplicationUI *_t = static_cast<ApplicationUI *>(_o);
        switch (_id) {
        case 0: _t->onSystemLanguageChanged(); break;
        case 1: _t->registrationStateUpdated((*reinterpret_cast< bb::platform::bbm::RegistrationState::Type(*)>(_a[1]))); break;
        case 2: _t->twitter((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->TwitterOpen(); break;
        case 4: _t->facebook((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->facebookOpen(); break;
        case 6: _t->BBMOpen(); break;
        case 7: _t->browser((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: _t->BBWorld(); break;
        case 9: { QString _r = _t->getID();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 10: _t->changeTheme((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: _t->cleanApplication(); break;
        case 12: { bool _r = _t->CheckInjection((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 13: { QByteArray _r = _t->encodeQString((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = _r; }  break;
        case 14: _t->inviteUserToDownloadViaBBM(); break;
        case 15: _t->updatePersonalMessage((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ApplicationUI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ApplicationUI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ApplicationUI,
      qt_meta_data_ApplicationUI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ApplicationUI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ApplicationUI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ApplicationUI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ApplicationUI))
        return static_cast<void*>(const_cast< ApplicationUI*>(this));
    return QObject::qt_metacast(_clname);
}

int ApplicationUI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
