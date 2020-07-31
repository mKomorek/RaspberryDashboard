#include "deviceservice.h"

#include <QQmlEngine>
#include <QSerialPortInfo>
#include <QDebug>

DeviceService &DeviceService::instance()
{
    static DeviceService _instance;
    return _instance;
}

QObject *DeviceService::device()
{
    QObject* ptr = m_device.get();
    QQmlEngine::setObjectOwnership(ptr, QQmlEngine::ObjectOwnership::CppOwnership);
    return ptr;
}

QStringList DeviceService::portNames() const
{
    return m_portNames;
}

QStringList DeviceService::portDescriptions() const
{
    return m_portDescriptions;
}

QStringList DeviceService::logInfo() const
{
    return m_logInfo;
}

void DeviceService::searchDevices()
{
    addToLogs("Loking for the devices...");
    m_portNames.clear();
    m_serialPortInfo = QSerialPortInfo::availablePorts();
    for(auto &port : m_serialPortInfo)
    {
        m_portNames.append(port.portName());
        m_portDescriptions.append(port.description());
    }
    addToLogs("Search for devices is complete");
    emit portNamesChanged();
    emit portDescriptionsChanged();
}

void DeviceService::connectDevice(const QString &portName)
{
    m_device->serialPort()->setPortName(portName);

    if( !(m_device->serialPort()->isOpen()) )
    {
        if(m_device->serialPort()->open(QSerialPort::ReadWrite))
        {
            setSerialPortProperies(m_device->serialPort());
            m_device->setIsConnected(true);
            QObject::connect(m_device->serialPort().get(), SIGNAL(readyRead()), m_device.get(), SLOT(readDataFrames()));
            addToLogs("The port has been opened");
            addToLogs("Connected to the device");
        }
        else
        {
            addToLogs("Error while opening port");
        }
    }
    else
    {
        addToLogs("This port is already open");
    }
}

void DeviceService::disconectDevice()
{
    if(m_device->serialPort()->isOpen())
    {
        m_device->serialPort()->close();
        m_device->setIsConnected(false);
        addToLogs("Port has been closed");
    }
    else
    {
        addToLogs("Port is not open");
    }
}

void DeviceService::clearLogs()
{
    m_logInfo.clear();
    emit logInfoChanged();
}

DeviceService::DeviceService(QObject *parent)
    : QObject(parent)
{
    m_device = std::make_shared<Device>();
    searchDevices();
    if( !(portNames().empty()) )
        connectDevice(portNames().first());
    else
        addToLogs("Failed to connect with sensors");
}

DeviceService::~DeviceService()
{

}

void DeviceService::addToLogs(const QString &message)
{
    m_logInfo.insert(0, message);
    emit logInfoChanged();
}

void DeviceService::setSerialPortProperies(std::shared_ptr<QSerialPort> port)
{
    port->setBaudRate(QSerialPort::Baud9600);
    port->setDataBits(QSerialPort::Data8);
    port->setParity(QSerialPort::NoParity);
    port->setStopBits(QSerialPort::OneStop);
    port->setFlowControl(QSerialPort::NoFlowControl);
}

