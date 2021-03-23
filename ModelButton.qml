import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

Rectangle{
    id:oneButton
    height: 70
    width: 130

    property alias actionButtonText: actionButton.text;
    signal actionClicked();



    Button{
        id:actionButton
        anchors.fill: parent
        background: Rectangle{
            color: "red"
        }

        onClicked: {
             oneButton.actionClicked();
        }


    }
}
