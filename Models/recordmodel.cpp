#include "recordmodel.h"

#include <QDebug>

RecordModel::RecordModel(QObject *parent, const QString& recordName) :
    QObject(parent),
    m_recordName(recordName),
    m_updatedTime(QDateTime::currentDateTime()),
    m_value(0)
{

}

QString RecordModel::recordName() const
{
    return m_recordName;
}

QDateTime RecordModel::recordDate() const
{
    return m_updatedTime;
}

int RecordModel::recordValue() const
{
    return m_value;
}

void RecordModel::checkNewRecord(const int& value)
{
    if(value > m_value)
        setRecord(value);
}

void RecordModel::setRecord(const int& value)
{
    m_updatedTime = QDateTime::currentDateTime();
    m_value = value;
    emit recordChanged();
}
