import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Popup {
    id: patchPopup

    property bool errored: false

    modal: true
    focus: true
    width: 850
    height: 500
    margins: 0
    padding: 0
    
    anchors.centerIn: root
    closePolicy: Popup.NoAutoClose

    Overlay.modal: Item {
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.8
        }
    }

    Rectangle {
        color: "#0f0f0f"
        border.color: "#000000"
        border.width: 1
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 20
		    anchors.leftMargin: 20
		    anchors.rightMargin: 20
            anchors.bottomMargin: 20
            
            Title {
                text: "ACCIONES DEL PARCHE"
                Layout.alignment: Qt.AlignLeft
                height: 40
                font.pixelSize: 18
                font.bold: true
            }

            // Custom separator.
            Rectangle {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 1
                color: "#161616"
                opacity: 0.7
                Layout.alignment: Qt.AlignLeft
            }

            // Header.
            Item {
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 40

                Row {
                    id: header
                    height: 40
                    Layout.alignment: Qt.AlignBottom

                    TableCell {
                        width: patchFileList.width * 0.20
                        height: parent.height
                        content: "Nombre"
				    }

                    TableCell {
                        width: patchFileList.width * 0.20
                        height: parent.height
                        content: "Instalar"
				    }

                    TableCell {
                        width: patchFileList.width * 0.20
                        height: parent.height
                        content: "CRC Local"
                    }

                    TableCell {
                        width: patchFileList.width * 0.20
                        height: parent.height
                        content: "CRC Remoto"
                    }

                    TableCell {
                        width: patchFileList.width * 0.20
                        height: parent.height
                        content: "Accion"
                    }
                } 
            }

             ListView {
                id: patchFileList
                spacing: 0
                clip: true

                Layout.alignment: Qt.AlignTop
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: 350

                // Enable scroll.
                interactive: true

                model: diablo.patchFiles
                delegate: PatchFileDelegate{}
            }
        }

         PlainButton {
            id: closeButton
            label: "CERRAR"
            width: 100
            height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -25
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: patchPopup.close()
        }
    }
}
