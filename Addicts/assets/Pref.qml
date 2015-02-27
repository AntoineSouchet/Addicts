import bb.cascades 1.3
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
                verticalAlignment: VerticalAlignment.Center
            }
            ToggleButton {
                horizontalAlignment: HorizontalAlignment.Center
                id: toggleButton
                onCheckedChanged: {
                    // Control your task
                    if (checked) {
                        Application.themeSupport.setVisualStyle(VisualStyle.Dark);
                        ApplicationUI.changeTheme("Dark");
                    } else {
                        Application.themeSupport.setVisualStyle(VisualStyle.Bright);
                        ApplicationUI.changeTheme("White");
                    }
                }
                
            }

        Label {
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
                ApplicationUI.cleanApplication();
                cacheToast.show()
            }
        }
    }
    onCreationCompleted: {
        if (Application.themeSupport.theme.colorTheme.style == 2)
        {
            toggleButton.checked = true;
        }
    }
}
