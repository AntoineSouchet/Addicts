import bb.cascades 1.2
import bb.platform 1.0

Page {
    
    titleBar: TitleBar {
        title : "Personnalisation"
    }
    Container {
        topPadding: 20
        background: Color.Black
        attachedObjects: [
            HomeScreen {
                id: myHomeScreen
            }
        ]
        
        ImageView {
            topPadding: 20
            imageSource: "asset:///wallpapers/wall_1.jpg"
            maxHeight: 250
            maxWidth: 250
            horizontalAlignment: HorizontalAlignment.Center
        }
        Button {
            text:"Mettre en fond d'écran"
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                myHomeScreen.setWallpaper("asset:///newWallpaper.jpg");
            }
        }
        
        ImageView {
            imageSource: "asset:///wallpapers/wall_2.jpg"
            maxHeight: 250
            maxWidth: 250
        }
        
    }
}
