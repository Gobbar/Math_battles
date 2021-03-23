import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


ApplicationWindow {
    id:wind
    visible: true
    color: "#55ffff"
    width: 700
    height: 1000
    title: qsTr("BestPrilogenieInTheWorld")
    Button{
        onClicked: database.showData()
    }

    property int wh: wind.height
    property int ww: wind.width

    StackView{
        id:allPages
        anchors.fill:parent
        initialItem: startMenu

    }

    ModelPages {
        id:startMenu
        bgColor: "#ff0000"
        header.visible: false

        ModelButton {
            id: toStartBattle
            x:ww/4
            y:wh/4
            actionButtonText: "Start_Battle"
            onActionClicked: {
                allPages.push(battle);
            }

        }

        ModelButton {
            id: toRating
            x:ww/4
            y:wh/4 + 100
            actionButtonText: "My_Raiting"
            onActionClicked: {
                allPages.push(rating);
            }
        }

        ModelButton {
            id: toSettings
            x:ww/4
            y:wh/4 + 200
            actionButtonText: "My_Settings"
            onActionClicked: {
                allPages.push(settings);
            }
        }

        ModelButton {
            id: toInfo
            x:ww/4
            y:wh/4 + 300
            actionButtonText: "Infotmation"
            onActionClicked: {
                allPages.push(info);
            }
        }
    }

    ModelPages {
        id:battle
        visible: false
        bgColor: "#00ff00"
        onBackClicked: {
            allPages.pop(startMenu)
        }

        ModelButton {
            id: toMission1
            x:ww/4
            y:wh/4
            actionButtonText: "Start_Mission_1"
            onActionClicked: {
                allPages.push(mission1);
            }

        }
        ModelButton {
            id: toMission2
            x:ww/4 + 150
            y:wh/4
            actionButtonText: "Start_Mission_2"
            onActionClicked: {
                allPages.push(mission2);
            }

        }

    }

    ModelPages {
        id:rating
        visible: false
        bgColor: "#0000ff"
        onBackClicked: {
            allPages.pop(startMenu)
        }
        Rectangle{
            id:raiting_box
            width: ww - 100
            height: wh - 100
            anchors.centerIn: parent
            Text{
                id: raiting_text
                font.pixelSize: 20
                text: qsTr("Здесь будет \n рейтинг по \n заданиям")
            }

        }
    }

    ModelPages {
        id:settings
        visible: false
        bgColor: "#f0f0f0"
        onBackClicked: {
            allPages.pop(startMenu)
        }
        Rectangle{
            id: settings_box
            width: ww - 100
            height: wh - 100
            anchors.centerIn: parent
            CheckBox{
                text: qsTr("Показывать решение ")
                checked: true
            }

        }
    }

    ModelPages {
        id:info
        visible: false
        bgColor: "#ff00ff"
        onBackClicked: {
            allPages.pop(startMenu)
        }

        Rectangle{
            width: 400
            height: 400
            anchors.centerIn: parent


            Text {
                id: creators_text
                font.pixelSize: 20
                text: qsTr(" Это приложение сождано для помощи \n  учителям, проверяющим вторую \n часть экзаменационных работ \n в формате ЕГЭ. \n \n  Создатели: \n   Дербина Полина \n   Дорофеев Иван \n   Казимиров Алексей")
            }

        }
    }

    //in battle
    ModelPages{
        id:mission1
        visible: false
        bgColor: "#0faaf0"
        height: wh / 4
        width: ww / 4
        anchors.left: parent.left
        anchors.top: parent.top
        onBackClicked: {
            allPages.pop(battle)
        }

    }

    ModelPages{
        id:mission2
        visible: false
        bgColor: "#ffaaf0"
        height: wh / 4
        width: ww / 4
        anchors.left: parent.left
        anchors.top: parent.top
        onBackClicked: {
            allPages.pop(battle)
        }

    }


}
