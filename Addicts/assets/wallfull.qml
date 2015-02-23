import bb.cascades 1.2
import bb.platform 1.0
import bb.system 1.0

Page {
    property alias imagesource : fullwall.imageSource
    Container {
        background: Color.Black
        ImageView {
            id: fullwall
            
        }
        attachedObjects: [
            HomeScreen {
                id: myHomeScreen
            }
        ]
    }
    actions: [
        ActionItem {
            title: "Mettre en fond d'écran"
            imageSource: "asset:///images/ic_view_image.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            attachedObjects: [
                SystemToast {
                    id: myQmlToast
                    body: "Fond écran modifié"
                    onFinished: {
                        myHomeScreen.setWallpaper(fullwall.imageSource);
                    }
                },
                SystemDialog {
                    id: myQmlDialog
                    title: "Changer de fond d'écran"
                    body: "Cahnger le fond d'écran de votre Blackberry ?"
                    onFinished: {
                        if (myQmlDialog.result == 
                        SystemUiResult.ConfirmButtonSelection)
                            myQmlToast.show();
                    }
                
                }
            ]
            onTriggered: { 
                myQmlDialog.show() 
            }
        }
    ]
    
}
