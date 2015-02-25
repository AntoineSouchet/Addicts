import bb.cascades 1.3
import org.labsquare 1.0

Page {
    property alias contenu : webView.html
    property alias titlearticle: titlearticle.title
    property alias titlejson : titleJson.text
    property alias urljson: urlJson.text
//    property alias urlimg: imageArticle.url
    
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
//        WebImageView {
//            topMargin: 0
//            bottomMargin: 0
//            id:imageArticle
//            preferredWidth: 1800
//            preferredHeight: 320
//            scalingMethod: ScalingMethod.AspectFit
//        }
        Divider {
            verticalAlignment: VerticalAlignment.Bottom
            horizontalAlignment: HorizontalAlignment.Center          
        }
        ScrollView {
            scrollViewProperties {
                scrollMode: ScrollMode.Vertical
            }
            
            WebView {
                id: webView
                leftMargin: 0
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
                    onNewViewRequested: {
                        //TODO get URL and load navigator
                    }
          }
            
        }    
    }
    actions: [
        InvokeActionItem {
            ActionBar.placement: ActionBarPlacement.Signature
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
