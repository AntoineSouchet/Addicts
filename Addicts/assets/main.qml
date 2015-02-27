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

import bb.cascades 1.3
import bb.data 1.0
import bb.system 1.0
import org.labsquare 1.0



NavigationPane {
    

    
    id: nav
    Menu.definition: MenuDefinition {        
        actions: [
//            ActionItem {
//                title: "Accueil"
//                imageSource: "asset:///images/ic_home.png"
//                onTriggered: {
//                    myIndicator.start();
//                    dataSource.load();
//                    myIndicator.stop();
//                    nav.navigateTo(firstPage);
//
//                }
//            },
            ActionItem {
                title: "A propos"
                imageSource: "asset:///images/ic_help.png"
                onTriggered: {
                    var page = proposPages.createObject();
                    nav.push(page);
                }
            },
            ActionItem {
                title: "Partager"
                imageSource: "asset:///images/ic_bbm.png"
                onTriggered: {
                    _app.inviteUserToDownloadViaBBM()
                }
            },
            ActionItem {
                title: "Noter"
                imageSource: "asset:///images/ic_add_bookmarks.png"
                onTriggered: {
                    ApplicationUI.BBWorld();
                }
            },
            ActionItem {
                title: "Préférences"
                onTriggered: {
                    var page = prefPages.createObject();
                    nav.push(page);
                }
            }
        ] 
    } 
    
    Page {
        id:firstPage  
        titleBar: 
            TitleBar {
            title : "Addicts"        
        }
        

        Container {
            id: firstContent
            TextField {
            id:searchText
            hintText: "Saissiez votre recherche ici"    
            visible: false

            input {
                submitKey: SubmitKey.Search
                onSubmitted: {
                    var recherche = searchText.text;
                    if (ApplicationUI.CheckInjection(recherche) == false)
                    {
                        var urlSearch = 'http://www.blackberry-10.fr/jsonfile_search.php?query=' + recherche;
                        dataSource.setSource(urlSearch);
                        //dataModel.clear();
                        dataSource.load();
                        seekResearch.title = "Rafraichir"
                        seekResearch.imageSource = "asset:///images/ic_resume.png"
                    }

                }
            }
            }
            
            ActivityIndicator {
                id: myIndicator
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
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
                        
                        content: Container {
                            preferredHeight: if(ListItemData.id != Qt.test) { 120; } else { 350; }



                            layout: StackLayout {
                                orientation: if (ListItemData.id != Qt.test) { LayoutOrientation.LeftToRight } 
                            }
                        ImageArticle {
                                id: imageArticle

                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                urliamge:ListItemData.image
                                titre: ListItemData.nom
                                auteur: if(ListItemData.id != Qt.test) { "" } else { "Rédigé par " + ListItemData.auteur +"." }
                                visible: if(ListItemData.id != Qt.test) { false; } else { true; }
                                }
                        WebImageView {
                                id: imageView
                                url: ListItemData.image

                                scalingMethod: ScalingMethod.AspectFit
                                verticalAlignment: VerticalAlignment.Center
                                leftMargin: 0
                                preferredWidth: 325
                                minWidth: 325
                                maxWidth: 325
                                visible: if(ListItemData.id != Qt.test) { true; } else { false; }
                        }
                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.TopToBottom
                            }
                            Label {
                                id: articleText
                                visible: if(ListItemData.id != Qt.test) { true; } else { false; }
                                multiline: true
                                horizontalAlignment: HorizontalAlignment.Center
                                text: ListItemData.nom
                            }
                            WebView {
                                topMargin: 10;
                                html: '<html><iframe style="border:0px;height:20px;"src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.blackberry-10.fr%2Farticle-' + ListItemData.url + '&width&layout=button_count&action=like&show_faces=true&share=true&height=21&appId=827540957260617"></iframe></html>'
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                //html:"<html>OK</html>"
                                //url: "https://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.blackberry-10.fr%2Farticle-27022015-blackberry-travaille-avec-google-pour-securiser-android&width&layout=button&action=like&show_faces=true&share=true&height=80&appId=827540957260617"
                            }
                        }
                        
                        }
                    }
                ]
                onCreationCompleted: {
                    searchText.visible = false
                } 
                onTriggered: {
                    searchText.visible = false
                    var selectedItem = dataModel.data(indexPath);
                    var page = articlePages.createObject();
                    
                    if (Application.themeSupport.theme.colorTheme.style == 1)
                    {
                    page.contenu = "<body style=\"height: 100%;style='text-align: justify;line-height: 200%;text-justify: inter-word;font-size: 1em;\"><center><img src=\"" + selectedItem.image + "\"></center><span style='color: #2980b9;'><u>Le " + selectedItem.date +" par <b>" + selectedItem.auteur + "</b></span></u><br /><br /><span style='color:black';text-justify: inter-word;text-align: justify;><div style=\"text-align: justify\">" + selectedItem.corps + "</div></span></body>";             
                    }
                    else if (Application.themeSupport.theme.colorTheme.style == 2)
                    {
                    page.contenu = "<body style=\"height: 100%;background-color:black;style='text-align: justify;line-height: 200%;text-justify: inter-word;font-size: 1em;\"><img src=\"" + selectedItem.image + "\"><span style='color: #2980b9;'><u>Le " + selectedItem.date +" par <b>" + selectedItem.auteur + "</b></span></u><br /><br /><span style='color:white';><div style=\"text-align: justify\">" + selectedItem.corps + "</div></span></body>";
                    }
                    page.titlearticle = selectedItem.nom
                    page.titlejson = selectedItem.nom
                    page.urljson = selectedItem.url
//                    page.urlimg = selectedItem.image
                    nav.push(page);
                    
                }
                accessibility.name: "FirstListView"
                onFocusedChanged: {
                    searchText.visible = false
                }
                onScaleYChanged: {
                    searchText.visible = false
                }
                onTouch: {
                    searchText.visible = false
                    
                }
            }    
            
            Label {
                id:articlefirst
                text:"1"
                visible: false
            }
        }
        actions: [                         
           ActionItem {
               id:seekResearch
               title: "Rechercher"
               imageSource: "asset:///images/ic_search.png"
               ActionBar.placement: ActionBarPlacement.Signature
               backgroundColor: Color.create("#BDC3C7")
               onTriggered: {
                   if (seekResearch.title == "Rechercher") 
                   {  
                       searchText.visible = true 
                       searchText.requestFocus();
                   } 
                   else if (seekResearch.title == "Rafraichir")
                   {
                       searchText.visible = false
                       searchText.text = ''
                       dataSource.source = "http://www.blackberry-10.fr/jsonfile_last10.php"
                       myIndicator.start();
                       dataSource.load();
                       myIndicator.stop();
                       nav.navigateTo(firstPage);
                       seekResearch.title = "Rechercher"
                       seekResearch.imageSource = "asset:///images/ic_search.png"
                   }

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
           },

           ActionItem {
               title: "BBM Status"
               imageSource: "asset:///images/ic_edit_profile.png"
               onTriggered: {
                   _app.updatePersonalMessage("Utilise l'application des Addicts")
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
        ComponentDefinition {
            id: articlePages
            source: "articleWebView.qml"
        },
        GroupDataModel {
            id: dataModel
            sortedAscending: false
            property int i;
            grouping: ItemGrouping.ByFullValue
            sortingKeys: ["date","id"]
        },
        SystemToast {
            id: myQmlSearch
            body: "Aucun résultat pour votre recherche"
            onFinished: {
                
            }
        },
        DataSource {
                    id: dataSource
                    source : "http://www.blackberry-10.fr/jsonfile_last10.php"
                    type: DataSourceType.Json
                    remote: true
                    onSourceChanged: {
                        Qt.test = 0;
                        dataModel.clear();
                        load();
                    }
                    
                    onDataLoaded: {
                        Qt.test = 0;
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
                        Qt.test = setMax();
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
