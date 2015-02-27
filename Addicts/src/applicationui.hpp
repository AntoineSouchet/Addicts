/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <QtNetwork>
#include <bb/platform/bbm/Context>
#include <bb/platform/bbm/MessageService>
#include <bb/platform/bbm/UserProfile>

namespace bb
{
    namespace cascades
    {
        class LocaleHandler;
    }
}

class QTranslator;
class Utils;
/*!
 * @brief Application UI object
 *
 * Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI();
    int first;
    virtual ~ApplicationUI() {}
    Q_INVOKABLE
    void twitter(QString);
    Q_INVOKABLE
    void TwitterOpen();
    Q_INVOKABLE
    void facebook(QString);
    Q_INVOKABLE
    void facebookOpen();
    Q_INVOKABLE
    void BBMOpen();
    Q_INVOKABLE
    void browser(QString url);
    Q_INVOKABLE
    void BBWorld();
    Q_INVOKABLE
    QString getID();
    Q_INVOKABLE
    void changeTheme(QString theme);
    Q_INVOKABLE
    void cleanApplication();
    Q_INVOKABLE
    bool CheckInjection(QString wordSearch);
    Q_INVOKABLE
    QByteArray encodeQString(const QString& toEncode) const;
    Q_INVOKABLE
        void inviteUserToDownloadViaBBM();
        Q_INVOKABLE
        void updatePersonalMessage(const QString &message);

private slots:
    void onSystemLanguageChanged();


private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
    bb::platform::bbm::UserProfile * m_userProfile;
        bb::platform::bbm::Context *m_context;
        bb::platform::bbm::MessageService *m_messageService;
        Q_SLOT
        void registrationStateUpdated(
                bb::platform::bbm::RegistrationState::Type state);

};

#endif /* ApplicationUI_HPP_ */
