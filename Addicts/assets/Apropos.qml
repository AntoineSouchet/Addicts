import bb.cascades 1.2

Page {
    Container {
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
            text: "<html><b>Propriété intellectuelle :</b></html>" 
            multiline: false 
        }
        Label {
            text: "La reproduction ou représentation, intégrale ou partielle, des pages, des données et de tout autre élément constitutif du présent site, par quelque procédé ou support que ce soit, est interdite et constitue une contrefaçon lorsqu'elle est faite sans l'autorisation expresse de l'éditeur "
            multiline: true
        }
        Label {
            text: "<html><b>Développeur</b></html>"
            multiline: false
        }
        Label {
            text: "<html>Antoine Souchet<br />Antoine Lavigne<br />Steven Kaci</html>"
        }
    }
}
