import QtQuick 2.5
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    RowLayout {
            id: rowLayout
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5

            spacing: 10

            Text {text: qsTr("Имя")}
            TextField {id: fnameField}
            Text {text: qsTr("Фамилия")}
            TextField { id: snameField}
            Text {text: qsTr("НИК")}
            TextField {id: nikField}

            Button {
                text: qsTr("Добавить")

                // Вносим новую запись в базу данных
                onClicked: {
                    database.inserIntoTable(fnameField.text , snameField.text, nikField.text)
                    myModel.updateModel() // И обновляем модель данных с новой записью
                }
            }
        }
}
