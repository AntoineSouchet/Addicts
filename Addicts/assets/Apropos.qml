import bb.cascades 1.2

Page {
    
    titleBar: TitleBar {
        title : "A propos"
    }
    Container {
//        background: back.imagePaint
//        attachedObjects: [
//            ImagePaintDefinition {
//                id: back
//                repeatPattern: RepeatPattern.XY
//                imageSource: "asset:///images/background.png"
//            }
//        ]
        topPadding: 30
        leftPadding: 30  
        ImageView {
            imageSource: "asset:///images/Addicts.png"
            accessibility.name: "ImagePropos"
            horizontalAlignment: HorizontalAlignment.Center
        }

        Label {
            text: "Responsable de la publication : Maketheweb
            Contact : contact@blackberry-10.fr"
            multiline: true
        }
        Label {
            text: "<html><b>Propriété intellectuelle :</b></html>" 
            multiline: false 
        }
        Label {
            text: "La reproduction ou représentation, intégrale ou partielle, des pages, des données et de tout autre élément constitutif de la présente application, par quelque procédé ou support que ce soit, est interdite et constitue une contrefaçon lorsqu'elle est faite sans l'autorisation expresse de l'éditeur "
            multiline: true
        }
        Label {
            text: "<html><b>Développeurs</b></html>"
            multiline: false
        }
        Label {
            text: "Antoine Souchet"
        }
        Label {
            text: "Antoine Lavigne"
        }
    }
}
