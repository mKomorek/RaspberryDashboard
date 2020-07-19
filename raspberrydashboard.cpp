#include <QQuickStyle>
#include <QQuickWindow>
#include <QQmlContext>

#include "raspberrydashboard.h"
#include "QMLtypes/radialbar.h"

RaspberryDashboard::RaspberryDashboard(int &argc, char **argv) : QGuiApplication(argc, argv)
{
    QQuickStyle::setStyle("Material");
    QQuickWindow::setTextRenderType(QQuickWindow::TextRenderType::QtTextRendering);
    QGuiApplication::setOverrideCursor(QCursor(Qt::BlankCursor));

    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/QML/GlobalValues.qml")), "View", 1, 0, "GlobalValues");
    qmlRegisterType<RadialBar>("View", 1, 0, "RadialBar");

//    m_engine.rootContext()->setContextProperty(
//                         "ConnectService",
//                         &ConnectService::instance());

    m_engine.load(QUrl(QStringLiteral("qrc:/QML/main.qml")));
}

RaspberryDashboard::~RaspberryDashboard()
{

}
