import bb.cascades 1.2

Page {
    property alias itemPageTitle: titlebar.title
    property alias titleArticle: titleArticle.text
    property alias imageArticle: imageArticle.imageSource
    property alias corpsArticle: corpsArticle.text
    
    titleBar: TitleBar {
        id: titlebar
    }
    Container {
        Label {
            id:titleArticle
            multiline: true
        }
        ImageView {
            id: imageArticle
        }
        
        Label {
            id:corpsArticle
            multiline: true
        }

    }
}
