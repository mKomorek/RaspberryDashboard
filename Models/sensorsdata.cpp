#include "sensorsdata.h"

SensorsData::SensorsData(QObject *parent) : QObject(parent)
{

}

qreal SensorsData::A0() const
{
    return m_A0;
}

qreal SensorsData::A1() const
{
    return m_A1;
}

qreal SensorsData::A2() const
{
    return m_A2;
}

qreal SensorsData::D7() const
{
    return m_D7;
}

qreal SensorsData::D6() const
{
    return m_D6;
}

qreal SensorsData::D5() const
{
    return m_D5;
}

void SensorsData::setSensorsData(const QStringList &values)
{
    if(values.size() == 6)
    {
        updateAnalogInputs(values);
        updateDigitalSignals(values);
        emitSignalForRecordUpdate();
    }
}

void SensorsData::updateAnalogInputs(const QStringList &values)
{
    m_A0 = static_cast<int>(values[0].toDouble());
    m_A1 = static_cast<int>(values[1].toDouble());
    m_A2 = static_cast<int>(values[2].toDouble());
    emit A0Changed();
    emit A1Changed();
    emit A2Changed();
}

void SensorsData::updateDigitalSignals(const QStringList &values)
{
    if(m_D7 != static_cast<int>(values[3].toDouble()))
    {
        m_D7 = static_cast<int>(values[3].toDouble());
        emit D7Changed();
    }
    if(m_D6 != static_cast<int>(values[4].toDouble()))
    {
        m_D6 = static_cast<int>(values[4].toDouble());
        emit D6Changed();
    }
    if(m_D5 != static_cast<int>(values[5].toDouble()))
    {
        m_D5 = static_cast<int>(values[5].toDouble());
        emit D5Changed();
    }
}

void SensorsData::emitSignalForRecordUpdate()
{
    emit A0ChangedInt(m_A0);
    emit A1ChangedInt(m_A1);
}
