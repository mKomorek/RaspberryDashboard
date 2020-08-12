#ifndef RECORDMODEL_H
#define RECORDMODEL_H

#include <QObject>
#include <QDateTime>

class RecordModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString recordName READ recordName CONSTANT)
    Q_PROPERTY(QDateTime recordDate READ recordDate NOTIFY recordChanged)
    Q_PROPERTY(int recordValue READ recordValue NOTIFY recordChanged)

public:
    RecordModel(QObject *parent = nullptr, const QString& recordName = "undefined");
    virtual ~RecordModel() = default;

    QString recordName() const;
    QDateTime recordDate() const;
    int recordValue() const;

    void setRecord(const int& value);

public slots:
    void checkNewRecord(const int& value);

signals:
    void recordChanged();

private:
    QString m_recordName;
    QDateTime m_updatedTime;
    int m_value;
};

#endif // RECORDMODEL_H
