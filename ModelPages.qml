import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


Page{
    id:onePage
    property alias bgColor: backgroundColorPage.color
    signal backClicked();
    anchors.fill: parent

    background: Rectangle{
        id:backgroundColorPage
    }

    header: Rectangle{
        id:headerPage
        color:bgColor
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right


        Button{
            id:backButton
            text: "<<<"
            height: 30
            width: 50
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 15

            onClicked: {
                onePage.backClicked();

            }
        }
    }
}
