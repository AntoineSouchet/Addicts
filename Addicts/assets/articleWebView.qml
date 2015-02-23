import bb.cascades 1.2

Page {
    property alias contenu : webView.html
    property alias titlearticle: titlearticle.title
    property alias titlejson : titleJson.text
    property alias urljson: urlJson.text
    titleBar: TitleBar {
        id: titlearticle
    }
    id: myWebView
    Container {
        ActivityIndicator {
            id: indicatorWeb
            horizontalAlignment: HorizontalAlignment.Center
            minHeight: 100
            minWidth: 100
            accessibility.name: "myIndicator"
        
        }
        Label {
            id:urlJson
            visible: false
            text: ""
        }
        Label {
            id:titleJson
            visible: false
            text: ""
        }

        ScrollView {
            scrollViewProperties {
                scrollMode: ScrollMode.Both
            }
            WebView {
                id: webView
                    onLoadingChanged: {
                        if (loadRequest.status ==  WebLoadStatus.Started ) {
                            indicatorWeb.start();
                            webView.visible = false;
                        }
                        else if (loadRequest.status ==  WebLoadStatus.Succeeded ) {
                            indicatorWeb.stop();
                            webView.visible = true;
                        }
                        else if (loadRequest.status ==  WebLoadStatus.Failed ) {
                            indicatorWeb.stop();
                            webView.html = "<b>Impossible de charger la page, vérifiez votre connection Internet.</b>"
                        }
                    }
               // html: "<body style=\"height: 100%;background-color:black;\"><p><span style='color: #2980b9;'>Sample HTML code with relative height on the body tag</span></p></body>"
            }
            
        }
//        attachedObjects: LayoutUpdateHandler {
//            onLayoutFrameChanged: {
//                webView.preferredHeight = layoutFrame.height;
//            }
//        }
        
    }
    actions: [
        InvokeActionItem {
            ActionBar.placement: ActionBarPlacement.OnBar
            query {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: {
                data = ApplicationUI.encodeQString(titlearticle.title + " http://www.blackberry-10.fr/article-" + urlJson.text + " Partagé via l'application Addicts.");
            }
        }
    ]
}
