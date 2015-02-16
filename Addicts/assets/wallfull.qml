import bb.cascades 1.2
import bb.platform 1.0


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
        Button {
            text:"Mettre en fond d'écran"
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                myHomeScreen.setWallpaper(fullwall.imageSource);
            }
        }
    }
}
