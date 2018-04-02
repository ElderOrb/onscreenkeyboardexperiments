#ifndef QMLSURFACE_H
#define QMLSURFACE_H

#include <QObject>

class QQuickItem;
class QmlSurface : public QObject
{
    Q_OBJECT
public:
    explicit QmlSurface(QObject *parent = nullptr);
signals:

public slots:
    void onFocusObjectChanged(QObject* focusObject);

private:
    QQuickItem* m_keyboard;
};

#endif // QMLSURFACE_H
