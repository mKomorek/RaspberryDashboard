#ifndef ABOUTAPPSERVICE_H
#define ABOUTAPPSERVICE_H

#include <QObject>
#include <memory>
#include "Models/sensorsdata.h"
#include "Models/recordmodel.h"

class AboutAppService : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject* speedRecord READ speedRecord CONSTANT)
    Q_PROPERTY(QObject* batteryTempRecord READ batteryTempRecord CONSTANT)

public:
    static AboutAppService& instance(std::shared_ptr<SensorsData> sensorsData);

    QObject *speedRecord();
    QObject *batteryTempRecord();

private:
    AboutAppService(QObject *parent = nullptr, std::shared_ptr<SensorsData> sensorsData = nullptr);
    virtual ~AboutAppService();

    std::shared_ptr<SensorsData> m_sensorData;
    std::shared_ptr<RecordModel> m_speedRecord;
    std::shared_ptr<RecordModel> m_batteryTempRecord;
};

#endif // ABOUTAPPSERVICE_H
