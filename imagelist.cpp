#include "imagelist.h"

ImageList::ImageList(QObject *parent) : QObject(parent)
{

}
//устанавливает список заданий
void ImageList::set_list(QStringList tl){
    task_list = tl;
}
//устанавливает номер текущего задания (13, 14,...)
void ImageList::set_number(QString num){
    number=num;
}
//дебагер для просмотра списка
void ImageList::show(){
    qDebug()<<task_list;
}
//переход к следующему элементу
void ImageList::next_el(){
    index++;
}
//получение текущего элемента
QString ImageList::current_el(){
    show_el();
    return task_list[index];
}
//дебагер для просмотра текущего элемента
void ImageList::show_el(){
    qDebug()<<task_list[index];
    get_sol();
}
//составление пути для картинки студ решений
QString ImageList::get_st_sol(){
    QString res = "tasks_solutions/"+number+"/student_solution/"+task_list[index]+".png";
    qDebug()<<res;
    return res;
}
//составление пути для картинки решения
QString ImageList::get_sol(){
    QString res ="tasks_solutions/"+number+"/solution/" + task_list[index].mid(0, task_list[index].indexOf("_"))+".JPG";
    qDebug()<<res;
    return res;
}
//составление пути для картинки задания
QString ImageList::get_task(){
    QString res ="tasks_solutions/"+number+"/task/" + task_list[index].mid(0, task_list[index].indexOf("_"))+".JPG";
    qDebug()<<res;
    return res;
}
