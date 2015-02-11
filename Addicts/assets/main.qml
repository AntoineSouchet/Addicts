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


NavigationPane {
    id: nav
    Page {
        titleBar: TitleBar {
            title : "Addicts à Blackberry 10"
        }
        
        Container {
            ActivityIndicator {
                id: myIndicator
                horizontalAlignment: HorizontalAlignment.Center
                minHeight: 200
                minWidth: 200
                accessibility.name: "myIndicator"
            }
            ListView {
                id:listViewStat
                dataModel: dataModel
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        
                        StandardListItem {      
      
                            title: if (ListItemData.categorie == "actualites") { "<html><span style='color: #2980b9;'>Actualités</span></html>" } 
                            else if (ListItemData.categorie == "ecosysteme") { "<html><span style='color: #2980b9;'>EcoSysteme</span></html>" }
                            else if (ListItemData.categorie == "terminaux") { "<html><span style='color: #2980b9;'>Terminaux</span></html>" }
                            else if (ListItemData.categorie == "applications") { "<html><span style='color: #2980b9;'>Applications</span></html>" }
                            else if (ListItemData.categorie == "opérateurs") { "<html><span style='color: #2980b9;'>Opérateurs</span></html>" }
                            else ( "<html><span style='color: #2980b9;'>" + ListItemData.categorie + "</span></html>")
                            description: ListItemData.nom
                            status: ListItemData.date  

                        }  
                    }
                ]
                onTriggered: {
//                    var selectedItem = dataModel.data(indexPath);
//                    var UrlCall = "http://www.blackberry-10.fr/json_billet.php?article=" + selectedItem.id;
//                    var page = detailPage.createObject();
//                    page.itemPageTitle = selectedItem.categorie + " le " + selectedItem.date +" par " + selectedItem.auteur
//                    //page.titleArticle = "<html><center><b>" + selectedItem.nom + "</b></center></html>"
//                   //  page.imageArticle = Application.ge
//                   // page.corpsArticle = "<html>" + selectedItem.corps + "</html>"
//                   var corps = selectedItem.corps.toString();   
//                    page.corpsArticle = "<html><b>" + selectedItem.corps + "</b></html>"
//                    nav.push(page);
                    var selectedItem = dataModel.data(indexPath);
                    var page = webPage.createObject();
                    page.htmlContent = "<div width='100%' style='text-align: justify;line-height: 200%;text-justify: inter-word;font-size: 1em;'><span style='color: #2980b9;'><u>Le " + selectedItem.date +" par <b>" + selectedItem.auteur + "</b></span></u><br /><br />" + selectedItem.corps + "</div>";
                    page.titleBar.title = selectedItem.nom
                    nav.push(page);
                    
                }
                accessibility.name: "FirstListView"
            }    
        }
        actions: [
            ActionItem {
                title: "Rafraichir"
                imageSource: "asset:///images/ic_resume.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    myIndicator.start();
                    dataSource.load();
                    myIndicator.stop();
                }
            },   
            ActionItem {
                title: "Préférences"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    var page = prefPages.createObject();
                    nav.push(page);
                }
            } , 
//            TODO community/personnalisation menu (background image, BBM, FB)
//            ActionItem {
//                 title: "Outils"
//                 //TODO ADD IMAGE SOURCE
//                 ActionBar.placement: ActionBarPlacement.OnBar
//                 onTriggered: {
//                     var page = wallPages.createObject();
//                     nav.push(page);
//                 }
//                    
//            }, 
            ActionItem {
                title: "A propos"
                imageSource: "asset:///images/ic_help.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    var page = proposPages.createObject();
                    nav.push(page);
                }
            }  
        ]
    }
    attachedObjects: [
        ComponentDefinition {
            id: prefPages
            source: "Pref.qml"
        },
        ComponentDefinition {
            id: wallPages
            source: "wall.qml"
        },
        ComponentDefinition {
            id: proposPages
            source: "Apropos.qml"
        },
        ComponentDefinition {
            id: detailPage
            source: "ItemPage.qml"
        },
        GroupDataModel {
            id: dataModel
            sortedAscending: false
            grouping: ItemGrouping.ByFullValue
        },
        ComponentDefinition {
            id: webPage
            Page {
                property alias htmlContent: detailView.html
                titleBar: TitleBar {

                }
                Container {
                    ActivityIndicator {
                        id: indicatorWeb
                        horizontalAlignment: HorizontalAlignment.Center
                        minHeight: 100
                        minWidth: 100
                        accessibility.name: "myIndicator"
                        
                    }
                    ScrollView {
                        topPadding: 10
                        leftPadding: 30
                        rightPadding: 30
                        scrollViewProperties.scrollMode: ScrollMode.Vertical
                        WebView {
                            id: detailView; 
                            leftPadding: 30
                            rightPadding: 30
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
            }
        },
        DataSource {
                    id: dataSource
                    source : "http://www.blackberry-10.fr/jsonfile_last10.php"
                    type: DataSourceType.Json
                    remote: true
                    onDataLoaded: {
                        dataModel.clear();
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
