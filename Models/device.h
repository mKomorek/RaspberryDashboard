#ifndef DEVICE_H
#define DEVICE_H

#include <QObject>
#include <QSerialPort>
#include <memory>
#include "sensorsdata.h"

class Device : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString portName READ portName NOTIFY portNameChanged)
    Q_PROPERTY(QString portDescription READ portDescription NOTIFY portDescriptionChanged)
    Q_PROPERTY(bool isConnected READ isConnected WRITE setIsConnected NOTIFY isConnectedChanged)
    Q_PROPERTY(QObject* sensorsData READ sensorsData CONSTANT)

public:
    Device(QObject *parent = nullptr);
    virtual ~Device() = default;

    std::shared_ptr<QSerialPort> serialPort() const;
    QString portName() const;
    QString portDescription() const;
    bool isConnected() const;
    QObject *sensorsData();

    std::shared_ptr<SensorsData> getSensorData() const;

private slots:
    void readDataFrames();

public slots:
    void setPortName(const QString &portName);
    void setPortDescription(const QString &portDescription);
    void setIsConnected(const bool &value);

signals:
   void portNameChanged();
   void portDescriptionChanged();
   void isConnectedChanged();

private:
    std::shared_ptr<QSerialPort> m_serialPort;
    QString m_portName;
    QString m_portDescription;
    bool m_isConnected;
    std::shared_ptr<SensorsData> m_sensorsData;
};

#endif // DEVICE_H
