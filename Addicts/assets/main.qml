/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.data 1.0
import bb.system 1.0
import org.labsquare 1.0


NavigationPane {
    

    id: nav
    Menu.definition: MenuDefinition {
        
        
        actions: [
            ActionItem {
                title: "Accueil"
                imageSource: "asset:///images/ic_home.png"
                onTriggered: {
                    myIndicator.start();
                    dataSource.load();
                    myIndicator.stop();
                    nav.navigateTo(firstPage);
                    //nav.po
                }
            },
            ActionItem {
                title: "Préférences"
                onTriggered: {
                    var page = prefPages.createObject();
                    nav.push(page);
                }
            },
            
            ActionItem {
                title: "A propos"
                imageSource: "asset:///images/ic_help.png"
                onTriggered: {
                    var page = proposPages.createObject();
                    nav.push(page);
                }
            },
            ActionItem {
                title: "Noter"
                imageSource: "asset:///images/ic_add_bookmarks.png"
                onTriggered: {
                    ApplicationUI.BBWorld();
                }
            }
        ] 
        
    } 

    Page {
        id:firstPage
        
        titleBar: TitleBar {
            title : "Addicts"
        }



        Container {

            id: firstContent
            
            
            ActivityIndicator {
                id: myIndicator
                horizontalAlignment: HorizontalAlignment.Center
                minHeight: 200
                minWidth: 200
                accessibility.name: "myIndicator"
            }
            Label {
                id:articlefirst
                text:"1"
            }

            
            ListView {
                id:listViewStat
                dataModel: dataModel
                onCreationCompleted: {
                    
                }
                listItemComponents: [


                    ListItemComponent {
                        type: "item"

                        content: Container {

                            
                            Divider {
                                verticalAlignment: VerticalAlignment.Bottom
                                horizontalAlignment: HorizontalAlignment.Center  
                            }
//                            layout: StackLayout {
//                                orientation: LayoutOrientation.LeftToRight
//                            }

                            Label {
                                id:idArticle
                                text:""
                            }
                            WebImageView {
                                url: ListItemData.image
                                id: webImageView

                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center
//                                maxHeight: 150
                                property int i;
                                //minHeight: if(ListItemData.id == dataModel.i) { console.log(ListItemData[0].id); 500 }

//                                minWidth: if(i==0) { i =i +1; 10; } 
//                                maxHeight: if(i==0) { i =i +1; 10; } 
//                                maxWidth: if(i==0) { i =i +1; 10; } 
                            }
                            Label {
                                leftMargin: 5
                                text:"<html><span style='font-size:7;margin-left:5px;'>" + ListItemData.nom + "</span></html>"
                               // multiline: true
                            }
                            Label {
                                horizontalAlignment: HorizontalAlignment.Right
                                text: "<html><span style='color: #2980b9;font-size:5;'><b>Rédigé par " + ListItemData.auteur +".</b></span></html>"
                                
                            }
                            Divider {
                                verticalAlignment: VerticalAlignment.Bottom
                                horizontalAlignment: HorizontalAlignment.Center          
                            }

                        }
                    }
                ]
                onTriggered: {
                    var selectedItem = dataModel.data(indexPath);
                    var page = webPage.createObject();
                    if (Application.themeSupport.theme.colorTheme.style == 1)
                    {
                        page.htmlContent = "<div width='100%' style='text-align: justify;line-height: 200%;text-justify: inter-word;font-size: 1em;'><span style='color: #2980b9;'><u>Le " + selectedItem.date +" par <b>" + selectedItem.auteur + "</b></span></u><br /><br />" + selectedItem.corps + "</div>";
                    
                    }
                    else if (Application.themeSupport.theme.colorTheme.style == 2)
                    {
                    //page.htmlContent = "<div width='100%' style='text-align: justify;line-height: 200%;text-justify: inter-word;font-size: 1em;background-color:black;'><span style='color: #2980b9;'><u>Le " + selectedItem.date +" par <b>" + selectedItem.auteur + "</b></span></u><br /><br /><span style='color:white';>" + selectedItem.corps + "</span></div>";
                        page.htmlContent = "<html><div width='100%' style='background-color:black;'>okXXX</div></html>"
                    }
                    else {
                        page.htmlContent = "<div width='100%' style='text-align: justify;line-height: 200%;text-justify: inter-word;font-size: 1em;'><span style='color: #2980b9;'><u>Le " + selectedItem.date +" par <b>" + selectedItem.auteur + "</b></span></u><br /><br />" + selectedItem.corps + "</div>";
                    }
                   page.titleBar.title = selectedItem.nom
                    page.urlFromJson = selectedItem.url

                   // page.titleFromJson = selectedItem.nom
                    nav.push(page);
                    
                }
                accessibility.name: "FirstListView"
            }    
        }
        actions: [
                            
                            ActionItem {
                                title: "Accueil"
                                imageSource: "asset:///images/ic_home.png"
                                ActionBar.placement: ActionBarPlacement.OnBar
                                onTriggered: {
                                    myIndicator.start();
                                    dataSource.load();
                                    myIndicator.stop();
                                    nav.navigateTo(firstPage);
                                    //nav.po
                                }
                            },
                            ActionItem {
                                title: "Equipes"
                                imageSource: "asset:///images/ic_contact.png"
                                onTriggered: {
                                    var page = teamPages.createObject();
                                    nav.push(page);
                                }
                            },
                            ActionItem {
                                title: "Personalisation"
                                imageSource: "asset:///images/ic_view_image.png"
                                onTriggered: {
                                    var page = wallPages.createObject();
                                    nav.push(page);
                                }
                            }
                        ]
    }
    attachedObjects: [
        ComponentDefinition {
            id: prefPages
            source: "pref.qml"
        },
        ComponentDefinition {
            id: sharePages
            source: "share.qml"
        },
        ComponentDefinition {
            id: teamPages
            source: "team.qml"
        },
        ComponentDefinition {
            id: wallPages
            source: "wall.qml"
        },
        ComponentDefinition {
            id: proposPages
            source: "aPropos.qml"
        },
        GroupDataModel {
            id: dataModel
            sortedAscending: false
            property int i;
            grouping: ItemGrouping.ByFullValue
            sortingKeys: ["date"]
        },
        ComponentDefinition {
            id: webPage     
               
            Page {
                
                property alias htmlContent: detailView.html
                property alias urlFromJson: urlJson.text
                
                titleBar: TitleBar {
                    id:titleBarArticle
                }
                
                Container {

                    ActivityIndicator {
                        id: indicatorWeb
                        horizontalAlignment: HorizontalAlignment.Center
                        minHeight: 100
                        minWidth: 100
                        accessibility.name: "myIndicator"
                        
                    }
                    Label {
                        id:urlJson
                        visible: false
                        text: ""
                    }
                    Label {
                        id:titleJson
                        visible: false
                        text: ""
                    }

                    ScrollView {
                        
                        topPadding: 0
                        leftPadding: 0
                        rightPadding: 0
//                        scrollViewProperties.scrollMode: ScrollMode.Vertical
                            
                        WebView {
                            
                            id: detailView; 
                            leftPadding: 0
                            rightPadding: 0
                            
                            onLoadingChanged: {
                                if (loadRequest.status ==  WebLoadStatus.Started ) {
                                    indicatorWeb.start();
                                    detailView.visible = false;
                                }
                                else if (loadRequest.status ==  WebLoadStatus.Succeeded ) {
                                    indicatorWeb.stop();
                                    detailView.visible = true;
                                }
                                else if (loadRequest.status ==  WebLoadStatus.Failed ) {
                                    indicatorWeb.stop();
                                    detailView.html = "<b>Impossible de charger la page, vérifiez votre connection Internet.</b>"
                                }
                            }
                            accessibility.name: "WebView"
                        }
                        accessibility.name: "ScrollView"

                    }
                    
                }
                actions: [
                    InvokeActionItem {
                        ActionBar.placement: ActionBarPlacement.OnBar
                        query {
                            mimeType: "text/plain"
                            invokeActionId: "bb.action.SHARE"
                        }
                        onTriggered: {
                            data = ApplicationUI.encodeQString(titleBarArticle.title + " http://www.blackberry-10.fr/article-" + urlJson.text + " Partagé via l'application Addicts.");
                        }
                    }
                ]
//                actions: [
//                    ActionItem {
//                        title: "Partager"
//                        imageSource: "asset:///images/ic_share.png"
//                        ActionBar.placement: ActionBarPlacement.OnBar
//                        onTriggered: {
//
//                            var page = sharePages.createObject();
//                            page.sharingUrl = urlJson.text
//                            page.previewWeb = detailView.html
//                            nav.push(page);
//                        }
//                    }
//                ]

            }
            
        },
        DataSource {
                    id: dataSource
                    source : "http://www.blackberry-10.fr/jsonfile_last10.php"
                    type: DataSourceType.Json
                    remote: true
                    onDataLoaded: {
                        
                        dataModel.clear(); 
                        var Max = 0;
                        
                        function setMax()
                        {
                            var i = 0;
                            var idFirstArticle = 0;
                            while (i < 10)
                            {
                                if (i == 0)
                                {
                                    idFirstArticle = data[i].id
                                }
                                i = i + 1;
                            }
                            return idFirstArticle;
                        }
                        //monIdArticle = setMax();
                        articlefirst.text = setMax();

                        dataModel.insertList(data);
                       
                        myIndicator.stop();
                    }
        }   
    ]
    onPopTransitionEnded: {
        page.destroy();
    }
    onCreationCompleted: {
        myIndicator.start();

        dataSource.load();
    }
}
