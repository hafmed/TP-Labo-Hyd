// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#ifndef CALCULHAF_H
#define CALCULHAF_H

#include "fparser.hh"
#include <QMessageBox>

#include <QObject>

QT_FORWARD_DECLARE_CLASS(QQuickView)

class CalculHaf : public QObject
{
    Q_OBJECT
public:
    explicit CalculHaf(QQuickView *appViewer, QObject *parent = nullptr);
    Q_INVOKABLE void hafresolutioneqtnonlineaire_newtonraphson(QString fx, QString fxprim, double x0tp6, double epstp6, int nmaxtp6);

    double vals[1];
    QString fx;
    FunctionParser fparserfx;
    FunctionParser fparserfxprim;

    int fparserfx_EvalError=0;
    int fparserfxprim_EvalError=0;

signals:
    void requestDialog(QString title,QString error);
    void requestXi(int i,double xi);
    void requestVtheo(double vtheo);

    void requestSelectEndtable();

public slots:
    ///void generateData(int type, int rowCount, int colCount);

private slots:
    void EvalErrorfunHAF(int fparsergx_EvalError, QString fx, double x,int ndecimaux);

private:
    QQuickView *m_appViewer = nullptr;
    ///QList<QList<QPointF>> m_data;
    ///int m_index = -1;
};

#endif
