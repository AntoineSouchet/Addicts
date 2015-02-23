import bb.cascades 1.2
import org.labsquare 1.0
Container {
    property alias urliamge : imageView.url
    property alias titre : textArea.text
    
    layout: AbsoluteLayout {}
    // The postcard image
    WebImageView {
        id: imageView
        //url: 'http://www.blackberry-10.fr/images/upload2/blackberry-20150222154438.jpg'
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        //preferredWidth: 1800
        preferredWidth: 1400
       scalingMethod: ScalingMethod.AspectFill

//        layoutProperties: AbsoluteLayoutProperties {
//            positionX: 14
//            positionY: 14
//        }
    }

    Label {
        id: textArea
        //text: "Greetings from... "
//        preferredWidth: 1800
//        preferredHeight: 200
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
}
