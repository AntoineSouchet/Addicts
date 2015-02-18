import bb.cascades 1.2
import bb.data 1.0
import bb.system 1.0


Page {
    titleBar: TitleBar {
        title : "Equipe des Addicts"
    }
    content: Container {
        
        ListView {
      
            dataModel: XmlDataModel {
                source: "model/team.xml"
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
                myQmlDialog.title = selectedItem.title
                myQmlDialog.body = selectedItem.subtitle  
                myQmlDialog.show();  
            }
        }
        attachedObjects: [
            SystemDialog {
                            id: myQmlDialog
                            title: ""
                            body: ""
            }
        ]      
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
}