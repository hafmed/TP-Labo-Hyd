// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#include "calculhaf.h"

#include <QApplication>
#include <QDir>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickView>

#include <QQuickStyle>

 #include <QStyleHints>
 #include <QtGlobal> // For Qt::ColorScheme

int main(int argc, char *argv[])
{
    // Qt Charts uses Qt Graphics View Framework for drawing, therefore QApplication must be used.
    QApplication app(argc, argv);

    QApplication::setOrganizationDomain(QStringLiteral("org.hafsoftdz"));
    QApplication::setOrganizationName(QStringLiteral("hafsoftdz"));
    QApplication::setApplicationName(QStringLiteral("Fluid Mechanics Lab Calc."));

    QGuiApplication::setDesktopFileName(QStringLiteral("org.flatpak.basic_numerical_methods"));

    QQuickStyle::setStyle("Material");

    qputenv("QT_QUICK_CONTROLS_STYLE", QByteArray("Material"));
    qputenv("QT_QUICK_CONTROLS_MATERIAL_THEME", QByteArray("System"));
    qputenv("QT_QUICK_CONTROLS_MATERIAL_VARIANT", QByteArray("Dense"));
    qputenv("QT_QUICK_CONTROLS_CONF", QByteArray(":/qtquickcontrols2.conf"));
    // qputenv("QT_QUICK_CONTROLS_MATERIAL_ACCENT", QByteArray("Purple"));
    // qputenv("QT_QUICK_CONTROLS_MATERIAL_PRIMARY", QByteArray("BlueGrey"));

    // qputenv("QT_QUICK_CONTROLS_MATERIAL_FOREGROUND", QByteArray("Teal"));
    // qputenv("QT_QUICK_CONTROLS_MATERIAL_BACKGROUND", QByteArray("Pink"));


    app.setWindowIcon(QIcon(":/qml/images/io.github.hafmed.TP-Labo-Hyd.jpg"));
    app.setOrganizationName("hafsoftdz");
    app.setOrganizationDomain("org.hafsoftdz");


    QGuiApplication::styleHints()->colorScheme();

    // connect(QGuiApplication::styleHints(), &QStyleHints::colorSchemeChanged, app, [app](Qt::ColorScheme scheme) {
    //     if (scheme == Qt::ColorScheme::Dark) {
    //             qputenv("QT_QUICK_CONTROLS_MATERIAL_THEME", QByteArray("System"));
    //     } else {
    //             qputenv("QT_QUICK_CONTROLS_MATERIAL_THEME", QByteArray("System"));
    //     }
    // });

    // OpenGL backend is required to make AbstractSeries.useOpenGL work.
    // We don't force it programmatically, as OpenGL is not guaranteed to be available everywhere.
    bool openGLSupported = QQuickWindow::graphicsApi() == QSGRendererInterface::OpenGLRhi;
    if (!openGLSupported) {
        qWarning() << "OpenGL is not set as the graphics backend, so AbstractSeries.useOpenGL will not work.";
        qWarning() << "Set QSG_RHI_BACKEND=opengl environment variable to force the OpenGL backend to be used.";
    }

    QQuickView viewer;

    // The following are needed to make examples run without having to install the module
    // in desktop environments.
    #ifdef Q_OS_WIN
        QString extraImportPath(QStringLiteral("%1/../../../../%2"));
    #else
        QString extraImportPath(QStringLiteral("%1/../../../%2"));
    #endif
    viewer.engine()->addImportPath(extraImportPath.arg(QGuiApplication::applicationDirPath(),
                                                       QString::fromLatin1("qml")));
    QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer, &QWindow::close);

    viewer.setTitle(QStringLiteral("Fluid Mechanics Lab Calc."));

    CalculHaf CalculHaf(&viewer);
    viewer.rootContext()->setContextProperty("CalculHaf", &CalculHaf);

    viewer.setSource(QUrl("qrc:/qml/Main.qml"));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
   /// viewer.setColor(QColor("#404040"));
    viewer.show();

    return app.exec();
}
