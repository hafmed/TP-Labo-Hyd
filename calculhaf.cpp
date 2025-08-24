// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause
#include "fparser.hh"
#include <iostream>
#include <string>
#include <math.h>
#include <string>
#include <QMessageBox>

#include <iostream>
#include <cmath>
#include <stdio.h>
using namespace std;
#include <limits>

#include "calculhaf.h"

// #include <QAreaSeries>
#include <QQuickItem>
#include <QQuickView>
// #include <QRandomGenerator>
// #include <QtMath>
// #include <QXYSeries>

// Q_DECLARE_METATYPE(QAbstractSeries *)
// Q_DECLARE_METATYPE(QAbstractAxis *)

CalculHaf::CalculHaf(QQuickView *appViewer, QObject *parent)
    : QObject(parent)
    , m_appViewer(appViewer)
{
    // qRegisterMetaType<QAbstractSeries*>();
    // qRegisterMetaType<QAbstractAxis*>();

    // generateData(0, 5, 1024);
}
void CalculHaf::EvalErrorfunHAF(int fparser_EvalError, QString fx, double x,int ndecimaux)
{
    QString message;
    if (fparser_EvalError!=0){
        switch (fparser_EvalError) {
        case 1:
            message=tr("division par zéro");
            break;
        case 2:
            message=tr("erreur sqrt (sqrt d'une valeur négative)");
            break;
        case 3:
            message=tr("erreur log (logarithme d'une valeur nulle ou négative)");
            break;
        case 4:
            message=tr("erreur trigonométrique (asin ou acos d'une valeur incorrecte ; non comprise entre -1 et 1)");
            break;
        case 5:
            message=tr("niveau de récursivité maximum dans eval() atteint");
            break;
        }
        //ndecimaux=spinBox_nbredecimaux_eqtdifferentielle->text().toInt();
        message+=tr(" dans x=")+QString::number(x,'f',ndecimaux);
        emit requestDialog(tr("Erreur dans ")+ QString("%1").arg(fx),message);
        ///resultatsMessage.critical(this, tr("Erreur dans ")+ QString("%1").arg(fx),message);
        return;
    }
}


void CalculHaf::hafresolutioneqtnonlineaire_newtonraphson(QString fx,QString fxprim, double x0tp6,double epstp6,int nmaxtp6)
{

    double x[nmaxtp6];
    x[0]=x0tp6;
    if(x[0]==std::numeric_limits<double>::infinity() || x[0]==-std::numeric_limits<double>::infinity()){
        emit requestDialog("Erreur","La valeur de x0 dépasse les limites admissibles!");
        return ;
    }
    double eps=epstp6;
    while(true)
    {
        int res = fparserfx.Parse(fx.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfx.ErrorMsg())!=0){
            emit requestDialog("Erreur dans f(x)",fparserfx.ErrorMsg());
                     qDebug() << fparserfx.ErrorMsg();
            break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                  << fparserfx.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserfxprim.Parse(fxprim.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfxprim.ErrorMsg())!=0){
            emit requestDialog("Erreur dans f(x)",fparserfxprim.ErrorMsg());
            qDebug() << fparserfxprim.ErrorMsg();
            break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparserfxprim.ErrorMsg() << "\n\n";
    }

    vals[0]=x[0];

    int i=0;
    int nmax=nmaxtp6;
    while (fabs(fparserfx.Eval(vals))>eps && i<nmax && fparserfx_EvalError==0 && fparserfxprim_EvalError==0)
    {
        vals[0]=x[i];
        x[i+1]=x[i]-fparserfx.Eval(vals)/fparserfxprim.Eval(vals);
        vals[0]=x[i+1];
        i=i+1;
        emit requestXi(i,x[i]);

    }
    emit requestVtheo(x[i]);
    emit requestSelectEndtable();
}


