import bb.cascades 1.2
import bb.system 1.0

Page {
    titleBar: TitleBar {
        title : "Préférences"
    }
    Container {
            topPadding: 80
            Label {
                text : "<html><b>Changer le théme de l'application</b></html>"
                
                horizontalAlignment: HorizontalAlignment.Center
            }
            
        Button {
            imageSource: "asset:///images/ic_select.png"
            
            horizontalAlignment: HorizontalAlignment.Center
            text: "Switcher (10.3 uniquement)"
            verticalAlignment: VerticalAlignment.Center
            // Checks the current theme and then flips the value
            onClicked: {
                if (Application.themeSupport.theme.colorTheme.style == VisualStyle.Bright) {
                    Application.themeSupport.setVisualStyle(VisualStyle.Dark);
                }       
                else {
                    Application.themeSupport.setVisualStyle(VisualStyle.Bright);

                }
            }
        }
        Label {
            topPadding: 60
            topMargin: 60
            horizontalAlignment: HorizontalAlignment.Center
            text: "<html><b>Supprimer le cache de l'application</b></html>"
        }
        Button {   
            text: "Vider"
            horizontalAlignment: HorizontalAlignment.Center
            attachedObjects: [
                SystemToast {
                    id: cacheToast
                    body: "Cache vidé"
                    button.enabled: false
                }   
            ]
            onClicked: {
                cacheToast.show()
            }
        }
    }
}
