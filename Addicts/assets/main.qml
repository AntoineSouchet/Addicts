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
                            title: propertyMap.name
                            description: ListItemData.nom
                            status: ListItemData.date  
                        }  
                    }
                ]
                onTriggered: {
                    var selectedItem = dataModel.data(indexPath);
                    var UrlCall = "http://www.blackberry-10.fr/json_billet.php?article=" + selectedItem.id;
                    var page = detailPage.createObject();
                    page.itemPageTitle = selectedItem.categorie + " le " + selectedItem.date +" par " + selectedItem.auteur
                    page.titleArticle = selectedItem.nom
                  //  page.imageArticle = Application.ge
                   // page.corpsArticle = "<html>" + selectedItem.corps + "</html>"
                    page.corpsArticle = "<html><b>" + selectedItem.corps + "</b></html>"
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
            grouping: ItemGrouping.None
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
