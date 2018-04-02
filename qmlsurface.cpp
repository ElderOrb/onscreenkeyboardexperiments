#include "qmlsurface.h"

#include <QQuickItem>

QmlSurface::QmlSurface(QObject *parent) : QObject(parent), m_keyboard(nullptr)
{

}

class Keyboard : public QQuickItem {

};

QQuickItem* findNearestKeyboard(QQuickItem *focusItem) {
    auto item = focusItem;

    int level = 0;
    while(item) {
        qDebug() << QString(level, ' ') + "item: " << item;

        auto keyboard = item->findChild<QQuickItem*>(QString("keyboard"));
        if(keyboard)
            return keyboard;

        item = item->parentItem();
        ++level;
    }

    return nullptr;
}

void QmlSurface::onFocusObjectChanged(QObject *focusObject)
{
    auto keyboard = findNearestKeyboard(qobject_cast<QQuickItem*> (focusObject));
    if(keyboard) {
        m_keyboard = keyboard;
        keyboard->setProperty("raised", true);
    } else if(m_keyboard) {
        m_keyboard->setProperty("raised", false);
        m_keyboard = nullptr;
    }
}
