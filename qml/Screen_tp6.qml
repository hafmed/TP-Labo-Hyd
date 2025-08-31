import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12
import Qt.labs.qmlmodels 1.0
import QtCharts
import QtQuick.Layouts

Rectangle {
    width: app.width
    height: app.height-rect.height

    color: Material.dialogColor

    property real vtheo
    property int nt1:1
    property int nt2:1
    property int nt3:1
    property int nt4:1

    function configcaractball_tp6(index) {
        comboxballcurrentIndex_tp6=index
        if (index===0) {roballgcm3_tp6=2.86 ; dballmm_tp6=10 }
        if (index===1) {roballgcm3_tp6=2.86 ; dballmm_tp6=5 }
        if (index===2) {roballgcm3_tp6=1.43 ; dballmm_tp6=10 }
        if (index===3) {roballgcm3_tp6=1.43 ; dballmm_tp6=5 }
        if (index===4) {roballgcm3_tp6=1.15 ; dballmm_tp6=10 }
        savesettings()
    }
    function calculABCD(){
        a_tp6=(Math.pow(dballmm_tp6*0.001,2)*Math.pow(9.81,2))/9*Math.pow((roballgcm3_tp6/rolgcm3_tp6-1),2)
        b_tp6=-(dballmm_tp6*0.001*9.81*cd_tp6)/6*(roballgcm3_tp6/rolgcm3_tp6-1)
        c_tp6=-Math.pow(1.328,2)*viscoCinema_tp6/(dballmm_tp6*0.001)
        d_tp6=Math.pow(cd_tp6,2)/16
        savesettings();
    }
    function showMessageBox() {
        return dialogMessageErrorFparser.open()
    }
    Connections {
        target: CalculHaf
        function onRequestDialog(title,error){
            dialogMessageErrorFparser.title=title
            textfirstuseofappdialog_tp.text=error
            dialogMessageErrorFparser.open()

        }
        function onRequestXi(i,xi){
            tableModelxi_tp6.appendRow({i:i,xi:xi})
        }
        function onRequestVtheo(Vtheo){
            vtheo=1/Vtheo
        }
        function onRequestSelectEndtable(){
            tableVerticalBarxi_tp6.setPosition(1 - tableVerticalBarxi_tp6.size)
        }
    }
    Dialog {
        id: dialogMessageErrorFparser
        title: "TP LABO Hydraulique ver "+appVer
        anchors.centerIn: Overlay.overlay
        Text {
            id:textfirstuseofappdialog_tp
            width: parent.width
            text: "Error"
            wrapMode: Text.Wrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        standardButtons: Dialog.Ok
        onAccepted: {
            close()
        }
    }
    Dialog {
        id: dialogCalculTmoy
        width: parent.width
        height: 285
        anchors.centerIn: Overlay.overlay
        Column {
            width: parent.width
            spacing: 7
            Row {
                width: parent.width
                TextField {
                    id:textt1_tp6
                    width: parent.width/2
                    placeholderText: qsTr("t1 (s)")
                    text: settings.t1_tp6
                    color: Math.abs((t1_tp6-t_moy)/t_moy*100)>5? "red": "green"
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (settings.t1_tp6==="nan" || settings.t1_tp6==="NaN") textt1_tp6.text=0 ;
                        t1_tp6=textt1_tp6.text
                        if (t1_tp6==="" || t1_tp6===0) {
                            nt1=0
                        }else{
                            nt1=1
                        }
                    }
                }
                TextField {
                    id:textt2_tp6
                    width: parent.width/2
                    placeholderText: qsTr("t2 (s)")
                    text: settings.t2_tp6
                    color: Math.abs((t2_tp6-t_moy)/t_moy*100)>5? "red": "green"
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (settings.t2_tp6==="nan" || settings.t2_tp6==="NaN") textt2_tp6.text=0 ;
                        t2_tp6=textt2_tp6.text
                        if (t2_tp6==="" || t2_tp6===0) {
                            nt2=0
                        }else{
                            nt2=1
                        }
                    }
                }
            }
            Row {
                width: parent.width
                TextField {
                    id:textt3_tp6
                    width: parent.width/2
                    placeholderText: qsTr("t3 (s)")
                    text: settings.t3_tp6
                    color: Math.abs((t3_tp6-t_moy)/t_moy*100)>5? "red": "green"
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (settings.t3_tp6==="nan" || settings.t3_tp6==="NaN") textt3_tp6.text=0 ;
                        t3_tp6=textt3_tp6.text
                        if (t3_tp6==="" || t3_tp6===0) {
                            nt3=0
                        }else{
                            nt3=1
                        }
                    }
                }
                TextField {
                    id:textt4_tp6
                    width: parent.width/2
                    placeholderText: qsTr("t4 (s)")
                    text: settings.t4_tp6
                    color: Math.abs((t4_tp6-t_moy)/t_moy*100)>5? "red": "green"
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (settings.t4_tp6==="nan" || settings.t4_tp6==="NaN") textt4_tp6.text=0 ;
                        t4_tp6=textt4_tp6.text
                        if (t4_tp6==="" || t4_tp6===0) {
                            nt4=0
                        }else{
                            nt4=1
                        }
                    }
                }
            }
            Row {
                width: parent.width
                spacing: 0
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_tmoy_tp6.width)/2
                    orientation: Qt.Horizontal
                }
                TextField {
                    id:label1_tmoy_tp6
                    width: 150
                    placeholderText: qsTr("t_average (s)")
                    text: (nt1+nt2+nt3+nt4)!==0? ((t1_tp6+t2_tp6+t3_tp6+t4_tp6)/(nt1+nt2+nt3+nt4)).toFixed(2) : 0
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: t_moy=label1_tmoy_tp6.text
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_tmoy_tp6.width)/2
                    orientation: Qt.Horizontal
                }
            }

            Row {
                width: parent.width
                spacing: 0
                Label{
                    id:lable10
                    text:"|(t_i-t_aver)/t_aver|<5%"
                }
            }
        }
        standardButtons: Dialog.Ok
        onAccepted: {
            textdt_tp6.text=t_moy
            close()
        }
    }

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: parent.width
        contentHeight: column1_tp6.height+50
        Column {
            id:column1_tp6
            width: parent.width
            anchors.margins: 10
            spacing: 10
            ComboBox {
                id:comboxball_tp6
                width: parent.width
                model: ["Ball No1 (Aluminium,d=10mm)", "Ball No2 (Aluminium,d=5mm)", "Ball No3 (POM Delrin,d=10mm)",
                    "Ball No4 (POM Delrin,d=5mm)","Ball No5 (PE6.6 Nylon,d=10mm)"]
                currentIndex: settings.comboxballcurrentIndex_tp6
                onCurrentIndexChanged: {
                    configcaractball_tp6(currentIndex)
                }
            }
            Row {
                width: parent.width
                spacing: 0
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Given_tp6.width)/2
                    orientation: Qt.Horizontal
                }
                Label {
                    id:label1_Given_tp6
                    width: label1_Given_tp6.text.width
                    text: "Given"
                    anchors.fill: parent.center
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Given_tp6.width)/2
                    orientation: Qt.Horizontal
                }
            }
            Row {
                width: parent.width/2-5
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textroballgcm3_tp6.height
                        text: qsTr("\u03C1_ball=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textroballgcm3_tp6
                        width: parent.width/2
                        placeholderText: qsTr("density of ball")
                        text: settings.roballgcm3_tp6
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textroballgcm3_tp6.text==="nan" || textroballgcm3_tp6.text==="NaN") textroballgcm3_tp6.text=roballgcm3_tp6 ;
                            roballgcm3_tp6=textroballgcm3_tp6.text;calculABCD()}

                    }
                    Label {
                        width: parent.width/3
                        height: textroballgcm3_tp6.height
                        text: qsTr("g/cm3")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textdballmm_tp6.height
                        text: qsTr("d_ball=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textdballmm_tp6
                        width: parent.width/2
                        placeholderText: qsTr("diameter of ball")
                        text: settings.dballmm_tp6
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textdballmm_tp6.text==="nan" || textdballmm_tp6.text==="NaN") textdballmm_tp6.text=dballmm_tp6 ;
                            dballmm_tp6=textdballmm_tp6.text;calculABCD()}
                    }
                    Label {
                        width: parent.width/3
                        height: textdballmm_tp6.height
                        text: qsTr("mm")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            Row {
                width: parent.width/2-5
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textCd_tp6.height
                        text: qsTr("Cd_ball=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textCd_tp6
                        width: parent.width/2
                        placeholderText: qsTr("Cd (The drag coefficient of the Ball)")
                        text: settings.cd_tp6
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textCd_tp6.text==="nan" || textCd_tp6.text==="NaN") textCd_tp6.text=cd_tp6 ;
                            cd_tp6=textCd_tp6.text;calculABCD()}
                    }
                    Label {
                        width: parent.width/3
                        height: textCd_tp6.height
                        text: qsTr("(-)")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textrolgcm3_tp6.height
                        text: qsTr("\u03C1_liquide=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textrolgcm3_tp6
                        width: parent.width/2
                        placeholderText: qsTr("density of liquid")
                        text: settings.rolgcm3_tp6
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textrolgcm3_tp6.text==="nan" || textrolgcm3_tp6.text==="NaN") textrolgcm3_tp6.text=rolgcm3_tp6 ;
                            rolgcm3_tp6=textrolgcm3_tp6.text;calculABCD()}
                    }
                    Label {
                        width: parent.width/3
                        height: textrolgcm3_tp6.height
                        text: qsTr("g/cm3")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            ///
            Row {
                width: parent.width/2-5
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        id:label1ViscoCinema_tp6
                        height: textViscoCinema_tp6.height
                        text: qsTr("\u03bd=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textViscoCinema_tp6
                        width: parent.width/2
                        placeholderText: qsTr("kinematic viscosity of liquid")
                        text: settings.viscoCinema_tp6
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textViscoCinema_tp6.text==="nan" || textViscoCinema_tp6.text==="NaN") textViscoCinema_tp6.text=viscoCinema_tp6 ;
                            viscoCinema_tp6=textViscoCinema_tp6.text;calculABCD()}
                    }
                    Label {
                        id:label2ViscoCinema_tp6
                        width: parent.width/3
                        height: textViscoCinema_tp6.height
                        text: qsTr("m2/s")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textdt_tp6.height
                        text: qsTr("dl=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textdl_tp6
                        width: parent.width/2
                        placeholderText: qsTr("dl mesured")
                        text: settings.dl_tp6
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textdl_tp6.text==="nan" || textdl_tp6.text==="NaN") textdl_tp6.text=dl_tp6 ;
                            dl_tp6=textdl_tp6.text}
                    }
                    Label {
                        width: parent.width/3
                        height: textdt_tp6.height
                        text: qsTr("mm")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            Row {
                width:  parent.width
                Row {
                    width: parent.width/2
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textdt_tp6.height
                        text: qsTr("t=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textdt_tp6
                        width: parent.width/3
                        placeholderText: qsTr("t mesured")
                        text: settings.dt_tp6
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (settings.dt_tp6==="nan" || settings.dt_tp6==="NaN") textdt_tp6.text=dt_tp6 ;
                            dt_tp6=textdt_tp6.text}
                    }
                    Label {
                        width: parent.width/3
                        height: textdt_tp6.height
                        text: qsTr("s")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Button {
                    width: parent.width/2
                    text: "Average time calculation"
                    onClicked: {
                        dialogCalculTmoy.open()
                    }
                }
            }
            Row {
                width: parent.width
                spacing: 0
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
                Label {
                    id:label1_Calcul_tp6
                    width: label1_Calcul_tp6.text.width
                    text: "Calculation of sedimentation velocity (v)"
                    anchors.fill: parent.center
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
            }
            Row {
                width: parent.width-7
                spacing: 2
                TextField {
                    id:textA_tp6
                    width: parent.width/4
                    readOnly : true
                    selectByMouse: false
                    placeholderText: qsTr("A (m4/s4 *10^-3)")
                    text: (a_tp6*1000).toFixed(5)
                    inputMethodHints: Qt.ImhDigitsOnly
                }
                TextField {
                    id:textB_tp6
                    width: parent.width/4
                    readOnly : true
                    selectByMouse: false
                    placeholderText: qsTr("B (m2/s2 *10^-3)")
                    text: (b_tp6*1000).toFixed(5)
                    inputMethodHints: Qt.ImhDigitsOnly

                }
                TextField {
                    id:textC_tp6
                    width: parent.width/4
                    readOnly : true
                    selectByMouse: false
                    placeholderText: qsTr("C (m/s *10^-3)")
                    text: (c_tp6*1000).toFixed(5)
                    inputMethodHints: Qt.ImhDigitsOnly

                }
                TextField {
                    id:textD_tp6
                    width: parent.width/4
                    readOnly : true
                    selectByMouse: false
                    placeholderText: qsTr("D")
                    text: (d_tp6).toFixed(5)
                    inputMethodHints: Qt.ImhDigitsOnly
                }
            }
            TextField {
                id:textcalcul1fx_tp6
                width: parent.width
                readOnly : true
                selectByMouse: false
                placeholderText: qsTr("The polynomial to solve for which the value of v is equivalent to 1/x. fx")
                text: (a_tp6*1000).toFixed(3)+"*x^4"+(b_tp6*1000).toFixed(3)+"*x^2"+(c_tp6*1000).toFixed(3)+"*x+"+(d_tp6*1000).toFixed(3)
                onTextChanged: fx=a_tp6+"*x^4"+b_tp6+"*x^2"+c_tp6+"*x+"+d_tp6
                color: "red"
            }
            TextField {
                id:textcalcul1fxprim_tp6
                width: parent.width
                readOnly : true
                selectByMouse: false
                placeholderText: qsTr("The derivative of the polynomial. fxprim")
                text: (4*a_tp6*1000).toFixed(3)+"*x^3"+(2*b_tp6*1000).toFixed(3)+"*x"+(c_tp6*1000).toFixed(3)
                onTextChanged: fxprim=4*a_tp6+"*x^3"+2*b_tp6+"*x"+c_tp6
            }
            Button {
                width: parent.width
                text: "Polynomial solution"
                onClicked: {
                    tp_6_Dialog1.open()
                    tableModelxi_tp6.clear()
                }
            }
            Dialog {
                id: tp_6_Dialog1
                title: "Calcul x"
                anchors.centerIn: Overlay.overlay
                width:app.width
                height: 450
                Column {
                    width: parent.width
                    Button {
                        width: parent.width
                        text: qsTr("Click to resolve the polynomial (v=1/x)")
                        onClicked: {
                            tableModelxi_tp6.clear()
                            CalculHaf.hafresolutioneqtnonlineaire_newtonraphson(fx,fxprim,10,0.000001,51)
                        }
                    }
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label3_tp6.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label3_tp6
                            width: label3_tp6.text.width
                            text: "With: Newton-Raphson method"
                            anchors.fill: parent.center
                        }

                        ToolSeparator {
                            height: 25
                            width: (parent.width-label3_tp6.width)/2
                            orientation: Qt.Horizontal
                        }
                    }
                    Rectangle {
                        id:rectabview2_tp6
                        width: parent.width
                        height: 175
                        HorizontalHeaderView {
                            id: horizontalHeader
                            anchors.left: tabview2_tp6.left
                            anchors.top: parent.top
                            syncView: tabview2_tp6
                            clip: true
                            model: ["i" , "x(i)"]
                        }
                        VerticalHeaderView {
                            id: verticalHeader
                            anchors.top: tabview2_tp6.top
                            anchors.left: parent.left
                            syncView: tabview2_tp6
                            clip: true
                        }
                        TableView {
                            id:tabview2_tp6
                            anchors.left: verticalHeader.right
                            anchors.top: horizontalHeader.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarxi_tp6;
                                active:true
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModelxi_tp6
                                TableModelColumn { display: "i" }
                                TableModelColumn { display: "xi" }
                                rows: [
                                    {
                                        i: "i",
                                        xi: "x(i)",
                                    }
                                ]
                            }
                            delegate:  TextInput {
                                id:textItemxi_tp6
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                ///wrapMode: Text.WordWrap
                                readOnly : true
                                selectByMouse: false
                                renderType: Text.NativeRendering
                                onTextEdited: {
                                    model.display = text
                                }
                                onAccepted:  {
                                    ///  tableModelxi_tp6.calculxi_tp6();
                                }
                                Rectangle {
                                    anchors.fill: parent
                                    height: textItemxi_tp6.implicitHeight
                                    width: textItemxi_tp6.implicitWidth
                                    ///width: parent.width/2
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                    }
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label8_tp6.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label8_tp6
                            width: label3_tp6.text.width
                            text: "results"
                            anchors.fill: parent.center
                        }
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label8_tp6.width)/2
                            orientation: Qt.Horizontal
                        }
                    }
                    Row {
                        width: parent.width-7
                        Label {
                            id:label9_tp6
                            width: parent.width/3
                            text: "Vtheo="+(vtheo).toFixed(3)+"m/s"
                            anchors.fill: parent.center
                        }
                        Label {
                            id:label10_tp6
                            width: parent.width/3
                            text: "Vexp="+(dl_tp6*0.001/dt_tp6).toFixed(3)+"m/s"
                            anchors.fill: parent.center
                        }
                        Label {
                            id:label11_tp6
                            width: parent.width/3
                            text: "Error="+((vtheo-(dl_tp6*0.001/dt_tp6))/(dl_tp6*0.001/dt_tp6)*100).toFixed(2)+" %"
                            anchors.fill: parent.center
                        }
                    }
                }
                standardButtons: Dialog.Ok
                onAccepted: {
                    close()
                }
            }

        }
    }
    Component.onCompleted: {
        calculABCD();
    }
}
