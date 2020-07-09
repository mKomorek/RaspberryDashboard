#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "raspberrydashboard.h"

int main(int argc, char *argv[])
{
    RaspberryDashboard app(argc, argv);
    return app.exec();
}
