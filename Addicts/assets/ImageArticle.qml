import bb.cascades 1.2
import org.labsquare 1.0
Container {
    property alias urliamge : imageView.url
    property alias titre : textArea.text
    property alias auteur : textAuteur.text
    
    layout: AbsoluteLayout {}

    WebImageView {
        id: imageView
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        preferredWidth: 1500
        minHeight: 300
        maxHeight: 310
        scalingMethod: ScalingMethod.AspectFill

    }
    Label {
        id: textArea
        multiline: false
        
        textStyle {
            fontWeight: FontWeight.Bold
            color: Color.create ("#FFFFFF")
        }
        
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 250
            positionX: 12
        }
    }
    Label {
        id: textAuteur
        multiline: false
        
        textStyle {
            fontWeight: FontWeight.Bold
            color: Color.create ("#FFFFFF")
        }
        
        layoutProperties: AbsoluteLayoutProperties {
            positionY: 220
            positionX: 12
        }
    }
}
