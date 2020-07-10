#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "raspberrydashboard.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    RaspberryDashboard app(argc, argv);
    return app.exec();
}
