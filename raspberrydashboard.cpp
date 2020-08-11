#include <QQuickStyle>
#include <QQuickWindow>
#include <QQmlContext>

#include "raspberrydashboard.h"
#include "QMLtypes/radialbar.h"
#include "Services/deviceservice.h"

RaspberryDashboard::RaspberryDashboard(int &argc, char **argv) : QApplication(argc, argv)
{
    QQuickStyle::setStyle("Material");
    QQuickWindow::setTextRenderType(QQuickWindow::TextRenderType::QtTextRendering);
    //QGuiApplication::setOverrideCursor(QCursor(Qt::BlankCursor));

    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/QML/GlobalValues.qml")), "View", 1, 0, "GlobalValues");
    qmlRegisterType<RadialBar>("View", 1, 0, "RadialBar");

    m_engine.rootContext()->setContextProperty(
                         "DeviceService",
                         &DeviceService::instance());

    m_engine.load(QUrl(QStringLiteral("qrc:/QML/main.qml")));
}
