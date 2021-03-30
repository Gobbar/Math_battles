#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <QStringList>
#include <QList>

#define DATABASE_HOSTNAME   "tasks_solutions"
#define DATABASE_NAME       "tasks_solutions.db"

#define TASKS_TABLE             "Tasks"      // Название таблицы заданий
#define TASKS_TABLE_ID          "id"         // id задания
#define TASKS_TABLE_NUM         "number"     // номер задания внутри КИМ

#define STUD_TABLE              "Stud_solution" // Название таблицы решений учеников
#define STUD_TABLE_TASK_ID      "task_id" // id задания
#define STUD_TABLE_ID           "id" // id решения ученика
#define STUD_TABLE_MARK         "mark" // оценка учащегося

class database: public QObject
{
    Q_OBJECT
public:
    explicit database(QObject *parent = 0);

        ~database();
        /* Методы для непосредственной работы с классом
         * Подключение к базе данных и вставка записей в таблицу
         * */
        void connectToDataBase();

    private:
        // Сам объект базы данных, с которым будет производиться работа
        QSqlDatabase    db;

    private:
        /* Внутренние методы для работы с базой данных
         * */
        bool openDataBase();        // Открытие базы данных
        bool restoreDataBase();     // Восстановление базы данных
        void closeDataBase();       // Закрытие базы данных

    public slots:

       // bool inserIntoTable(const QVariantList &data);      // Добавление записей в таблицу
        //bool inserIntoTable(const QString &fname, const QString &sname, const QString &nik);
        //bool removeRecord(const int id); // Удаление записи из таблицы по её id
        void showData(QString number);            // Отражение данных
        QStringList getList(QString number);
        QList<int> getMarks(QString number);
    };

    #endif // DATABASE_H
