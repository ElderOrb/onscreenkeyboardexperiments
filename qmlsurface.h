#ifndef QMLSURFACE_H
#define QMLSURFACE_H

#include <QObject>

class QQuickWindow;
class QQuickItem;
class QmlSurface : public QObject
{
    Q_OBJECT
public:
    explicit QmlSurface(QObject *parent = nullptr);
    void setRoot(QQuickWindow* root);
signals:

public slots:
    void onFocusObjectChanged(QObject* focusObject);

private:
    QQuickItem* thekeyboard;
    QQuickItem* m_keyboard;
    QQuickItem* m_lastFocused;
};

#endif // QMLSURFACE_H
