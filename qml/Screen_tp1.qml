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

    function configcaractball(index) {
        comboxballcurrentIndex_tp1=index
        if (index===0) {roballgcm3_tp1=2.2 ; dballmm_tp1=15.81 ; k_tp1=0.007}
        if (index===1) {roballgcm3_tp1=2.2 ; dballmm_tp1=15.6 ; k_tp1=0.09}
        if (index===2) {roballgcm3_tp1=8.1 ; dballmm_tp1=15.6 ; k_tp1=0.09}
        if (index===3) {roballgcm3_tp1=8.1 ; dballmm_tp1=15.2 ; k_tp1=0.7}
        if (index===4) {roballgcm3_tp1=8.1 ; dballmm_tp1=14 ; k_tp1=7}
        if (index===5) {roballgcm3_tp1=8.1 ; dballmm_tp1=11 ; k_tp1=35}
        savesettings()
        labelhelp2_tp1_text()
    }
    function labelhelp2_tp1_text(){
        if (comboxball_tp1.currentIndex===0) {labelhelp2_tp1text="(0.6-10)"; runanimationhelp1_tp1=!(viscodynamesur_tp1>miniinrangviscodynamesurBall1_tp1 && viscodynamesur_tp1<maxinrangviscodynamesurBall1_tp1)}
        if (comboxball_tp1.currentIndex===1) {labelhelp2_tp1text="(9-140)"; runanimationhelp1_tp1=!(viscodynamesur_tp1>miniinrangviscodynamesurBall2_tp1 && viscodynamesur_tp1<maxinrangviscodynamesurBall2_tp1)}
        if (comboxball_tp1.currentIndex===2) {labelhelp2_tp1text="(40-700)"; runanimationhelp1_tp1=!(viscodynamesur_tp1>miniinrangviscodynamesurBall3_tp1 && viscodynamesur_tp1<maxinrangviscodynamesurBall3_tp1)}
        if (comboxball_tp1.currentIndex===3) {labelhelp2_tp1text="(150-5000)"; runanimationhelp1_tp1=!(viscodynamesur_tp1>miniinrangviscodynamesurBall4_tp1 && viscodynamesur_tp1<maxinrangviscodynamesurBall4_tp1)}
        if (comboxball_tp1.currentIndex===4) {labelhelp2_tp1text="(1500-50000)"; runanimationhelp1_tp1=!(viscodynamesur_tp1>miniinrangviscodynamesurBall5_tp1 && viscodynamesur_tp1<maxinrangviscodynamesurBall5_tp1)}
        if (comboxball_tp1.currentIndex===5) {labelhelp2_tp1text="(>7500)"; runanimationhelp1_tp1=!(viscodynamesur_tp1>maxinrangviscodynamesurBall6_tp1)}
    }

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: parent.width
        contentHeight: column.height+50
        Column {
            id:column
            width: parent.width
            anchors.margins: 10
            spacing: 10
            ComboBox {
                id:comboxball_tp1
                width: parent.width
                model: [qsTr("Ball No1 (Bron silica glass,d=15.81mm,k=0.007)"), qsTr("Ball No2 (Bron silica glass,d=15.6mm,k=0.09)"), qsTr("Ball No3 (nickel iron alloy,d=15.6mm,k=0.09)"),
                    qsTr("Ball No4 (nickel iron alloy,d=15.2mm,k=0.7)"),qsTr("Ball No5 (nickel iron alloy,d=14mm,k=7)"),qsTr("Ball No6 (nickel iron alloy,d=11mm,k=35)")]
                currentIndex: settings.comboxballcurrentIndex_tp1
                onCurrentIndexChanged: {
                    configcaractball(currentIndex)
                }
            }

            Row {
                width: parent.width/2-10
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textroballgcm3_tp1.height
                        text: qsTr("\u03C1_ball=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textroballgcm3_tp1
                        width: parent.width/2
                        placeholderText: qsTr("density of ball")
                        text: settings.roballgcm3_tp1
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textroballgcm3_tp1.text==="nan" || textroballgcm3_tp1.text==="NaN") textroballgcm3_tp1.text=1.18 ;
                            roballgcm3_tp1=textroballgcm3_tp1.text}

                    }
                    Label {
                        width: parent.width/3
                        height: textroballgcm3_tp1.height
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
                        height: textdballmm_tp1.height
                        text: qsTr("d_ball=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textdballmm_tp1
                        width: parent.width/2
                        placeholderText: qsTr("diameter of ball")
                        text: settings.dballmm_tp1
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textdballmm_tp1.text==="nan" || textdballmm_tp1.text==="NaN") textdballmm_tp1.text=1.18 ;
                            dballmm_tp1=textdballmm_tp1.text}
                    }
                    Label {
                        width: parent.width/3
                        height: textdballmm_tp1.height
                        text: qsTr("mm")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            Row {
                width: parent.width/2-10
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textkcalibration_tp1.height
                        text: qsTr("k_ball=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textkcalibration_tp1
                        width: parent.width/2
                        placeholderText: qsTr("K (Canstante calibration of the Ball)")
                        text: settings.k_tp1
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textkcalibration_tp1.text==="nan" || textkcalibration_tp1.text==="NaN") textkcalibration_tp1.text=k_tp1 ;
                            k_tp1=textkcalibration_tp1.text}
                    }
                    Label {
                        width: parent.width/3
                        height: textkcalibration_tp1.height
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
                        height: textrolgcm3_tp1.height
                        text: qsTr("\u03C1_liquide=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textrolgcm3_tp1
                        width: parent.width/2
                        placeholderText: qsTr("density of liquid")
                        text: settings.rolgcm3_tp1
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textrolgcm3_tp1.text==="nan" || textrolgcm3_tp1.text==="NaN") textrolgcm3_tp1.text=1.18 ;
                            rolgcm3_tp1=textrolgcm3_tp1.text}
                    }
                    Label {
                        width: parent.width/3
                        height: textrolgcm3_tp1.height
                        text: qsTr("g/cm3")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            Row {
                width: parent.width/2-10
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textdt_tp1.height
                        text: qsTr("t=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textdt_tp1
                        width: parent.width/2
                        placeholderText: qsTr("t mesured")
                        text: settings.dt_tp1
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (settings.dt_tp1==="nan" || settings.dt_tp1==="NaN") textdt_tp1.text=61 ;
                            dt_tp1=textdt_tp1.text}
                    }
                    Label {
                        width: parent.width/3
                        height: textdt_tp1.height
                        text: qsTr("s")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Row {
                    width: parent.width
                    spacing: 2
                    Label {
                        width: parent.width/3
                        height: textdt_tp1.height
                        text: qsTr("dl=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textdl_tp1
                        width: parent.width/2
                        placeholderText: qsTr("dl mesured")
                        text: settings.dl_tp1
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textdl_tp1.text==="nan" || textdl_tp1.text==="NaN") textdl_tp1.text=150 ;
                            dl_tp1=textdl_tp1.text}
                    }
                    Label {
                        width: parent.width/3
                        height: textdt_tp1.height
                        text: qsTr("mm")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
            Image {
                id: imagehelp1_tp1
                width: parent.width
                smooth: true
                fillMode: Image.PreserveAspectFit
                source: "images/Viscosim_help1_tp1.jpg"
            }
            Label {
                id: labelhelp1_tp1
                width: parent.width
                text: qsTr("For this ball the recommanded measuring range is: ")+labelhelp2_tp1text+"mPa.s"
                wrapMode: Text.WordWrap
                font.bold : true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                // Define the color property to animate
                color: "green"

                // Animation to change the text color
                ColorAnimation on color {
                    id: colorAnimation
                    from: "green"
                    to: "red"
                    duration: 1000 // 1 second
                    loops: Animation.Infinite // Loop forever
                    running: runanimationhelp1_tp1 && tabBarcurrentIndex===0 //true // Start the animation automatically
                    onStopped: labelhelp1_tp1.color="green"
                }
            }
            Row {
                id:row2tp1
                width: parent.width
                TextField {
                    id:textviscodynamesur_tp1
                    width: parent.width/2
                    enabled: false
                    color: 'red'
                    placeholderText: qsTr("dynamic viscosity of liquid mesured \u03B7=K(\u03C1_ball-\u03C1_liquid).t")
                    text: "\u03B7="+((k_tp1*(roballgcm3_tp1-rolgcm3_tp1)*dt_tp1)).toFixed(3)+" mPa.s"
                    onTextChanged: {
                        viscodynamesur_tp1=((k_tp1*(roballgcm3_tp1-rolgcm3_tp1)*dt_tp1)).toFixed(3);
                        labelhelp2_tp1_text()
                    }
                }
                TextField {
                    id:textviscodynatheo_tp1
                    width: row2tp1.width-(textviscodynamesur_tp1.width+textviscodyerror_tp1.width)
                    placeholderText: qsTr("viscosity of liquid theoricaly (mPa.s)") /////qsTr("حفيان")
                    text: settings.viscodynatheo_tp1
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textviscodynatheo_tp1.text==="nan" || textviscodynatheo_tp1.text==="NaN") textviscodynatheo_tp1.text=5.59;
                        viscodynatheo_tp1=textviscodynatheo_tp1.text}
                }
                TextField {
                    id:textviscodyerror_tp1
                    width: parent.width/4
                    enabled: false
                    color: 'red'
                    placeholderText: qsTr("Error viscosity of liquid (%) (\u03B7_exp.-\u03B7_theo)/\u03B7_theo")
                    text: (((k_tp1*(roballgcm3_tp1-rolgcm3_tp1)*dt_tp1)-viscodynatheo_tp1)/(viscodynatheo_tp1)*100).toFixed(2)+ "%"
                }
            }
            Row {
                width: parent.width
                TextField {
                    id:texttempera_tp1
                    width: parent.width/2
                    placeholderText: qsTr("T°C mesured")
                    text: settings.tempera_tp1
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (texttempera_tp1.text==="nan" || texttempera_tp1.text==="NaN") texttempera_tp1.text=21 ;
                        tempera_tp1=texttempera_tp1.text}
                }
                TextField {
                    id:textRe_tp1
                    width: parent.width/2
                    enabled: false
                    color: 'red'
                    placeholderText: qsTr("Re (Equations of Stokes (Re < 0.1))")
                    text: ((rolgcm3_tp1*(dl_tp1/dt_tp1)*dballmm_tp1)/viscodynatheo_tp1).toFixed(3)
                }

            }
            Row {
                width: parent.width
                spacing: 1
                Rectangle {
                    id:rectabview
                    width: 135
                    height: 190
                    color: "transparent"
                    HorizontalHeaderView {
                        id: horizontalHeader1_tp1
                        anchors.left: tabview1_tp1.left
                        anchors.top: parent.top
                        syncView: tabview1_tp1
                        clip: true
                        model: ["T (°C)" , "\u03B7 (mPa.s)",]
                    }
                    VerticalHeaderView {
                        id: verticalHeader1_tp1
                        anchors.top: tabview1_tp1.top
                        anchors.left: parent.left
                        syncView: tabview1_tp1
                        clip: true
                    }
                    TableView {
                        id:tabview1_tp1
                        anchors.left: verticalHeader1_tp1.right
                        anchors.top: horizontalHeader1_tp1.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        // ScrollBar.vertical: ScrollBar {
                        //     id: tableVerticalBar;
                        //     active:true
                        //     policy:ScrollBar.AlwaysOn
                        // }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModel1_tp1
                            TableModelColumn { display: "Temperature" }
                            TableModelColumn { display: "Viscodynamique" }
                            function updatechart()
                            {
                                myChart.removeAllSeries();
                                var line = myChart.createSeries(ChartView.SeriesTypeScatter, "\u03B7 =f (T°C) ", axisX, axisY);

                                line.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                                line.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function

                                var maxvisco=parseFloat(tableModel1_tp1.rows[0].Viscodynamique);
                                var maxtemperature=parseFloat(tableModel1_tp1.rows[0].Temperature);
                                var minivisco=parseFloat(tableModel1_tp1.rows[0].Viscodynamique);
                                var minitemperature=parseFloat(tableModel1_tp1.rows[0].Temperature);
                                for (var i = 0; i < tableModel1_tp1.rowCount; i++)  {
                                    if (tableModel1_tp1.rows[i].Viscodynamique > maxvisco)
                                        maxvisco=parseFloat(tableModel1_tp1.rows[i].Viscodynamique) ;
                                    if (tableModel1_tp1.rows[i].Temperature > maxtemperature)
                                        maxtemperature=parseFloat(tableModel1_tp1.rows[i].Temperature) ;
                                    if (tableModel1_tp1.rows[i].Viscodynamique < minivisco)
                                        minivisco=parseFloat(tableModel1_tp1.rows[i].Viscodynamique) ;
                                    if (tableModel1_tp1.rows[i].Temperature < minitemperature)
                                        minitemperature=parseFloat(tableModel1_tp1.rows[i].Temperature) ;
                                }
                                for (i = 0; i < tableModel1_tp1.rowCount; i++)  {
                                    if (tableModel1_tp1.rows[i].Temperature!==0
                                            && tableModel1_tp1.rows[i].Viscodynamique!==""
                                        ///    && tableModel1_tp1.rows[i].Viscodynamique!==""
                                        ///    && tableModel1_tp1.rows[i].Viscodynamique!==""
                                            )
                                        line.append(tableModel1_tp1.rows[i].Temperature,tableModel1_tp1.rows[i].Viscodynamique)
                                }
                                axisX.min = Math.round(minitemperature-0.1*minitemperature);
                                axisX.max = Math.round(maxtemperature+0.1*maxtemperature);
                                axisY.min = Math.round(minivisco-0.1*minivisco);
                                axisY.max = Math.round(maxvisco+0.1*maxvisco);

                                temperatableModel1_tp1=tableModel1_tp1.rows[0].Temperature
                                temperatableModel2_tp1=tableModel1_tp1.rows[1].Temperature
                                temperatableModel3_tp1=tableModel1_tp1.rows[2].Temperature
                                viscodynamesurtableModel1_tp1=tableModel1_tp1.rows[0].Viscodynamique
                                viscodynamesurtableModel2_tp1=tableModel1_tp1.rows[1].Viscodynamique
                                viscodynamesurtableModel3_tp1=tableModel1_tp1.rows[2].Viscodynamique
                            }
                          }
                        delegate: DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate:TextInput {
                                    id:textItem1_tp1
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 15
                                    ///wrapMode: Text.WordWrap
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: darkMode ? "white":""
                                    onEditingFinished: {
                                        model.display = text
                                    }
                                    onAccepted: {
                                        tableModel1_tp1.updatechart();
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textItem1_tp1.implicitHeight
                                        width: textItem1_tp1.implicitWidth
                                        ///width: parent.width/2
                                        color:"transparent"
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 1
                                delegate:TextInput {
                                    id:textItem2_tp1
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 15
                                    ///wrapMode: Text.WordWrap
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: darkMode ? "white":""
                                    onEditingFinished: {
                                        model.display = text
                                    }
                                    onAccepted: {
                                        tableModel1_tp1.updatechart();
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textItem2_tp1.implicitHeight
                                        width: textItem2_tp1.implicitWidth
                                        ///width: parent.width/2
                                        color:"transparent"
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                         }
                    }
                }
                Rectangle {
                    width: parent.width-rectabview.width
                    height: rectabview.height
                    color:"transparent"
                    ChartView {
                        id: myChart
                        clip: true
                        margins.left: 0
                        margins.right: 0
                        margins.top: 0
                        margins.bottom: 0
                        ///title: " \u03B7 = f (T°C) "
                        width: parent.width
                        height: parent.height
                        antialiasing: true
                        animationOptions: ChartView.SeriesAnimations
                        legend.visible: false
                        theme: darkMode ? ChartView.ChartThemeDark:ChartView.ChartThemeLight
                        ValueAxis {
                            id: axisY
                            gridVisible: true
                            titleText: "\u03B7 (mPa.s)"
                            ///labelFormat: "%d mPa.s"
                        }
                        ValueAxis {
                            id: axisX
                            gridVisible: true
                            titleText: "T (&deg;C)"
                            labelFormat: "%d&deg;C"
                        }
                        PinchArea{
                            id: pa
                            anchors.fill: parent
                            property real currentPinchScaleX: 1
                            property real currentPinchScaleY: 1
                            property real pinchStartX : 0
                            property real pinchStartY : 0

                            onPinchStarted: {
                                // Pinching has started. Record the initial center of the pinch
                                // so relative motions can be reversed in the pinchUpdated signal
                                // handler
                                pinchStartX = pinch.center.x;
                                pinchStartY = pinch.center.y;
                            }

                            onPinchUpdated: {
                                myChart.zoomReset();

                                // Reverse pinch center motion direction
                                var center_x = pinchStartX + (pinchStartX - pinch.center.x);
                                var center_y = pinchStartY + (pinchStartY - pinch.center.y);

                                // Compound pinch.scale with prior pinch scale level and apply
                                // scale in the absolute direction of the pinch gesture
                                var scaleX = currentPinchScaleX * (1 + (pinch.scale - 1) * Math.abs(Math.cos(pinch.angle * Math.PI / 180)));
                                var scaleY = currentPinchScaleY * (1 + (pinch.scale - 1) * Math.abs(Math.sin(pinch.angle * Math.PI / 180)));

                                // Apply scale to zoom levels according to pinch angle
                                var width_zoom = height / scaleX;
                                var height_zoom = width / scaleY;

                                var r = Qt.rect(center_x - width_zoom / 2, center_y - height_zoom / 2, width_zoom, height_zoom);
                                myChart.zoomIn(r);
                            }

                            onPinchFinished: {
                                // Pinch finished. Record compounded pinch scale.
                                currentPinchScaleX = currentPinchScaleX * (1 + (pinch.scale - 1) * Math.abs(Math.cos(pinch.angle * Math.PI / 180)));
                                currentPinchScaleY = currentPinchScaleY * (1 + (pinch.scale - 1) * Math.abs(Math.sin(pinch.angle * Math.PI / 180)));
                            }

                            MouseArea{
                                anchors.fill: parent
                                drag.target: dragTarget
                                drag.axis: Drag.XAndYAxis

                                onDoubleClicked: {
                                    myChart.zoomReset();
                                    parent.currentPinchScaleX = 1;
                                    parent.currentPinchScaleY = 1;
                                }
                            }

                            Item {
                                // A virtual item to receive drag signals from the MouseArea.
                                // When x or y properties are changed by the MouseArea's
                                // drag signals, the ChartView is scrolled accordingly.
                                id: dragTarget

                                property real oldX : x
                                property real oldY : y

                                onXChanged: {
                                    myChart.scrollLeft( x - oldX );
                                    oldX = x;
                                }
                                onYChanged: {
                                    myChart.scrollUp( y - oldY );
                                    oldY = y;
                                }
                            }
                        }


                    }
                }
            }

        }

    }
    Component.onCompleted: {
        tableModel1_tp1.appendRow({Temperature:settings.temperatableModel1_tp1,Viscodynamique:settings.viscodynamesurtableModel1_tp1})
        tableModel1_tp1.appendRow({Temperature:settings.temperatableModel2_tp1,Viscodynamique:settings.viscodynamesurtableModel2_tp1})
        tableModel1_tp1.appendRow({Temperature:settings.temperatableModel3_tp1,Viscodynamique:settings.viscodynamesurtableModel3_tp1})

        tableModel1_tp1.updatechart();
    }
}
