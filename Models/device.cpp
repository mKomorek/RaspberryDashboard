#include "device.h"
#include <QDebug>
#include <QQmlEngine>

Device::Device(QObject *parent) :
      QObject(parent),
      m_portName("undefined"),
      m_portDescription("undefined"),
      m_isConnected(false)
{
    m_serialPort = std::make_shared<QSerialPort>();
    m_sensorsData = std::make_shared<SensorsData>();
}

std::shared_ptr<QSerialPort> Device::serialPort() const
{
    return m_serialPort;
}

QString Device::portName() const
{
    return m_portName;
}

QString Device::portDescription() const
{
    return m_portDescription;
}

bool Device::isConnected() const
{
    return m_isConnected;
}

QObject *Device::sensorsData()
{
    QObject *ptr = m_sensorsData.get();
    QQmlEngine::setObjectOwnership(ptr, QQmlEngine::ObjectOwnership::CppOwnership);
    return ptr;
}

std::shared_ptr<SensorsData> Device::getSensorData() const
{
    return m_sensorsData;
}

void Device::readDataFrames()
{
    while(m_serialPort->canReadLine())
    {
        QString line = m_serialPort->readLine();
        QStringList stringValues = line.split(',');
        //qDebug() << stringValues;
        m_sensorsData->setSensorsData(stringValues);
    }
}

void Device::setPortName(const QString &portName)
{
    m_portName = portName;
    emit portNameChanged();
}

void Device::setPortDescription(const QString &portDescription)
{
    m_portDescription = portDescription;
    emit portDescriptionChanged();
}

void Device::setIsConnected(const bool &value)
{
    m_isConnected = value;
    emit isConnectedChanged();
}

