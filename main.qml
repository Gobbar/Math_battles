import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2


ApplicationWindow {
    id: window
    visible: true
    color: "#55ffff"
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button {
            text: qsTr("Обязательно к нажатию")
            onClicked:{
                  list_of_tasks.set_list(database.getList("13"));
                  list_of_tasks.set_number("13");
                  list_of_tasks.show();

                      }


            //                function() {
//                var component = Qt.createComponent("im.qml");
//                var obj = component.createObject(window, {x: 100, y: 100});
//                obj.source = "tasks_solutions/13/student_solution/485932_1.png";

//            }
        }
    Button{
            text: qsTr("Показать картинки")
            x: 150
            onClicked: {
                list_of_tasks.next_el();
                list_of_tasks.show_el();

                var component1 = Qt.createComponent("im.qml");
                var obj1 = component1.createObject(window, {x: 0, y:20 });
                obj1.source = list_of_tasks.get_task();

                var component2 = Qt.createComponent("im.qml");
                var obj2 = component2.createObject(window, {x: 0, y:100 });
                obj2.source = list_of_tasks.get_sol();

                var component3 = Qt.createComponent("im.qml");
                var obj3 = component3.createObject(window, {x: 0, y:150 });
                obj3.source = list_of_tasks.get_st_sol();
            }
    }
}
