import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


ApplicationWindow {
    id:wind
    visible: true
    color: "#000000"
    width: 700
    height: 1000
    title: qsTr("BestPrilogenieInTheWorld")
    property var obj1;
    property var obj2;
    property var obj3;
    property var component1;
    property var component2;
    property var component3;
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
       // bgColor: "#b00000"
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
            y:wh/4 + 150
            actionButtonText: "My_Raiting"
            onActionClicked: {
                allPages.push(rating);
            }
        }

        ModelButton {
            id: toSettings
            x:ww/4
            y:wh/4 + 300
            actionButtonText: "My_Settings"
            onActionClicked: {
                allPages.push(settings);
            }
        }

        ModelButton {
            id: toInfo
            x:ww/4
            y:wh/4 + 450
            actionButtonText: "Infotmation"
            onActionClicked: {
                allPages.push(info);
            }
        }
    }

    ModelPages {
        id:battle
        visible: false
        //bgColor: "#00ff00"
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
                list_of_tasks.set_list(database.getList("13"));
                list_of_tasks.set_marks(database.getMarks("13"));
                list_of_tasks.set_number("13");
            }

        }
        ModelButton {
            id: toMission2
            x:ww/4
            y:wh/4 + 200
            actionButtonText: "Start_Mission_2"
            onActionClicked: {
                allPages.push(mission2);
            }

        }

    }

    ModelPages {
        id:rating
        visible: false

        onBackClicked: {
            allPages.pop(startMenu)
        }
        Rectangle{
            id:raiting_box
            width: ww/2
            height: wh/2
            anchors.top: parent.header.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#f0f0f0"


            Text{
                id: raiting_text
                font.pixelSize: 25

                text: qsTr("Здесь будет \n рейтинг по \n заданиям")
            }

        }
    }

    ModelPages {
        id:settings
        visible: false
       // bgColor: "#f0f0f0"
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
        //bgColor: "#ff00ff"
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
       // bgColor: "#0faaf0"
        height: wh / 4
        width: ww / 4
        anchors.left: parent.left
        anchors.top: parent.top
        onBackClicked: {
            allPages.pop(battle)
        }



        ModelButton {
            id:show_it1
            height: 80
            width: 100
            actionButtonText: "0"
            x: 20
            y: -50
            z: 100


            onActionClicked: {

                if (obj1){
                    obj1.destroy();
                    obj2.destroy();
                    obj3.destroy();
                }

                if(list_of_tasks.check_last()){
                    list_of_tasks.next_el();
                    list_of_tasks.show_el();
                    list_of_tasks.check_marks(0);
                }
                else{
                    allPages.push(endgame);
                }

                component1 = Qt.createComponent("im.qml");
                obj1 = component1.createObject(mission1, { y:200 });
                obj1.source = list_of_tasks.get_task();

                component2 = Qt.createComponent("im_sol.qml");
                obj2 = component2.createObject(mission1, { y:260 });
                obj2.source = list_of_tasks.get_sol();

                component3 = Qt.createComponent("im_stud_sol.qml");
                obj3 = component3.createObject(mission1, {y:395 });
                obj3.source = list_of_tasks.get_st_sol();
            }

        }
        ModelButton{
            id:show_it2
            height: 80
            width: 100
            actionButtonText: "1"
            x: 140
            y: -50
            z: 100


            onActionClicked: {

                if (obj1){
                    obj1.destroy();
                    obj2.destroy();
                    obj3.destroy();
                }

                if(list_of_tasks.check_last()){
                    list_of_tasks.check_marks(1);
                    list_of_tasks.next_el();
                    list_of_tasks.show_el();

                }
                else{
                    allPages.push(endgame);

                }

                component1 = Qt.createComponent("im.qml");
                obj1 = component1.createObject(mission1, { y:200 });
                obj1.source = list_of_tasks.get_task();

                component2 = Qt.createComponent("im_sol.qml");
                obj2 = component2.createObject(mission1, { y:260 });
                obj2.source = list_of_tasks.get_sol();

                component3 = Qt.createComponent("im_stud_sol.qml");
                obj3 = component3.createObject(mission1, {y:395 });
                obj3.source = list_of_tasks.get_st_sol();
            }

        }
        ModelButton{
            id:show_it3
            height: 80
            width: 100
            actionButtonText: "2"
            x: 260
            y: -50
            z: 100


            onActionClicked: {

                if (obj1){
                    obj1.destroy();
                    obj2.destroy();
                    obj3.destroy();
                }

                if(list_of_tasks.check_last()){
                    list_of_tasks.next_el();
                    list_of_tasks.show_el();
                    list_of_tasks.check_marks(2);
                }
                else{
                    allPages.push(endgame);
                }

                component1 = Qt.createComponent("im.qml");
                obj1 = component1.createObject(mission1, { y:200 });
                obj1.source = list_of_tasks.get_task();

                component2 = Qt.createComponent("im_sol.qml");
                obj2 = component2.createObject(mission1, { y:260 });
                obj2.source = list_of_tasks.get_sol();

                component3 = Qt.createComponent("im_stud_sol.qml");
                obj3 = component3.createObject(mission1, {y:395 });
                obj3.source = list_of_tasks.get_st_sol();
            }

        }
        }




    ModelPages{

        id:mission2
        visible: false
        //bgColor: "#ffaaf0"
        height: wh / 4
        width: ww / 4
        anchors.left: parent.left
        anchors.top: parent.top
        onBackClicked: {
            allPages.pop(battle)
        }

        ModelButton{
            id:show_it4
            height: 80
            width: 120
            actionButtonText: "Show"
            x: 100
            y: 100


        }
    }

    ModelPages {
        id:endgame
        visible: false
        //bgColor: "#ff00ff"
        onBackClicked: {
            allPages.pop(startMenu)
        }

        Rectangle{
            width: 400
            height: 400
            anchors.centerIn: parent


            Text {
                id: result
                font.pixelSize: 20
                Component.onCompleted: {
                    text=list_of_tasks.get_res();
                }
            }


        }
    }


}

//    Button {
//            text: qsTr("Обязательно к нажатию")
//            onClicked:{
//                  list_of_tasks.set_list(database.getList("13"));
//                  list_of_tasks.set_number("13");
//                  list_of_tasks.show();

//                      }


//            //                function() {
////                var component = Qt.createComponent("im.qml");
////                var obj = component.createObject(window, {x: 100, y: 100});
////                obj.source = "tasks_solutions/13/student_solution/485932_1.png";

////            }
//        }
//    Button{
//            text: qsTr("Показать картинки")
//            x: 150
//            onClicked: {
//                list_of_tasks.next_el();
//                list_of_tasks.show_el();

//                var component1 = Qt.createComponent("im.qml");
//                var obj1 = component1.createObject(window, {x: 0, y:20 });
//                obj1.source = list_of_tasks.get_task();

//                var component2 = Qt.createComponent("im.qml");
//                var obj2 = component2.createObject(window, {x: 0, y:100 });
//                obj2.source = list_of_tasks.get_sol();

//                var component3 = Qt.createComponent("im.qml");
//                var obj3 = component3.createObject(window, {x: 0, y:150 });
//                obj3.source = list_of_tasks.get_st_sol();
//            }
//    }
