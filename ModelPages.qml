import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


Page{
    id:onePage
    property alias bgColor: backgroundColorPage.color
    bgColor: "#323232"
    signal backClicked();
    anchors.fill: parent

    background: Rectangle{
        id:backgroundColorPage
    }

    header: Rectangle{
        id:headerPage
        color:bgColor
        height: 160
        anchors.left: parent.left
        anchors.right: parent.right
        z: 5


        Button{
            id:backButton
            text: "<<<"
            font.pixelSize: 60
            height: 100
            width: 140
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 30

            background: Rectangle{
                color: "#111111"
            }

            onClicked: {
                onePage.backClicked();

            }
        }
    }
}
