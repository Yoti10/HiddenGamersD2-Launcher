import QtQuick 2.12

Item {
    id: settingsDelegate
    property bool deleteHovered: false

    width: parent.width
    height: 50

    // Left active indicator border.
    Rectangle {
        color: settingsDelegate.ListView.isCurrentItem ? "#ab4432" : "#57555e"
        width: 3
        height: parent.height
        anchors.left: parent.left
    }

    // Name and location.
    Item {
        height: parent.height
        width: 200

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.topMargin: 10

        Title {
            color: settingsDelegate.ListView.isCurrentItem ? "#fff" : "#bababa"
            anchors.top: parent.top
            text: getName()
            font.pixelSize: 14
            anchors.topMargin: 5
        }
    }

    // Mods.
    Item {
        height: 25
        width: 60
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 28

        Row {
            spacing: 2
            layoutDirection: Qt.RightToLeft
            width: parent.width

            // HD circle.
            Item { 
                visible: (model.hd_version != "ninguno")
                width: 25
                height: 25
                
                SText {
                    anchors.centerIn: parent
                    text: "HD"
                    font.pixelSize: 10
                    font.bold: true
                }
            }

            // Maphack circle.
            Item {
                visible: (model.maphack_version != "ninguno")
                width: 25
                height: 25
                
                SText {
                    anchors.centerIn: parent
                    text: "MH"
                    font.pixelSize: 10
                    font.bold: true
                }
            }
        }
    }

    // Delete button.
    Image {
        id: deleteIcon
        height: 16
        width: 16
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 5
        fillMode: Image.Pad
        source: "assets/icons/bin.png"
        opacity: deleteHovered ? 1.0 : 0.5

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                settings.deleteGame(model.id)
            }
            onEntered: {
                deleteHovered = true
            }
            onExited: {
                deleteHovered = false
            }
        }
    }

    Separator{
        color: "#21211f"
    }

    MouseArea {
        id: mousearea
        anchors.top: parent.top
        anchors.left: parent.left
        width: (parent.width * 0.90)
        height: parent.height
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            settingsDelegate.ListView.view.currentIndex = index;
        }
    }

    function getName() {
        var path = model.location
        var parts = path.split("/")
        
        var name = parts[parts.length - 1]
        if(name == "") {
            name = "Nuevo juego"
        }

        return name
    }
}
