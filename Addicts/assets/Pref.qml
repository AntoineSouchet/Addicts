import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        title : "Préférences"
    }
    Container {
            topMargin: 80
            Label {
                text : ""
                topMargin: 80
            }
        Button {
            topMargin: 80
            topPadding: 80
            leftMargin: 10
            rightMargin: 10
            text: "Changer théme (uniqument 10.3)"
            imageSource: "asset:///images/ic_select.png"
            
            horizontalAlignment: HorizontalAlignment.Center

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
        Button {   
            text: "Vider cache application"
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                if (Application.themeSupport.theme.colorTheme.style == VisualStyle.Bright) {
                    Application.themeSupport.setVisualStyle(VisualStyle.Dark);
                }       
                else {
                    Application.themeSupport.setVisualStyle(VisualStyle.Bright);
                }
            }
        }
    }
}
