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

#include "applicationui.hpp"
#include "WebImageView.h"
#include "Preferences.h"

#include <bb/system/SystemDialog>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <bb/system/InvokeRequest>
#include <bb/system/InvokeManager>
#include <bb/cascades/Theme>
#include <bb/cascades/ThemeSupport>

using namespace bb::cascades;
using namespace bb::system;


ApplicationUI::ApplicationUI() :
        QObject()
{
    // prepare the localization
    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new LocaleHandler(this);

    bool res = QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()));
    // This is only available in Debug builds
    Q_ASSERT(res);
    // Since the variable is not used in the app, this is added to avoid a
    // compiler warning
    Q_UNUSED(res);

    // initial load
    onSystemLanguageChanged();
    qmlRegisterType<WebImageView>("org.labsquare", 1, 0, "WebImageView");
    Preferences *prefs = new Preferences();
    prefs->createSQL();
   QString theme =  prefs->getTheme();
   if (theme == "Dark")
   {
       Application::instance()->themeSupport()->setVisualStyle(VisualStyle::Dark);
   }
   else
   {
       Application::instance()->themeSupport()->setVisualStyle(VisualStyle::Bright);
   }

    // Create scene document from main.qml asset, the parent is set
    // to ensure the document gets destroyed properly at shut down.
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml->setContextProperty("_app", this);

    // Create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    first = 0;
    qml->setContextProperty("ApplicationUI", this);
    // Creates the property map and then exposes it for use in QML
    QDeclarativePropertyMap* propertyMap = new QDeclarativePropertyMap;
    propertyMap->insert("theme", theme);
    qml->setContextProperty("Preferences", propertyMap);

    m_context = new bb::platform::bbm::Context(
            //UUID was generated at random for this sample
            //BE SURE TO USE YOUR OWN UNIQUE UUID. You can gerneate one here: http://www.guidgenerator.com/
            QUuid("15e4be70-fd36-11e2-b778-0800200c9a66"));
    if (m_context->registrationState()
            != bb::platform::bbm::RegistrationState::Allowed) {
        connect(m_context,
                SIGNAL(registrationStateUpdated (bb::platform::bbm::RegistrationState::Type)),
                this,
                SLOT(registrationStateUpdated (bb::platform::bbm::RegistrationState::Type)));
        m_context->requestRegisterApplication();
    }
    // Set created root object as the application scene
    Application::instance()->setScene(root);

}

QByteArray ApplicationUI::encodeQString(const QString& toEncode) const {
    return toEncode.toUtf8();
}

void ApplicationUI::twitter(QString url)
{
    InvokeManager invokeManager;
    InvokeRequest request;

    request.setTarget("Twitter");

    request.setAction("bb.action.SHARE");

    request.setUri(QUrl(url));
    invokeManager.invoke(request);
}


void ApplicationUI::BBWorld()
{
    //appworld://content/3664
    InvokeManager invokeManager;
    InvokeRequest request;

    request.setTarget("sys.appworld");
    request.setAction("bb.action.OPEN");
    request.setUri(QUrl("appworld://content/59952277"));
    invokeManager.invoke(request);
}

void ApplicationUI::facebook(QString url)
{
    InvokeManager invokeManager;
    InvokeRequest request;

    request.setTarget("Facebook");

    request.setAction("bb.action.SHARE");

    request.setUri(QUrl(url));
    invokeManager.invoke(request);
}

void ApplicationUI::facebookOpen()
{
    InvokeManager invokeManager;
    InvokeRequest request;

    QVariantMap payload;

    payload["object_type"] = "page";
    payload["object_id"] = "169666339847181";  // BlackBerry NA Facebook page

    request.setMetadata(payload);
    request.setTarget("com.rim.bb.app.facebook");

    request.setAction("bb.action.OPEN");


    invokeManager.invoke(request);
}

void ApplicationUI::TwitterOpen()
{
    InvokeManager invokeManager;
    InvokeRequest request;

    request.setTarget("com.twitter.urihandler");
    request.setAction("bb.action.VIEW");
    request.setUri("twitter:connect:blackberry10_fr");

    invokeManager.invoke(request);
}

void ApplicationUI::BBMOpen()
{
    //sys.bbm.channels.card.previewer
    InvokeManager invokeManager;
    InvokeRequest request;

    request.setTarget("com.twitter.urihandler");
    request.setAction("bb.action.OPENBBMCHANNEL");
    request.setUri("bbmc:C000AB2D5");

    invokeManager.invoke(request);
}

void ApplicationUI::browser(QString url)
{
    InvokeManager invokeManager;
    InvokeRequest request;

    request.setTarget("sys.browser");

    request.setAction("bb.action.OPEN");

    request.setUri(QUrl(url));
    invokeManager.invoke(request);
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);

    QString locale_string = QLocale().name();
    QString file_name = QString("Addicts_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}

QString ApplicationUI::getID()
{
    return "1";
}

void ApplicationUI::inviteUserToDownloadViaBBM() {
    if (m_context->registrationState()
            == bb::platform::bbm::RegistrationState::Allowed) {
        m_messageService->sendDownloadInvitation();
    } else {
        SystemDialog *bbmDialog = new SystemDialog("OK");
        bbmDialog->setTitle("BBM Connection Error");
        bbmDialog->setBody(
                "BBM is not currently connected. Please setup / sign-in to BBM to remove this message.");
        connect(bbmDialog, SIGNAL(finished(bb::system::SystemUiResult::Type)),
                this, SLOT(dialogFinished(bb::system::SystemUiResult::Type)));
        bbmDialog->show();
        return;
    }
}

void ApplicationUI::updatePersonalMessage(const QString &message) {
    if (m_context->registrationState()
            == bb::platform::bbm::RegistrationState::Allowed) {
        m_userProfile->requestUpdatePersonalMessage(message);
    } else {
        SystemDialog *bbmDialog = new SystemDialog("OK");
        bbmDialog->setTitle("BBM Connection Error");
        bbmDialog->setBody(
                "BBM is not currently connected. Please setup / sign-in to BBM to remove this message.");
        connect(bbmDialog, SIGNAL(finished(bb::system::SystemUiResult::Type)),
                this, SLOT(dialogFinished(bb::system::SystemUiResult::Type)));
        bbmDialog->show();
        return;
    }
}
void ApplicationUI::registrationStateUpdated(
        bb::platform::bbm::RegistrationState::Type state) {
    if (state == bb::platform::bbm::RegistrationState::Allowed) {
        m_messageService = new bb::platform::bbm::MessageService(m_context,
                this);
        m_userProfile = new bb::platform::bbm::UserProfile(m_context, this);
    } else if (state == bb::platform::bbm::RegistrationState::Unregistered) {
        m_context->requestRegisterApplication();
    }
}


void ApplicationUI::changeTheme(QString theme)
{
    Preferences *prefs = new Preferences();
    prefs->saveSQL(theme);
}

void ApplicationUI::cleanApplication()
{
    Preferences *prefs = new Preferences();
    prefs->DeleteSQL();
}

bool ApplicationUI::CheckInjection(QString wordSearch)
{
   bool check;
   check = wordSearch.contains("Select");
   check = wordSearch.contains("Insert");
   check = wordSearch.contains("Delete");
   check = wordSearch.contains("Create");
   check = wordSearch.contains("Drop");
   check = wordSearch.contains("Alter");
   check = wordSearch.contains("\\");
   check = wordSearch.contains("/");
   check = wordSearch.contains("*");
   check = wordSearch.contains("from");
   check = wordSearch.contains("where");
   return check;
}
//void ApplicationUI::setID()
//{
//
//}
