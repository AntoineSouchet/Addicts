import bb.cascades 1.2

Page {
    property alias sharingUrl: sharingUrl.text
    property alias previewWeb: previewWeb.html
    titleBar: TitleBar {
        title : "Partager"
    }
    
    Container {

        horizontalAlignment: HorizontalAlignment.Center
        Label {
            id: sharingUrl
            visible: false
        }
        WebView {
            id:previewWeb
            maxHeight: 250
        }
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text:"Partager cet article via : "
        }
        Button {
            horizontalAlignment: HorizontalAlignment.Center
            imageSource: "asset:///icon/128-facebook.png"
            text: "Facebook"
            onClicked: {
                ApplicationUI.facebook("http://www.blackberry-10.fr/article-" + sharingUrl.text)
            }
        }
        Button {
            horizontalAlignment: HorizontalAlignment.Center
            imageSource: "asset:///icon/128-twitter.png"
            text: "Twitter"
            onClicked: {
                ApplicationUI.twitter("http://www.blackberry-10.fr/article- " + sharingUrl.text)
            }
        }
    }
}
