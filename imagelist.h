#ifndef IMAGELIST_H
#define IMAGELIST_H

#include <QObject>
#include <QDebug>

class ImageList : public QObject
{
    Q_OBJECT
public:
    explicit ImageList(QObject *parent = nullptr);
private:
    QStringList task_list;
    int index=-1;//при нажатии на кнопку для отображения элемента сразу наращивается индекс
    QString number;
public slots:
    void set_list(QStringList tl);
    void set_number(QString num);
    void show();
    QString current_el();
    void next_el();
    void show_el();
    QString get_task();
    QString get_sol();
    QString get_st_sol();
};

#endif // IMAGELIST_H
