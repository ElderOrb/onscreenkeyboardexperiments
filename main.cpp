#include "qmlsurface.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QQuickWindow>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    auto window = qobject_cast<QQuickWindow*> (engine.rootObjects().first());

    QmlSurface surface;
    surface.setRoot(window);

    QObject::connect(window, &QQuickWindow::focusObjectChanged, &surface, &QmlSurface::onFocusObjectChanged);

    return app.exec();
}
