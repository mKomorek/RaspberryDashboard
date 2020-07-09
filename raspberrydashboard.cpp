#include <QQuickStyle>
#include <QQuickWindow>
#include <QQmlContext>

#include "raspberrydashboard.h"
#include "QMLtypes/radialbar.h"

RaspberryDashboard::RaspberryDashboard(int &argc, char **argv) : QGuiApplication(argc, argv)
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");
    QQuickWindow::setTextRenderType(QQuickWindow::TextRenderType::QtTextRendering);

    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/QML/Constants.qml")), "View", 1, 0, "Constants");
    qmlRegisterType<RadialBar>("View", 1, 0, "RadialBar");

//    m_engine.rootContext()->setContextProperty(
//                         "ConnectService",
//                         &ConnectService::instance());

    m_engine.load(QUrl(QStringLiteral("qrc:/QML/main.qml")));
}

RaspberryDashboard::~RaspberryDashboard()
{

}
