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
        height: 80
        anchors.left: parent.left
        anchors.right: parent.right
        z: 5



        Button{
            id:backButton
            text: "<<"
            font.pixelSize: 30
            height: 50
            width: 75
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 15

            background: Rectangle{
                color: "#0e9377"
                radius: 20

            }

            onClicked: {
                onePage.backClicked();

            }
        }
    }
}
