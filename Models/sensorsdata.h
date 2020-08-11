#ifndef SENSORSDATA_H
#define SENSORSDATA_H

#include <QObject>

class SensorsData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal A0 READ A0 NOTIFY A0Changed)
    Q_PROPERTY(qreal A1 READ A1 NOTIFY A1Changed)
    Q_PROPERTY(qreal A2 READ A2 NOTIFY A2Changed)
    Q_PROPERTY(qreal D7 READ D7 NOTIFY D7Changed)
    Q_PROPERTY(qreal D6 READ D6 NOTIFY D6Changed)
    Q_PROPERTY(qreal D5 READ D5 NOTIFY D5Changed)

public:
    SensorsData(QObject *parent = nullptr);
    virtual ~SensorsData() = default;

    qreal A0() const;
    qreal A1() const;
    qreal A2() const;
    qreal D7() const;
    qreal D6() const;
    qreal D5() const;

    void setSensorsData(const QStringList &values);

signals:
    void A0Changed();
    void A1Changed();
    void A2Changed();
    void D7Changed();
    void D6Changed();
    void D5Changed();

private:
    qreal m_A0;
    qreal m_A1;
    qreal m_A2;
    qreal m_D7;
    qreal m_D6;
    qreal m_D5;

};

#endif // SENSORSDATA_H
