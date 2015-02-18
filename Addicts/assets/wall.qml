import bb.cascades 1.2



Page {
    
    titleBar: TitleBar {
        title : "Personnalisation"
    }
    Container {
        topPadding: 20
        ListView {
            
            dataModel: XmlDataModel {
                source: "model/wall.xml"
            } 
            listItemComponents: [
                ListItemComponent {
                    type: "header"
                    Header {
                        title: ListItemData.title
                    }
                },
                ListItemComponent {
                    type: "item"
                    
                    StandardListItem {
                        title: ListItemData.title
                        imageSource: ListItemData.image
                    }
                }
            
            ]
            onTriggered: {
                var selectedItem = dataModel.data(indexPath); 
                var page = fullPages.createObject();
                page.imagesource = selectedItem.image
                nav.push(page);
            }
        }     
    }
    actions: [
        ActionItem {
            title: "Accueil"
            imageSource: "asset:///images/ic_home.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                nav.navigateTo(firstPage);
                //nav.po
            }
        }
    ]
    attachedObjects: [
        ComponentDefinition {
            id: fullPages
            source: "wallfull.qml"
        }]
}


