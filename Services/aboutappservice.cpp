#include "aboutappservice.h"

#include <QQmlEngine>
#include <QDebug>

AboutAppService &AboutAppService::instance(std::shared_ptr<SensorsData> sensorsData)
{
    static AboutAppService _instance(nullptr, sensorsData);
    return _instance;
}

QObject *AboutAppService::speedRecord()
{
    QObject* ptr = m_speedRecord.get();
    QQmlEngine::setObjectOwnership(ptr, QQmlEngine::ObjectOwnership::CppOwnership);
    return ptr;
}

QObject *AboutAppService::batteryTempRecord()
{
    QObject* ptr = m_batteryTempRecord.get();
    QQmlEngine::setObjectOwnership(ptr, QQmlEngine::ObjectOwnership::CppOwnership);
    return ptr;
}

AboutAppService::AboutAppService(QObject *parent, std::shared_ptr<SensorsData> sensorsData) :
    QObject(parent),
    m_sensorData(sensorsData),
    m_speedRecord(std::make_shared<RecordModel>(nullptr, "HIGHEST SPEED")),
    m_batteryTempRecord(std::make_shared<RecordModel>(nullptr, "HIGHEST BATTERY TEMP"))
{
    QObject::connect(m_sensorData.get(), &SensorsData::A0ChangedInt, m_speedRecord.get(), &RecordModel::checkNewRecord);
    QObject::connect(m_sensorData.get(), &SensorsData::A1ChangedInt, m_batteryTempRecord.get(), &RecordModel::checkNewRecord);
}

AboutAppService::~AboutAppService()
{

}
