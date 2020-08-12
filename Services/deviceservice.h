#ifndef DEVICESERVICE_H
#define DEVICESERVICE_H

#include <QObject>
#include <QSerialPort>
#include "Models/device.h"
#include <memory>

class DeviceService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject* device READ device CONSTANT)
    Q_PROPERTY(QStringList portNames READ portNames NOTIFY portNamesChanged)
    Q_PROPERTY(QStringList portDescriptions READ portDescriptions NOTIFY portDescriptionsChanged)
    Q_PROPERTY(QStringList logInfo READ logInfo NOTIFY logInfoChanged)

public:
    static DeviceService& instance();

    QObject *device();
    QStringList portNames() const;
    QStringList portDescriptions() const;
    QStringList logInfo() const;

    std::shared_ptr<Device> getDevice() const;

public slots:
    void searchDevices();
    void connectDevice(const QString &portName);
    void disconectDevice();
    void clearLogs();

signals:
    void portNamesChanged();
    void portDescriptionsChanged();
    void logInfoChanged();

private:
    DeviceService(QObject *parent = nullptr);
    virtual ~DeviceService();
    void addToLogs(const QString& message);
    void setSerialPortProperies(std::shared_ptr<QSerialPort> port);

    std::shared_ptr<Device> m_device;
    QList<QSerialPortInfo> m_serialPortInfo;
    QStringList m_portNames;
    QStringList m_portDescriptions;
    QStringList m_logInfo;
};

#endif // DEVICESERVICE_H
