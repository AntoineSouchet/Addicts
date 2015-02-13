import bb.cascades 1.2

Page {
    property alias name : nameLabel.text
    property alias description : descriptionLabel.text
    property alias image : imageTeam.imageSource
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        
        Container {
            topPadding: 10
            leftPadding: 50
            
            Label {
                id: nameLabel
                
                textStyle.base: SystemDefaults.TextStyles.BodyText
//                textStyle.color: Color.White
            }
            ImageView {
                id: imageTeam
            }
            Label {
                id: descriptionLabel
                
                textStyle.base: SystemDefaults.TextStyles.SmallText
//                textStyle.color: Color.Gray
            }
        }
    
}
}
