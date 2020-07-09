#ifndef RASPBERRYDASHBOARD_H
#define RASPBERRYDASHBOARD_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>

class RaspberryDashboard : public QGuiApplication
{
    Q_OBJECT
public:
    RaspberryDashboard(int &argc, char **argv);
    ~RaspberryDashboard();

private:
    QQmlApplicationEngine m_engine;
};

#endif // RASPBERRYDASHBOARD_H
