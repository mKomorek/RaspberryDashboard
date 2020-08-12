#ifndef RASPBERRYDASHBOARD_H
#define RASPBERRYDASHBOARD_H

#include <QApplication>
#include <QQmlApplicationEngine>

class RaspberryDashboard : public QApplication
{
    Q_OBJECT
public:
    RaspberryDashboard(int &argc, char **argv);
    virtual ~RaspberryDashboard() = default;

private:
    void registerQMLTypes();
    void setContextProperties();
    QQmlApplicationEngine m_engine;
};

#endif // RASPBERRYDASHBOARD_H
