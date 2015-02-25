import bb.cascades 1.2

Page {
    
    titleBar: TitleBar {
        title : "A propos"
    }
    Container {
        topPadding: 30
        leftPadding: 30  
        ImageView {
            imageSource: "asset:///images/Addicts.png"
            accessibility.name: "ImagePropos"
            horizontalAlignment: HorizontalAlignment.Center
        }

        Label {
            text: "Responsable de la publication : Maketheweb
            Contact : contact@blackberry-10.fr"
            multiline: true
        }
        Label {
            text: "<html><b>Retrouvez nous sur :</b></html>"
        }
        Label {
            text:"<html><a href='https://www.facebook.com/AddictsABlackberry10?fref=ts'>Facebook</a></html>";
        }
        Label {
            text:"<html><a href='https://twitter.com/blackberry10_fr'>Twitter</a></html>";
        }
        Label {
            text: "<html><b>Développeurs</b></html>"
            multiline: false
        }
        Label {
            text: "Antoine Souchet"
        }
        Label {
            text: "Antoine Lavigne"
        }
        Label {
            text: "Avec la participation de Steven et Kevin B. ;)"
        }
        Label {
            text: "<html><b>Partager cette application sur </b></html>"
        }
        Button {
            text: "Twitter"
            imageSource: "asset:///icon/128-twitter.png"
            onClicked: {
                ApplicationUI.twitter("Télécharger l'application des Addicts ! http://appworld.blackberry.com/webstore/content/59952277/?lang=fr&countrycode=US&CPID=KNC-kw2112_p13")
            }
        }
        Button {
            text: "Facebook"
            imageSource: "asset:///icon/128-facebook.png"
            onClicked: {
                ApplicationUI.facebook("Télécharger l'application des Addicts ! http://appworld.blackberry.com/webstore/content/59952277/?lang=fr&countrycode=US&CPID=KNC-kw2112_p13")
            }
        }
    }
}
