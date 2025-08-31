import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts

Item {
    id: app
    width: 410
    height: 650
    LayoutMirroring.enabled: false
    LayoutMirroring.childrenInherit: false
    ///Material.theme: Material.Dark
    ///Material.accent: Material.Purple

    ///Material.theme : Material.System

    Connections {
        target: Qt.application
        function onActiveChanged() {
            savesettings();
        }
        function onStateChanged() {
            if (settings.firstuseofapp) loaddefaultsettings()
            ///console.log("state application is="+Qt.application.state)
            savesettings();
        }
    }
    Settings {
        id: settings
        property bool firstuseofapp:true
        property int scopeViewcount
        property int comboxballcurrentIndex_tp1
        property real roballgcm3_tp1
        property real rolgcm3_tp1
        property real dballmm_tp1
        property real k_tp1
        property real dt_tp1
        property real dl_tp1
        property real viscodynatheo_tp1
        property real viscodynamesur_tp1
        property real tempera_tp1

        property real temperatableModel1_tp1
        property real temperatableModel2_tp1
        property real temperatableModel3_tp1
        property real viscodynamesurtableModel1_tp1
        property real viscodynamesurtableModel2_tp1
        property real viscodynamesurtableModel3_tp1

        property int comboxballcurrentIndex_tp2
        property real roballgcm3_tp2
        property real rolgcm3_tp2
        property real dballmm_tp2
        property real dt_tp2
        property real dl_tp2
        property real viscodynatheo_tp2
        property real viscodynamesur_tp2

        property real mass_tp3
        property real diampiston_tp3
        property string unitpression_tp3
        property int comboxunitpression_Index_tp3
        property real masspiston_tp3
        property real degreBourdonGauge_tp3
        /////
        property real pressuretableModel1_tp3
        property real pressuretableModel2_tp3
        property real pressuretableModel3_tp3
        property real pressuretableModel4_tp3
        property real pressuretableModel5_tp3
        property real tensiontableModel1_tp3
        property real tensiontableModel2_tp3
        property real tensiontableModel3_tp3
        property real tensiontableModel4_tp3
        property real tensiontableModel5_tp3
        property real degreestableModel1_tp3
        property real degreestableModel2_tp3
        property real degreestableModel3_tp3
        property real degreestableModel4_tp3
        property real degreestableModel5_tp3
        /////
        property bool radiobutton1ischecked_tp3
        property bool radiobutton2ischecked_tp3
        property bool radiobutton3ischecked_tp3
        property bool radiobutton4ischecked_tp3
        property bool radiobutton5ischecked_tp3
        property bool radiobutton6ischecked_tp3
        /////tp4
        property real rolkgm3_tp4
        property real dQuadrant_tp4
        property real bQuadrant_tp4
        property real l_tp4
        property real h_tp4

        property real mPartially_sub_tp4
        property real dPartially_sub_tp4
        property real theoHydostaticF_Partially_sub_tp4
        property real theoCentrePressure_Partially_sub_tp4
        property real expCentrePressure_Partially_sub_tp4

        property real mFully_sub_tp4
        property real dFully_sub_tp4
        property real theoHydostaticF_Fully_sub_tp4
        property real theoCentrePressure_Fully_sub_tp4
        property real expCentrePressure_Fully_sub_tp4
        ///Screen_tp5
        property real volume1modelQexp_tp5
        property real temps1modelQexp_tp5
        property real qexp1modelQexp_tp5
        property real volume2modelQexp_tp5
        property real temps2modelQexp_tp5
        property real qexp2modelQexp_tp5
        property real volume3modelQexp_tp5
        property real temps3modelQexp_tp5
        property real qexp3modelQexp_tp5

        property real qexp1tableModel1_venturie_tp5
        property real dh1tableModel1_venturie_tp5
        property real qtheo1tableModel1_venturie_tp5
        property real cd1tableModel1_venturie_tp5
        property real qexp2tableModel1_venturie_tp5
        property real dh2tableModel1_venturie_tp5
        property real qtheo2tableModel1_venturie_tp5
        property real cd2tableModel1_venturie_tp5

        property real qexp3tableModel1_venturie_tp5
        property real dh3tableModel1_venturie_tp5
        property real qtheo3tableModel1_venturie_tp5
        property real cd3tableModel1_venturie_tp5

        property real d1_tp5
        property real d2_tp5

        property real cd1_tp5
        property real cd2_tp5
        property real cd3_tp5
        ///-Diaphra
        property real volume1modelQexp_Diaphra_tp5
        property real temps1modelQexp_Diaphra_tp5
        property real qexp1modelQexp_Diaphra_tp5
        property real volume2modelQexp_Diaphra_tp5
        property real temps2modelQexp_Diaphra_tp5
        property real qexp2modelQexp_Diaphra_tp5
        property real volume3modelQexp_Diaphra_tp5
        property real temps3modelQexp_Diaphra_tp5
        property real qexp3modelQexp_Diaphra_tp5

        property real qexp1tableModel1_Diaphra_tp5
        property real dh1tableModel1_Diaphra_tp5
        property real qtheo1tableModel1_Diaphra_tp5
        property real cd1tableModel1_Diaphra_tp5
        property real qexp2tableModel1_Diaphra_tp5
        property real dh2tableModel1_Diaphra_tp5
        property real qtheo2tableModel1_Diaphra_tp5
        property real cd2tableModel1_Diaphra_tp5

        property real qexp3tableModel1_Diaphra_tp5
        property real dh3tableModel1_Diaphra_tp5
        property real qtheo3tableModel1_Diaphra_tp5
        property real cd3tableModel1_Diaphra_tp5

        property real d1_Diaphra_tp5
        property real d2_Diaphra_tp5

        property real cd1_Diaphra_tp5
        property real cd2_Diaphra_tp5
        property real cd3_Diaphra_tp5
        /////--Screen_tp6
        property int comboxballcurrentIndex_tp6
        property real roballgcm3_tp6
        property real dballmm_tp6
        property real cd_tp6
        property real rolgcm3_tp6
        property real viscoCinema_tp6

        property real dt_tp6
        property real dl_tp6
        property real a_tp6
        property real b_tp6
        property real c_tp6
        property real d_tp6

        property real t1_tp6
        property real t2_tp6
        property real t3_tp6
        property real t4_tp6
        property real t_moy

    }
    property string appVer: "1.9.7"
    ///property bool firstuseofapp
    property int scopeViewcount:scopeView.count
    property int tabBarcurrentIndex: 0

    property int comboxballcurrentIndex_tp1: 1
    property real roballgcm3_tp1
    property real rolgcm3_tp1
    property real dballmm_tp1
    property real k_tp1
    property real dt_tp1
    property real dl_tp1 /////en mm 2*50
    property real viscodynatheo_tp1
    property real viscodynamesur_tp1
    property real tempera_tp1:21
    property string labelhelp2_tp1text: "(0.6-10)"

    property bool runanimationhelp1_tp1: false
    property real miniinrangviscodynamesurBall1_tp1:0.6
    property real maxinrangviscodynamesurBall1_tp1:10
    property real miniinrangviscodynamesurBall2_tp1:9
    property real maxinrangviscodynamesurBall2_tp1:140
    property real miniinrangviscodynamesurBall3_tp1:40
    property real maxinrangviscodynamesurBall3_tp1:700
    property real miniinrangviscodynamesurBall4_tp1:150
    property real maxinrangviscodynamesurBall4_tp1:5000
    property real miniinrangviscodynamesurBall5_tp1:1500
    property real maxinrangviscodynamesurBall5_tp1:50000
    property real maxinrangviscodynamesurBall6_tp1:7500

    property real temperatableModel1_tp1:settings.temperatableModel1_tp1
    property real temperatableModel2_tp1:settings.temperatableModel2_tp1
    property real temperatableModel3_tp1:settings.temperatableModel3_tp1
    property real viscodynamesurtableModel1_tp1:settings.viscodynamesurtableModel1_tp1
    property real viscodynamesurtableModel2_tp1:settings.viscodynamesurtableModel2_tp1
    property real viscodynamesurtableModel3_tp1:settings.viscodynamesurtableModel3_tp1

    property int comboxballcurrentIndex_tp2: 0
    property real roballgcm3_tp2: 4.3
    property real rolgcm3_tp2: 0.949
    property real dballmm_tp2: 1.56
    property real dt_tp2: 16.5
    property real dl_tp2: 150 /////en mm
    property real viscodynatheo_tp2:488
    property real viscodynamesur_tp2:500

    property real mass:0
    property real mass_tp3:2.5
    property real diampiston_tp3:0.017655
    property string unitpression_tp3:"Pa"
    property real pressionmesur_tp3
    property int comboxunitpression_Index_tp3:0
    property real factunitpression:1
    property real masspiston_tp3:0.5 ///Kg
    property real degreBourdonGauge_tp3:0

    property real pressuretableModel1_tp3:settings.pressuretableModel1_tp3
    property real pressuretableModel2_tp3:settings.pressuretableModel2_tp3
    property real pressuretableModel3_tp3:settings.pressuretableModel3_tp3
    property real pressuretableModel4_tp3:settings.pressuretableModel4_tp3
    property real pressuretableModel5_tp3:settings.pressuretableModel5_tp3
    property real tensiontableModel1_tp3:settings.tensiontableModel1_tp3
    property real tensiontableModel2_tp3:settings.tensiontableModel2_tp3
    property real tensiontableModel3_tp3:settings.tensiontableModel3_tp3
    property real tensiontableModel4_tp3:settings.tensiontableModel4_tp3
    property real tensiontableModel5_tp3:settings.tensiontableModel5_tp3
    property real degreestableModel1_tp3:settings.degreestableModel1_tp3
    property real degreestableModel2_tp3:settings.degreestableModel2_tp3
    property real degreestableModel3_tp3:settings.degreestableModel3_tp3
    property real degreestableModel4_tp3:settings.degreestableModel4_tp3
    property real degreestableModel5_tp3:settings.degreestableModel5_tp3

    property bool radiobutton1ischecked_tp3
    property bool radiobutton2ischecked_tp3
    property bool radiobutton3ischecked_tp3
    property bool radiobutton4ischecked_tp3
    property bool radiobutton5ischecked_tp3
    property bool radiobutton6ischecked_tp3
    /////tp4
    property real rolkgm3_tp4:1000
    property real dQuadrant_tp4:0.100
    property real bQuadrant_tp4:0.075
    property real l_tp4:0.275
    property real h_tp4:0.200

    property real mPartially_sub_tp4
    property real dPartially_sub_tp4
    property real theoHydostaticF_Partially_sub_tp4
    property real theoCentrePressure_Partially_sub_tp4
    property real expCentrePressure_Partially_sub_tp4

    property real mFully_sub_tp4
    property real dFully_sub_tp4
    property real theoHydostaticF_Fully_sub_tp4
    property real theoCentrePressure_Fully_sub_tp4
    property real expCentrePressure_Fully_sub_tp4
    ///Screen_tp5
    property real volume1modelQexp_tp5:10
    property real temps1modelQexp_tp5:33.59
    property real qexp1modelQexp_tp5
    property real volume2modelQexp_tp5:15
    property real temps2modelQexp_tp5:48.25
    property real qexp2modelQexp_tp5
    property real volume3modelQexp_tp5:20
    property real temps3modelQexp_tp5:64.66
    property real qexp3modelQexp_tp5
    property real qexpMoy
    property real indexqexpMoy

    property real qexp1tableModel1_venturie_tp5:settings.qexp1tableModel1_venturie_tp5
    property real dh1tableModel1_venturie_tp5:settings.dh1tableModel1_venturie_tp5
    property real qtheo1tableModel1_venturie_tp5
    property real cd1tableModel1_venturie_tp5
    property real qexp2tableModel1_venturie_tp5:settings.qexp2tableModel1_venturie_tp5
    property real dh2tableModel1_venturie_tp5:settings.dh2tableModel1_venturie_tp5
    property real qtheo2tableModel1_venturie_tp5
    property real cd2tableModel1_venturie_tp5
    property real qexp3tableModel1_venturie_tp5:settings.qexp3tableModel1_venturie_tp5
    property real dh3tableModel1_venturie_tp5:settings.dh3tableModel1_venturie_tp5
    property real qtheo3tableModel1_venturie_tp5
    property real cd3tableModel1_venturie_tp5

    property real d1_tp5:39
    property real d2_tp5:18

    property real cd1_tp5
    property real cd2_tp5
    property real cd3_tp5

    ///-Diaphra
    property real volume1modelQexp_Diaphra_tp5
    property real temps1modelQexp_Diaphra_tp5
    property real qexp1modelQexp_Diaphra_tp5
    property real volume2modelQexp_Diaphra_tp5
    property real temps2modelQexp_Diaphra_tp5
    property real qexp2modelQexp_Diaphra_tp5
    property real volume3modelQexp_Diaphra_tp5
    property real temps3modelQexp_Diaphra_tp5
    property real qexp3modelQexp_Diaphra_tp5
    property real qexpMoy_Diaphra
    property real indexqexpMoy_Diaphra

    property real qexp1tableModel1_Diaphra_tp5:settings.qexp1tableModel1_Diaphra_tp5
    property real dh1tableModel1_Diaphra_tp5:settings.dh1tableModel1_Diaphra_tp5
    property real qtheo1tableModel1_Diaphra_tp5
    property real cd1tableModel1_Diaphra_tp5
    property real qexp2tableModel1_Diaphra_tp5:settings.qexp2tableModel1_Diaphra_tp5
    property real dh2tableModel1_Diaphra_tp5:settings.dh2tableModel1_Diaphra_tp5
    property real qtheo2tableModel1_Diaphra_tp5
    property real cd2tableModel1_Diaphra_tp5
    property real qexp3tableModel1_Diaphra_tp5:settings.qexp3tableModel1_Diaphra_tp5
    property real dh3tableModel1_Diaphra_tp5:settings.dh3tableModel1_Diaphra_tp5
    property real qtheo3tableModel1_Diaphra_tp5
    property real cd3tableModel1_Diaphra_tp5

    property real d1_Diaphra_tp5:39
    property real d2_Diaphra_tp5:22

    property real cd1_Diaphra_tp5
    property real cd2_Diaphra_tp5
    property real cd3_Diaphra_tp5
    /////--Screen_tp6
    property string fx
    property string fxprim
    property int comboxballcurrentIndex_tp6: 3
    property real roballgcm3_tp6
    property real dballmm_tp6
    property real cd_tp6
    property real rolgcm3_tp6
    property real viscoCinema_tp6

    property real dt_tp6
    property real dl_tp6
    property real a_tp6
    property real b_tp6
    property real c_tp6
    property real d_tp6

    property real t1_tp6
    property real t2_tp6
    property real t3_tp6
    property real t4_tp6
    property real t_moy

    function savesettings() {
        ///settings.firstuseofapp=firstuseofapp
        settings.comboxballcurrentIndex_tp1=comboxballcurrentIndex_tp1
        settings.roballgcm3_tp1=roballgcm3_tp1
        settings.dballmm_tp1=dballmm_tp1
        settings.rolgcm3_tp1=rolgcm3_tp1
        settings.k_tp1=k_tp1
        settings.dt_tp1=dt_tp1
        settings.dl_tp1=dl_tp1
        settings.viscodynatheo_tp1=viscodynatheo_tp1
        settings.viscodynamesur_tp1=viscodynamesur_tp1
        settings.tempera_tp1=tempera_tp1

        settings.temperatableModel1_tp1=temperatableModel1_tp1
        settings.temperatableModel2_tp1=temperatableModel2_tp1
        settings.temperatableModel3_tp1=temperatableModel3_tp1
        settings.viscodynamesurtableModel1_tp1=viscodynamesurtableModel1_tp1
        settings.viscodynamesurtableModel2_tp1=viscodynamesurtableModel2_tp1
        settings.viscodynamesurtableModel3_tp1=viscodynamesurtableModel3_tp1

        settings.comboxballcurrentIndex_tp2=comboxballcurrentIndex_tp2
        settings.roballgcm3_tp2=roballgcm3_tp2
        settings.dballmm_tp2=dballmm_tp2
        settings.rolgcm3_tp2=rolgcm3_tp2
        settings.dt_tp2=dt_tp2
        settings.dl_tp2=dl_tp2
        settings.viscodynatheo_tp2=viscodynatheo_tp2
        settings.viscodynamesur_tp2=viscodynamesur_tp2

        settings.mass_tp3=mass_tp3
        settings.diampiston_tp3=diampiston_tp3
        settings.unitpression_tp3=unitpression_tp3
        settings.comboxunitpression_Index_tp3=comboxunitpression_Index_tp3
        settings.masspiston_tp3=masspiston_tp3
        settings.degreBourdonGauge_tp3=degreBourdonGauge_tp3

        settings.pressuretableModel1_tp3=pressuretableModel1_tp3
        settings.pressuretableModel2_tp3=pressuretableModel2_tp3
        settings.pressuretableModel3_tp3=pressuretableModel3_tp3
        settings.pressuretableModel4_tp3=pressuretableModel4_tp3
        settings.pressuretableModel5_tp3=pressuretableModel5_tp3

        settings.tensiontableModel1_tp3=tensiontableModel1_tp3
        settings.tensiontableModel2_tp3=tensiontableModel2_tp3
        settings.tensiontableModel3_tp3=tensiontableModel3_tp3
        settings.tensiontableModel4_tp3=tensiontableModel4_tp3
        settings.tensiontableModel5_tp3=tensiontableModel5_tp3

        settings.degreestableModel1_tp3=degreestableModel1_tp3
        settings.degreestableModel2_tp3=degreestableModel2_tp3
        settings.degreestableModel3_tp3=degreestableModel3_tp3
        settings.degreestableModel4_tp3=degreestableModel4_tp3
        settings.degreestableModel5_tp3=degreestableModel5_tp3

        settings.radiobutton1ischecked_tp3=radiobutton1ischecked_tp3
        settings.radiobutton2ischecked_tp3=radiobutton2ischecked_tp3
        settings.radiobutton3ischecked_tp3=radiobutton3ischecked_tp3
        settings.radiobutton4ischecked_tp3=radiobutton4ischecked_tp3
        settings.radiobutton5ischecked_tp3=radiobutton5ischecked_tp3
        settings.radiobutton6ischecked_tp3=radiobutton6ischecked_tp3
        /////tp4
        settings.rolkgm3_tp4=rolkgm3_tp4
        settings.dQuadrant_tp4=dQuadrant_tp4
        settings.bQuadrant_tp4=bQuadrant_tp4
        settings.l_tp4=l_tp4
        settings.h_tp4=h_tp4

        settings.mPartially_sub_tp4=mPartially_sub_tp4
        settings.dPartially_sub_tp4=dPartially_sub_tp4
        settings.theoHydostaticF_Partially_sub_tp4=theoHydostaticF_Partially_sub_tp4
        settings.theoCentrePressure_Partially_sub_tp4=theoCentrePressure_Partially_sub_tp4
        settings.expCentrePressure_Partially_sub_tp4=expCentrePressure_Partially_sub_tp4

        settings.mFully_sub_tp4=mFully_sub_tp4
        settings.dFully_sub_tp4=dFully_sub_tp4
        settings.theoHydostaticF_Fully_sub_tp4=theoHydostaticF_Fully_sub_tp4
        settings.theoCentrePressure_Fully_sub_tp4=theoCentrePressure_Fully_sub_tp4
        settings.expCentrePressure_Fully_sub_tp4=expCentrePressure_Fully_sub_tp4
        ///Screen_tp5
        settings.volume1modelQexp_tp5=volume1modelQexp_tp5
        settings.temps1modelQexp_tp5=temps1modelQexp_tp5
        settings.qexp1modelQexp_tp5=qexp1modelQexp_tp5
        settings.volume2modelQexp_tp5=volume2modelQexp_tp5
        settings.temps2modelQexp_tp5=temps2modelQexp_tp5
        settings.qexp2modelQexp_tp5=qexp2modelQexp_tp5
        settings.volume3modelQexp_tp5=volume3modelQexp_tp5
        settings.temps3modelQexp_tp5=temps3modelQexp_tp5
        settings.qexp3modelQexp_tp5=qexp3modelQexp_tp5

        settings.qexp1tableModel1_venturie_tp5=qexp1tableModel1_venturie_tp5
        settings.dh1tableModel1_venturie_tp5=dh1tableModel1_venturie_tp5
        settings.qtheo1tableModel1_venturie_tp5=qtheo1tableModel1_venturie_tp5
        settings.cd1tableModel1_venturie_tp5=cd1tableModel1_venturie_tp5
        settings.qexp2tableModel1_venturie_tp5=qexp2tableModel1_venturie_tp5
        settings.dh2tableModel1_venturie_tp5=dh2tableModel1_venturie_tp5
        settings.qtheo2tableModel1_venturie_tp5=qtheo2tableModel1_venturie_tp5
        settings.cd2tableModel1_venturie_tp5=cd2tableModel1_venturie_tp5

        settings.qexp3tableModel1_venturie_tp5=qexp3tableModel1_venturie_tp5
        settings.dh3tableModel1_venturie_tp5=dh3tableModel1_venturie_tp5
        settings.qtheo3tableModel1_venturie_tp5=qtheo3tableModel1_venturie_tp5
        settings.cd3tableModel1_venturie_tp5=cd3tableModel1_venturie_tp5

        settings.d1_tp5=d1_tp5
        settings.d2_tp5=d2_tp5

        settings.cd1_tp5=cd1_tp5
        settings.cd2_tp5=cd2_tp5
        settings.cd3_tp5=cd3_tp5
        ///Screen_tp5_Diaphra
        settings.volume1modelQexp_Diaphra_tp5=volume1modelQexp_Diaphra_tp5
        settings.temps1modelQexp_Diaphra_tp5=temps1modelQexp_Diaphra_tp5
        settings.qexp1modelQexp_Diaphra_tp5=qexp1modelQexp_Diaphra_tp5
        settings.volume2modelQexp_Diaphra_tp5=volume2modelQexp_Diaphra_tp5
        settings.temps2modelQexp_Diaphra_tp5=temps2modelQexp_Diaphra_tp5
        settings.qexp2modelQexp_Diaphra_tp5=qexp2modelQexp_Diaphra_tp5
        settings.volume3modelQexp_Diaphra_tp5=volume3modelQexp_Diaphra_tp5
        settings.temps3modelQexp_Diaphra_tp5=temps3modelQexp_Diaphra_tp5
        settings.qexp3modelQexp_Diaphra_tp5=qexp3modelQexp_Diaphra_tp5

        settings.qexp1tableModel1_Diaphra_tp5=qexp1tableModel1_Diaphra_tp5
        settings.dh1tableModel1_Diaphra_tp5=dh1tableModel1_Diaphra_tp5
        settings.qtheo1tableModel1_Diaphra_tp5=qtheo1tableModel1_Diaphra_tp5
        settings.cd1tableModel1_Diaphra_tp5=cd1tableModel1_Diaphra_tp5
        settings.qexp2tableModel1_Diaphra_tp5=qexp2tableModel1_Diaphra_tp5
        settings.dh2tableModel1_Diaphra_tp5=dh2tableModel1_Diaphra_tp5
        settings.qtheo2tableModel1_Diaphra_tp5=qtheo2tableModel1_Diaphra_tp5
        settings.cd2tableModel1_Diaphra_tp5=cd2tableModel1_Diaphra_tp5

        settings.qexp3tableModel1_Diaphra_tp5=qexp3tableModel1_Diaphra_tp5
        settings.dh3tableModel1_Diaphra_tp5=dh3tableModel1_Diaphra_tp5
        settings.qtheo3tableModel1_Diaphra_tp5=qtheo3tableModel1_Diaphra_tp5
        settings.cd3tableModel1_Diaphra_tp5=cd3tableModel1_Diaphra_tp5

        settings.d1_Diaphra_tp5=d1_Diaphra_tp5
        settings.d2_Diaphra_tp5=d2_Diaphra_tp5

        settings.cd1_Diaphra_tp5=cd1_Diaphra_tp5
        settings.cd2_Diaphra_tp5=cd2_Diaphra_tp5
        settings.cd3_Diaphra_tp5=cd3_Diaphra_tp5
        /////--Screen_tp6
        settings.comboxballcurrentIndex_tp6=comboxballcurrentIndex_tp6
        settings.roballgcm3_tp6=roballgcm3_tp6
        settings.dballmm_tp6=dballmm_tp6
        settings.cd_tp6=cd_tp6
        settings.rolgcm3_tp6=rolgcm3_tp6
        settings.viscoCinema_tp6=viscoCinema_tp6
        settings.dt_tp6=dt_tp6
        settings.dl_tp6=dl_tp6
        settings.a_tp6=a_tp6
        settings.b_tp6=b_tp6
        settings.c_tp6=c_tp6
        settings.d_tp6=d_tp6

    }
    function loadsettings() {
        ///firstuseofapp=settings.firstuseofapp
        comboxballcurrentIndex_tp1=settings.comboxballcurrentIndex_tp1
        roballgcm3_tp1=settings.roballgcm3_tp1
        dballmm_tp1=settings.dballmm_tp1
        rolgcm3_tp1=settings.rolgcm3_tp1
        k_tp1=settings.k_tp1
        dt_tp1=settings.dt_tp1
        dl_tp1=settings.dl_tp1
        viscodynamesur_tp1=settings.viscodynamesur_tp1
        viscodynatheo_tp1=settings.viscodynatheo_tp1
        tempera_tp1=settings.tempera_tp1

        temperatableModel1_tp1=settings.temperatableModel1_tp1
        temperatableModel2_tp1=settings.temperatableModel2_tp1
        temperatableModel3_tp1=settings.temperatableModel3_tp1
        viscodynamesurtableModel1_tp1=settings.viscodynamesurtableModel1_tp1
        viscodynamesurtableModel2_tp1=settings.viscodynamesurtableModel2_tp1
        viscodynamesurtableModel3_tp1=settings.viscodynamesurtableModel3_tp1

        comboxballcurrentIndex_tp2=settings.comboxballcurrentIndex_tp2
        roballgcm3_tp2=settings.roballgcm3_tp2
        dballmm_tp2=settings.dballmm_tp2
        rolgcm3_tp2=settings.rolgcm3_tp2
        dt_tp2=settings.dt_tp2
        dl_tp2=settings.dl_tp2
        viscodynamesur_tp2=settings.viscodynamesur_tp2
        viscodynatheo_tp2=settings.viscodynatheo_tp2

        mass_tp3=settings.mass_tp3
        diampiston_tp3=settings.diampiston_tp3
        unitpression_tp3=settings.unitpression_tp3
        comboxunitpression_Index_tp3=settings.comboxunitpression_Index_tp3
        masspiston_tp3=settings.masspiston_tp3
        degreBourdonGauge_tp3=settings.degreBourdonGauge_tp3

        pressuretableModel1_tp3=settings.pressuretableModel1_tp3
        pressuretableModel2_tp3=settings.pressuretableModel2_tp3
        pressuretableModel3_tp3=settings.pressuretableModel3_tp3
        pressuretableModel4_tp3=settings.pressuretableModel4_tp3
        pressuretableModel5_tp3=settings.pressuretableModel5_tp3

        tensiontableModel1_tp3=settings.tensiontableModel1_tp3
        tensiontableModel2_tp3=settings.tensiontableModel2_tp3
        tensiontableModel3_tp3=settings.tensiontableModel3_tp3
        tensiontableModel4_tp3=settings.tensiontableModel4_tp3
        tensiontableModel5_tp3=settings.tensiontableModel5_tp3

        degreestableModel1_tp3=settings.degreestableModel1_tp3
        degreestableModel2_tp3=settings.degreestableModel2_tp3
        degreestableModel3_tp3=settings.degreestableModel3_tp3
        degreestableModel4_tp3=settings.degreestableModel4_tp3
        degreestableModel5_tp3=settings.degreestableModel5_tp3

        radiobutton1ischecked_tp3=settings.radiobutton1ischecked_tp3
        radiobutton2ischecked_tp3=settings.radiobutton2ischecked_tp3
        radiobutton3ischecked_tp3=settings.radiobutton3ischecked_tp3
        radiobutton4ischecked_tp3=settings.radiobutton4ischecked_tp3
        radiobutton5ischecked_tp3=settings.radiobutton5ischecked_tp3
        radiobutton6ischecked_tp3=settings.radiobutton6ischecked_tp3
        /////tp4
        rolkgm3_tp4=settings.rolkgm3_tp4
        dQuadrant_tp4=settings.dQuadrant_tp4
        bQuadrant_tp4=settings.bQuadrant_tp4
        l_tp4=settings.l_tp4
        h_tp4=settings.h_tp4

        mPartially_sub_tp4=settings.mPartially_sub_tp4
        dPartially_sub_tp4=settings.dPartially_sub_tp4
        theoHydostaticF_Partially_sub_tp4=settings.theoHydostaticF_Partially_sub_tp4
        theoCentrePressure_Partially_sub_tp4=settings.theoCentrePressure_Partially_sub_tp4
        expCentrePressure_Partially_sub_tp4=settings.expCentrePressure_Partially_sub_tp4

        mFully_sub_tp4=settings.mFully_sub_tp4
        dFully_sub_tp4=settings.dFully_sub_tp4
        theoHydostaticF_Fully_sub_tp4=settings.theoHydostaticF_Fully_sub_tp4
        theoCentrePressure_Fully_sub_tp4=settings.theoCentrePressure_Fully_sub_tp4
        expCentrePressure_Fully_sub_tp4=settings.expCentrePressure_Fully_sub_tp4
        ///Screen_tp5
        volume1modelQexp_tp5=settings.volume1modelQexp_tp5
        temps1modelQexp_tp5=settings.temps1modelQexp_tp5
        qexp1modelQexp_tp5=settings.qexp1modelQexp_tp5
        volume2modelQexp_tp5=settings.volume2modelQexp_tp5
        temps2modelQexp_tp5=settings.temps2modelQexp_tp5
        qexp2modelQexp_tp5=settings.qexp2modelQexp_tp5
        volume3modelQexp_tp5=settings.volume3modelQexp_tp5
        temps3modelQexp_tp5=settings.temps3modelQexp_tp5
        qexp3modelQexp_tp5=settings.qexp3modelQexp_tp5

        qexp1tableModel1_venturie_tp5=settings.qexp1tableModel1_venturie_tp5
        dh1tableModel1_venturie_tp5=settings.dh1tableModel1_venturie_tp5
        qtheo1tableModel1_venturie_tp5=settings.qtheo1tableModel1_venturie_tp5
        cd1tableModel1_venturie_tp5=settings.cd1tableModel1_venturie_tp5

        qexp2tableModel1_venturie_tp5=settings.qexp2tableModel1_venturie_tp5
        dh2tableModel1_venturie_tp5=settings.dh2tableModel1_venturie_tp5
        qtheo2tableModel1_venturie_tp5=settings.qtheo2tableModel1_venturie_tp5
        cd2tableModel1_venturie_tp5=settings.cd2tableModel1_venturie_tp5

        qexp3tableModel1_venturie_tp5=settings.qexp3tableModel1_venturie_tp5
        dh3tableModel1_venturie_tp5=settings.dh3tableModel1_venturie_tp5
        qtheo3tableModel1_venturie_tp5=settings.qtheo3tableModel1_venturie_tp5
        cd3tableModel1_venturie_tp5=settings.cd3tableModel1_venturie_tp5

        d1_tp5=settings.d1_tp5
        d2_tp5=settings.d2_tp5

        cd1_tp5=settings.cd1_tp5
        cd2_tp5=settings.cd2_tp5
        ///Screen_tp5_Diaphra
        volume1modelQexp_Diaphra_tp5=settings.volume1modelQexp_Diaphra_tp5
        temps1modelQexp_Diaphra_tp5=settings.temps1modelQexp_Diaphra_tp5
        qexp1modelQexp_Diaphra_tp5=settings.qexp1modelQexp_Diaphra_tp5
        volume2modelQexp_Diaphra_tp5=settings.volume2modelQexp_Diaphra_tp5
        temps2modelQexp_Diaphra_tp5=settings.temps2modelQexp_Diaphra_tp5
        qexp2modelQexp_Diaphra_tp5=settings.qexp2modelQexp_Diaphra_tp5
        volume3modelQexp_Diaphra_tp5=settings.volume3modelQexp_Diaphra_tp5
        temps3modelQexp_Diaphra_tp5=settings.temps3modelQexp_Diaphra_tp5
        qexp3modelQexp_Diaphra_tp5=settings.qexp3modelQexp_Diaphra_tp5

        qexp1tableModel1_Diaphra_tp5=settings.qexp1tableModel1_Diaphra_tp5
        dh1tableModel1_Diaphra_tp5=settings.dh1tableModel1_Diaphra_tp5
        qtheo1tableModel1_Diaphra_tp5=settings.qtheo1tableModel1_Diaphra_tp5
        cd1tableModel1_Diaphra_tp5=settings.cd1tableModel1_Diaphra_tp5
        qexp2tableModel1_Diaphra_tp5=settings.qexp2tableModel1_Diaphra_tp5
        dh2tableModel1_Diaphra_tp5=settings.dh2tableModel1_Diaphra_tp5
        qtheo2tableModel1_Diaphra_tp5=settings.qtheo2tableModel1_Diaphra_tp5
        cd2tableModel1_Diaphra_tp5=settings.cd2tableModel1_Diaphra_tp5

        qexp3tableModel1_Diaphra_tp5=settings.qexp3tableModel1_Diaphra_tp5
        dh3tableModel1_Diaphra_tp5=settings.dh3tableModel1_Diaphra_tp5
        qtheo3tableModel1_Diaphra_tp5=settings.qtheo3tableModel1_Diaphra_tp5
        cd3tableModel1_Diaphra_tp5=settings.cd3tableModel1_Diaphra_tp5

        d1_Diaphra_tp5=settings.d1_Diaphra_tp5
        d2_Diaphra_tp5=settings.d2_Diaphra_tp5

        cd1_Diaphra_tp5=settings.cd1_Diaphra_tp5
        cd2_Diaphra_tp5=settings.cd2_Diaphra_tp5
        cd3_Diaphra_tp5=settings.cd3_Diaphra_tp5
        /////--Screen_tp6
        comboxballcurrentIndex_tp6=settings.comboxballcurrentIndex_tp6
        roballgcm3_tp6=settings.roballgcm3_tp6
        dballmm_tp6=settings.dballmm_tp6
        cd_tp6=settings.cd_tp6
        rolgcm3_tp6=settings.rolgcm3_tp6
        viscoCinema_tp6=settings.viscoCinema_tp6
        dt_tp6=settings.dt_tp6
        dl_tp6=settings.dl_tp6
        a_tp6=settings.a_tp6
        b_tp6=settings.b_tp6
        c_tp6=settings.c_tp6
        d_tp6=settings.d_tp6

    }
    function loaddefaultsettings() {
       /// firstuseofapp=true
        tabBarcurrentIndex= 0
        comboxballcurrentIndex_tp1= 1
        roballgcm3_tp1= 2.2
        rolgcm3_tp1= 1.18
        dballmm_tp1= 15.6
        k_tp1= 0.09
        dt_tp1= 61
        dl_tp1= 100 /////en mm 2*50
        viscodynatheo_tp1=5.59
        viscodynamesur_tp1=5.6
        tempera_tp1=21

        temperatableModel1_tp1=20
        temperatableModel2_tp1=25
        temperatableModel3_tp1=35
        viscodynamesurtableModel1_tp1=5.59
        viscodynamesurtableModel2_tp1=4.51
        viscodynamesurtableModel3_tp1=3.51

        comboxballcurrentIndex_tp2= 0
        roballgcm3_tp2= 4.3
        rolgcm3_tp2= 0.949
        dballmm_tp2= 1.56
        dt_tp2= 16.5
        dl_tp2= 150 /////en mm
        viscodynatheo_tp2=500
        viscodynamesur_tp2=489

        mass_tp3=0.25
        diampiston_tp3=0.017655
        unitpression_tp3="Pa"
        comboxunitpression_Index_tp3=0
        masspiston_tp3=0.5
        degreBourdonGauge_tp3=0

        pressuretableModel1_tp3=40.072
        pressuretableModel2_tp3=60.108
        pressuretableModel3_tp3=80.144
        pressuretableModel4_tp3=100.181
        pressuretableModel5_tp3=120.217
        tensiontableModel1_tp3=14.6
        tensiontableModel2_tp3=21.6
        tensiontableModel3_tp3=30
        tensiontableModel4_tp3=38
        tensiontableModel5_tp3=47
        degreestableModel1_tp3=50
        degreestableModel2_tp3=77
        degreestableModel3_tp3=100
        degreestableModel4_tp3=125
        degreestableModel5_tp3=151

        radiobutton1ischecked_tp3=true
        radiobutton2ischecked_tp3=false
        radiobutton3ischecked_tp3=false
        radiobutton4ischecked_tp3=false
        radiobutton5ischecked_tp3=false
        radiobutton6ischecked_tp3=false
        /////tp4
        rolkgm3_tp4=1000
        dQuadrant_tp4=0.100
        bQuadrant_tp4=0.075
        l_tp4=0.275
        h_tp4=0.200

        mPartially_sub_tp4=180  ///g
        dPartially_sub_tp4=89 ///mm
        mFully_sub_tp4=320
        dFully_sub_tp4=124

        ///Screen_tp5
        volume1modelQexp_tp5=10
        temps1modelQexp_tp5=33.59
        qexp1modelQexp_tp5=0.298
        volume2modelQexp_tp5=15
        temps2modelQexp_tp5=48.25
        qexp2modelQexp_tp5=0.311
        volume3modelQexp_tp5=20
        temps3modelQexp_tp5=64.66
        qexp3modelQexp_tp5=0.309

        qexp1tableModel1_venturie_tp5=0.306
        dh1tableModel1_venturie_tp5=75
        qtheo1tableModel1_venturie_tp5=0
        cd1tableModel1_venturie_tp5=0

        qexp2tableModel1_venturie_tp5=0.462
        dh2tableModel1_venturie_tp5=195
        qtheo2tableModel1_venturie_tp5=0
        cd2tableModel1_venturie_tp5=0

        qexp3tableModel1_venturie_tp5=0.639
        dh3tableModel1_venturie_tp5=310
        qtheo3tableModel1_venturie_tp5=0
        cd3tableModel1_venturie_tp5=0

        d1_tp5=39
        d2_tp5=18

        cd1_tp5=0.98
        cd2_tp5=0.65
        ///Screen_tp5_Diaphra
        volume1modelQexp_Diaphra_tp5=4
        temps1modelQexp_Diaphra_tp5=14
        qexp1modelQexp_Diaphra_tp5=0.286
        volume2modelQexp_Diaphra_tp5=10
        temps2modelQexp_Diaphra_tp5=35.40
        qexp2modelQexp_Diaphra_tp5=0.282
        volume3modelQexp_Diaphra_tp5=20
        temps3modelQexp_Diaphra_tp5=70.85
        qexp3modelQexp_Diaphra_tp5=0.282

        qexp1tableModel1_Diaphra_tp5=0.283
        dh1tableModel1_Diaphra_tp5=60
        qtheo1tableModel1_Diaphra_tp5=0
        cd1tableModel1_Diaphra_tp5=0

        qexp2tableModel1_Diaphra_tp5=0.500
        dh2tableModel1_Diaphra_tp5=205
        qtheo2tableModel1_Diaphra_tp5=0
        cd2tableModel1_Diaphra_tp5=0

        qexp3tableModel1_Diaphra_tp5=0.559
        dh3tableModel1_Diaphra_tp5=250
        qtheo3tableModel1_Diaphra_tp5=0
        cd3tableModel1_Diaphra_tp5=0

        d1_Diaphra_tp5=39
        d2_Diaphra_tp5=22

        cd1_Diaphra_tp5=0.98
        cd2_Diaphra_tp5=0.98
        /////--Screen_tp6
        comboxballcurrentIndex_tp6= 3
        roballgcm3_tp6=1.43
        dballmm_tp6=5
        cd_tp6=0.44
        rolgcm3_tp6=1
        viscoCinema_tp6=1.124e-6
        dt_tp6=4.62
        dl_tp6=1000
        a_tp6=0
        b_tp6=0
        c_tp6=0
        d_tp6=0


    }

    ToolBar {
        id: toolBar
        width: parent.width
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("⋮")///+settings.firstuseofapp
                onClicked: contextMenu.open()
            }
            ToolButton {
                text: qsTr("Exit")
                onClicked: {Qt.callLater(Qt.quit) ;savesettings()}
            }
            Label {
                text: qsTr("Practical Experiences in Hydraulics Laboratory")
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

        }
    }

    Menu {
        id: contextMenu
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        MenuItem {
            text: qsTr("About")
            onTriggered: aboutappDialog.open()
        }
        MenuSeparator {}
        MenuItem {
            property string link1: "https://sites.google.com/view/tp-labo-hydraulique/tp1";
            property string link2: "https://sites.google.com/view/tp-labo-hydraulique/tp2";
            property string link3: "https://sites.google.com/view/tp-labo-hydraulique/tp3";
            property string link4: "https://sites.google.com/view/tp-labo-hydraulique/tp4";
            property string link5: "https://sites.google.com/view/tp-labo-hydraulique/tp5";
            property string link6: "https://sites.google.com/view/tp-labo-hydraulique/tp6";
            text: qsTr("Help")
            onTriggered:{
                if(tabBarcurrentIndex===0 ) Qt.openUrlExternally(link1);
                if(tabBarcurrentIndex===1 ) Qt.openUrlExternally(link2);
                if(tabBarcurrentIndex===2 ) Qt.openUrlExternally(link3);
                if(tabBarcurrentIndex===3 ) Qt.openUrlExternally(link4);
                if(tabBarcurrentIndex===4 ) Qt.openUrlExternally(link5);
                if(tabBarcurrentIndex===5 ) Qt.openUrlExternally(link6);
            }
        }
        MenuSeparator {}
        MenuItem {
            text: qsTr("Load default settings")
            onTriggered: loaddefaultsettingsDialog.open()
        }
    }

    // AboutDialog {
    //     id: aboutDialog
    // }

    property string link: "mailto:thakir.dz@gmail.com?subject=About%20Fluid%20Mechanics%20Lab%20Calc.%20(Ver: "+appVer+")%20 ; On " +Qt.platform.os
    Dialog {
        id: aboutappDialog
        title: "TP LABO Hydraulique ver "+appVer
        anchors.centerIn: Overlay.overlay
        Text {
            id:textaboutdialog_tp
            width: parent.width
            text: "M. HAFIANE Mohamed in collaboration with: M. CHAFI Chafi and M. ZERAGUET Mohamed ; "+
                  "If you found any bug, please contact me in e-mail: <a href=\"mailto:thakir.dz@gmail.com?subject=About%20Fluid%20Mechanics%20Lab%20Calc.%20(Ver: "+appVer+")%20 ; On " +Qt.platform.os+" \">thakir.dz@gmail.com</a>"
            wrapMode: Text.WordWrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        standardButtons: Dialog.Ok
        onAccepted: close()
    }
    Dialog {
        id: firstuseofappDialog
        title: "TP LABO Hydraulique ver "+appVer
        anchors.centerIn: Overlay.overlay
        Text {
            id:textfirstuseofappdialog_tp
            width: parent.width
            text: "Hopefully this application will help you in your practical experience in a fluid mechanics lab. "+
                  "If you found any bug, please contact me in e-mail: <a href=\"mailto:thakir.dz@gmail.com?subject=About%20Fluid%20Mechanics%20Lab%20Calc.%20(Ver: "+appVer+")%20 On " +Qt.platform.os+" \">thakir.dz@gmail.com</a>"
            wrapMode: Text.Wrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            /// linkColor: "#ffffff"
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }
        standardButtons: Dialog.Ok
        onAccepted: {
           /// firstuseofapp=false;
            settings.firstuseofapp=false
            savesettings();
            close()
        }
    }
    Connections {
        target: textfirstuseofappdialog_tp
        function onLinkActivated() {
            Qt.openUrlExternally(firstuseofapp)
        }
    }

    Connections {
        target: textaboutdialog_tp
        function onLinkActivated() {
            Qt.openUrlExternally(link)
        }
    }

    Dialog {
        id: loaddefaultsettingsDialog
        title: "TP LABO Hydraulique ver "+appVer
        anchors.centerIn: Overlay.overlay
        Text {
            id:textdialog_tp
            width: parent.width
            text:  qsTr("You must close and re-open the application to load default settings")
            wrapMode: Text.WordWrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {Qt.callLater(Qt.quit);loaddefaultsettings();close()}
        onRejected: console.log("Cancel clicked")
    }
    ////////////
    Row {
        id:rowtp1
        width: parent.width
        anchors.top: toolBar.bottom
        height: 150
        Rectangle {
            id:rect
            width: parent.width-imagelogouniv_tp1.width
            height: 150
            ///color:"transparent"
            color: Material.dialogColor
            ListModel {
                id: nameModel
                ListElement { file: "images/TP_Viscosim_bille1.jpg"
                    name: "TP1"}
                ListElement { file: "images/TP_Viscosim_bille2.jpg"
                    name: "TP2_HM 135 GUNT"}
                ListElement { file: "images/TP_Calibrage_Sonde_Pression.jpg"
                    name: "TP3" }
                ListElement { file: "images/TP_Force_pression.jpg"
                    name: "TP4_F1-12 Hydrostatic Pressure"}
                ListElement { file: "images/TP_Flowmeter_Demonstrator.jpg"
                    name: "TP5_C9-MKII Flowmeter Demonstrator"}
                ListElement { file: "images/TP_Vitesse_Sedimentation.jpg"
                    name: "TP6_" }
                ListElement { file: "images/TP_Cavitation.jpg"
                    name: "TP7" }
                ListElement { file: "images/TP_Cheminet_Equilibre.jpg"
                    name: "TP8" }

            }
            //--> slide
            Component {
                id: nameDelegate
                Column {
                    opacity: PathView.opacity
                    z: PathView.z
                    scale: PathView.scale
                    Image { //--> collapse
                        anchors.horizontalCenter: delegateText.horizontalCenter
                        source: model.file; width: 150; height: 150; smooth: true
                        fillMode: Image.PreserveAspectFit
                    }//<-- collapse
                    Text {//--> collapse
                        id: delegateText
                        //     text: model.name; font.pixelSize: 24
                    }//<-- collapse
                }
            }
            //<-- slide
            PathView {
                anchors.fill: parent
                model: nameModel
                delegate: nameDelegate
                focus: true
                id: pathView
                onCurrentIndexChanged: tabBarcurrentIndex=pathView.currentIndex
                path: Path {
                    // Front
                    startX: 150; startY: 100
                    PathAttribute { name: "opacity"; value: 1.0 }
                    PathAttribute { name: "scale"; value: 1.0 }
                    PathAttribute { name: "z"; value: 0 }

                    // Left
                    PathCubic { x: 50; y: 50; control1X: 100; control1Y: 100
                        control2X: 50; control2Y: 75 }
                    PathAttribute { name: "opacity"; value: 0.5 }
                    PathAttribute { name: "scale"; value: 0.5 }
                    PathAttribute { name: "z"; value: -1 }

                    // Top
                    PathCubic { x: 150; y: 20; control1X: 50; control1Y: 35
                        control2X: 100; control2Y: 20 }
                    PathAttribute { name: "opacity"; value: 0.25 }
                    PathAttribute { name: "scale"; value: 0.25 }
                    PathAttribute { name: "z"; value: -2 }

                    // Right
                    PathCubic { x: 250; y: 50; control1X: 200; control1Y: 20
                        control2X: 250; control2Y: 35 }
                    PathAttribute { name: "opacity"; value: 0.5 }
                    PathAttribute { name: "scale"; value: 0.5 }
                    PathAttribute { name: "z"; value: -1 }

                    PathCubic { x: 150; y: 100; control1X: 250; control1Y: 75
                        control2X: 200; control2Y: 100 }
                }
                Keys.onLeftPressed: decrementCurrentIndex()
                Keys.onRightPressed: incrementCurrentIndex()
            }
        }
        Rectangle {
            id:rect_image_US
            width: parent.width-imagelogouniv_tp1.width
            height: 150
            ///color:"transparent"
            color: Material.dialogColor
        Image {
            id: imagelogouniv_tp1
            width: parent.width/5
            smooth: true
            fillMode: Image.PreserveAspectFit
            source: "images/log_universite_SAIDA.png"
        }
        }
    }
    TabBar {
        id: tabBar
        // anchors.top: rect.bottom
        // anchors.right: parent.right
        // anchors.left: parent.left
        visible: false
        currentIndex: tabBarcurrentIndex

        TabButton {
            text: qsTr("Viscosimètre Höppler à chute de bille ('Leybold')")
        }
        TabButton {
            text: qsTr("Méthode tube vertical")
        }
        TabButton {
            text: qsTr("Pressure Measurement and Calibration – TH2")
        }
    }

    ScopeView {
        id: scopeView
        anchors.top: rowtp1.bottom
        width: parent.width
        height: app.height
    }

    Component.onCompleted: {
        if (settings.firstuseofapp || settings.scopeViewcount!==scopeViewcount) {
            // ... first run
            firstuseofappDialog.open()
            settings.firstuseofapp = false
            settings.scopeViewcount=scopeViewcount
            loaddefaultsettings()
        } else {
            // ... not first run
            loadsettings();
        }
      ///tabBar.currentIndex=2; ///temp
    }
    Component.onDestruction: {
        savesettings();
        // firstuseofapp=false;
        // settings.firstuseofapp=firstuseofapp
    }
}
