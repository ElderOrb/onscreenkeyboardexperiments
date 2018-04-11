#include "qmlsurface.h"

#include <QQuickItem>
#include <QQuickWindow>

QmlSurface::QmlSurface(QObject *parent) : QObject(parent), m_keyboard(nullptr), m_lastFocused(nullptr)
{

}

void QmlSurface::setRoot(QQuickWindow *root)
{
    this->thekeyboard = root->findChild<QQuickItem*>(QString("virtualkeyboard"));
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
    auto quickItem = qobject_cast<QQuickItem*>(focusObject);
    if(quickItem && quickItem->hasActiveFocus())
    {
        auto keyboard = findNearestKeyboard(qobject_cast<QQuickItem*> (focusObject));
        qDebug() << "focusObject: " << focusObject;

        if(keyboard) {
            thekeyboard->setParentItem(keyboard);
            thekeyboard->setProperty("raised", true);

            return;
        }
    }

    thekeyboard->setProperty("raised", false);
}
