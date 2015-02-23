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


#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <bb/system/InvokeRequest>
#include <bb/system/InvokeManager>

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
    // Create scene document from main.qml asset, the parent is set
    // to ensure the document gets destroyed properly at shut down.
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    // Create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    first = 0;
    qml->setContextProperty("ApplicationUI", this);

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

//void ApplicationUI::setID()
//{
//
//}
