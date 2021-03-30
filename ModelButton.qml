import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

Rectangle{
    id:oneButton
    height: 120
    width: 230
    property alias backgroungRectColor: oneButton.color
    property alias actionButtonText: actionButton.text;
    signal actionClicked();


    color: "#0d7377"


    Button{
        id:actionButton
        anchors.fill: parent


        font.pixelSize: 25
        background: Rectangle{
            color: backgroungRectColor
        }

        onClicked: {
             oneButton.actionClicked();
        }


    }
}
