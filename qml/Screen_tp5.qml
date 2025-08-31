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

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: parent.width
        contentHeight: column1_tp4.height+50
        Column {
            id:column1_tp4
            width: parent.width
            anchors.margins: 10
            spacing: 10
            Image {
                id: imagehelp1_tp2
                width: parent.width
                /// scale: 0.5
                smooth: true
                fillMode: Image.PreserveAspectFit
                source: tabbar1_tp4.currentIndex===0? "images/DP_Venturi_cal.gif":"images/TP_Diaphgrame.jpg"
            }
            TabBar {
                id: tabbar1_tp4
                width: parent.width
                TabButton {
                    text: qsTr("Venturi")
                    width: implicitWidth
                }
                TabButton {
                    text: qsTr("Orifice")
                    width: implicitWidth
                }
            }

            StackLayout {
                id: view
                width: parent.width
                currentIndex: tabbar1_tp4.currentIndex
                ///anchors.fill: parent
                ////1 Venturie
                Column {
                    id:column_PartiallySubmerged_tp4
                    spacing: 7
                    width: parent.width
                    height: 250
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_Given_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label1_Given_tp4
                            width: label1_Given_tp4.text.width
                            text: "Given"
                            anchors.fill: parent.center
                        }
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_Given_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                    }
                    Row {
                        width: parent.width
                        spacing: 2
                        Row {
                            width: parent.width/2
                            spacing: 2
                            Label {
                                id:labeltextd1_tp5
                                width: text.width
                                height: textd1_tp5.height
                                text: qsTr("D1=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textd1_tp5
                                width: parent.width-labeltextd1_tp5.width-labeltextunitd1_tp5.width-10
                                placeholderText: qsTr("D1")
                                text: settings.d1_tp5
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textd1_tp5.text==="nan" || textd1_tp5.text==="NaN") textd1_tp5.text=0.100 ;
                                    d1_tp5=textd1_tp5.text;
                                }
                                onEditingFinished: tableModel1_venturie_tp5.updatechart1_venturie_tp5()
                            }
                            Label {
                                id:labeltextunitd1_tp5
                                width: text.width
                                height: textd1_tp5.height
                                text: qsTr("mm")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Row {
                            width: parent.width/2
                            spacing: 2
                            Label {
                                id:labeltextd2_tp5
                                width: text.width
                                height: textd2_tp5.height
                                text: qsTr("D2=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textd2_tp5
                                width: parent.width-labeltextd2_tp5.width-labeltextunitd2_tp4.width-10
                                placeholderText: qsTr("D2")
                                text: settings.d2_tp5
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textd2_tp5.text==="nan" || textd2_tp5.text==="NaN") textd2_tp5.text=0.075 ;
                                    d2_tp5=textd2_tp5.text;
                                }
                                onEditingFinished: tableModel1_venturie_tp5.updatechart1_venturie_tp5()
                            }
                            Label {
                                id:labeltextunitd2_tp4
                                width: text.width
                                height: textd2_tp5.height
                                text: qsTr("mm")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }

                    }
                    TabBar {
                        id: tabbar2_tp4
                        width: parent.width
                        TabButton {
                            text: qsTr("Theory")
                            width: implicitWidth
                        }
                        TabButton {
                            text: qsTr("Table")
                            width: implicitWidth
                        }
                        TabButton {
                            text: qsTr("Graph")
                            width: implicitWidth
                        }
                        onCurrentIndexChanged: tableModel1_venturie_tp5.updatechart1_venturie_tp5();
                    }
                    StackLayout {
                        id: view2_tp4
                        width: parent.width
                        currentIndex: tabbar2_tp4.currentIndex
                        Image {
                            id: imagehelp1_tp5
                            width: parent.width
                            ///scale: 0.25
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            source: "images/TP_5-Fig1.jpg"
                        }
                        Column {
                            id:column4_tp4
                            width: parent.width
                            spacing: 7
                            height: 250
                            Row {
                                width: parent.width
                                spacing: 0
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_Theoretical_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                                Label {
                                    id:label3_Theoretical_tp4
                                    width: label3_Theoretical_tp4.text.width
                                    text: "Calcul"
                                    anchors.fill: parent.center
                                }
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_Theoretical_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Rectangle {
                                id:rectabview1_tp5
                                width: parent.width
                                height: 250
                                color: "transparent"
                                HorizontalHeaderView {
                                    id: horizontalHeader1_tp5
                                    anchors.left: tabview1_tp5.left
                                    anchors.top: parent.top
                                    syncView: tabview1_tp5
                                    clip: true
                                    model: ["Qexp (l/s)" , "DH (mm)","Qtheo (l/s)" , "Cd (-)"]
                                }
                                VerticalHeaderView {
                                    id: verticalHeader1_tp5
                                    anchors.top: tabview1_tp5.top
                                    anchors.left: parent.left
                                    syncView: tabview1_tp5
                                    clip: true
                                }
                                TableView {
                                    id:tabview1_tp5
                                    anchors.left: verticalHeader1_tp5.right
                                    anchors.top: horizontalHeader1_tp5.bottom
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
                                        id:tableModel1_venturie_tp5
                                        TableModelColumn { display: "Qexp" }
                                        TableModelColumn { display: "DH" }
                                        TableModelColumn { display: "Qtheo" }
                                        TableModelColumn { display: "Cd" }
                                        function updatechart1_venturie_tp5()
                                        {
                                            ///-------------------------
                                            dh1tableModel1_venturie_tp5=tableModel1_venturie_tp5.rows[0].DH
                                            dh2tableModel1_venturie_tp5=tableModel1_venturie_tp5.rows[1].DH
                                            dh3tableModel1_venturie_tp5=tableModel1_venturie_tp5.rows[2].DH

                                            var s1=3.14*d1_tp5*0.001*d1_tp5*0.001/4
                                            var s2=3.14*d2_tp5*0.001*d2_tp5*0.001/4

                                            qtheo1tableModel1_venturie_tp5=(s1*s2)*Math.sqrt(2*9.81*dh1tableModel1_venturie_tp5*0.001)/Math.sqrt(s1*s1-s2*s2)
                                            qtheo2tableModel1_venturie_tp5=(s1*s2)*Math.sqrt(2*9.81*dh2tableModel1_venturie_tp5*0.001)/Math.sqrt(s1*s1-s2*s2)
                                            qtheo3tableModel1_venturie_tp5=(s1*s2)*Math.sqrt(2*9.81*dh3tableModel1_venturie_tp5*0.001)/Math.sqrt(s1*s1-s2*s2)

                                            qtheo1tableModel1_venturie_tp5=(qtheo1tableModel1_venturie_tp5*1000).toFixed(3)
                                            qtheo2tableModel1_venturie_tp5=(qtheo2tableModel1_venturie_tp5*1000).toFixed(3)
                                            qtheo3tableModel1_venturie_tp5=(qtheo3tableModel1_venturie_tp5*1000).toFixed(3)

                                            cd1_tp5=tableModel1_venturie_tp5.rows[0].Qexp/qtheo1tableModel1_venturie_tp5
                                            cd2_tp5=tableModel1_venturie_tp5.rows[1].Qexp/qtheo2tableModel1_venturie_tp5
                                            cd3_tp5=tableModel1_venturie_tp5.rows[2].Qexp/qtheo3tableModel1_venturie_tp5

                                            tableModel1_venturie_tp5.setRow(0, {Qexp:tableModel1_venturie_tp5.rows[0].Qexp,DH:tableModel1_venturie_tp5.rows[0].DH,Qtheo:qtheo1tableModel1_venturie_tp5.toFixed(3),Cd:cd1_tp5.toFixed(3),})
                                            tableModel1_venturie_tp5.setRow(1, {Qexp:tableModel1_venturie_tp5.rows[1].Qexp,DH:tableModel1_venturie_tp5.rows[1].DH,Qtheo:qtheo2tableModel1_venturie_tp5.toFixed(3),Cd:cd2_tp5.toFixed(3),})
                                            tableModel1_venturie_tp5.setRow(2, {Qexp:tableModel1_venturie_tp5.rows[2].Qexp,DH:tableModel1_venturie_tp5.rows[2].DH,Qtheo:qtheo3tableModel1_venturie_tp5.toFixed(3),Cd:cd3_tp5.toFixed(3),})

                                            ///----------------
                                            myChart_tp5.removeAllSeries();
                                            var line = myChart_tp5.createSeries(ChartView.SeriesTypeScatter, "Qtheo =f (Qexp) Venturi", axisX, axisY);

                                            line.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                                            line.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function

                                            var maxQtheo=parseFloat(tableModel1_venturie_tp5.rows[0].Qtheo);
                                            var maxQexp=parseFloat(tableModel1_venturie_tp5.rows[0].Qexp);
                                            var miniQtheo=parseFloat(tableModel1_venturie_tp5.rows[0].Qtheo);
                                            var miniQexp=parseFloat(tableModel1_venturie_tp5.rows[0].Qexp);
                                            for (var i = 0; i < tableModel1_venturie_tp5.rowCount; i++)  {
                                                if (tableModel1_venturie_tp5.rows[i].Qtheo > maxQtheo)
                                                    maxQtheo=parseFloat(tableModel1_venturie_tp5.rows[i].Qtheo) ;
                                                if (tableModel1_venturie_tp5.rows[i].Qexp > maxQexp)
                                                    maxQexp=parseFloat(tableModel1_venturie_tp5.rows[i].Qexp) ;
                                                if (tableModel1_venturie_tp5.rows[i].Qtheo < miniQtheo)
                                                    miniQtheo=parseFloat(tableModel1_venturie_tp5.rows[i].Qtheo) ;
                                                if (tableModel1_venturie_tp5.rows[i].Qexp < miniQexp)
                                                    miniQexp=parseFloat(tableModel1_venturie_tp5.rows[i].Qexp) ;
                                            }
                                            for (i = 0; i < tableModel1_venturie_tp5.rowCount; i++)  {
                                                if (tableModel1_venturie_tp5.rows[i].Qexp!==0
                                                        && tableModel1_venturie_tp5.rows[i].Qtheo!==""
                                                        )
                                                    line.append(tableModel1_venturie_tp5.rows[i].Qexp,tableModel1_venturie_tp5.rows[i].Qtheo)
                                            }
                                            axisX.min = Math.floor(miniQexp-0.1*miniQexp);
                                            axisX.max = Math.ceil(maxQexp+0.1*maxQexp);
                                            axisY.min = Math.floor(miniQtheo-0.1*miniQtheo);
                                            axisY.max = Math.ceil(maxQtheo+0.1*maxQtheo);
                                        }
                                    }
                                    delegate: DelegateChooser {
                                        DelegateChoice {
                                            column: 0
                                            delegate: Button {
                                                id:button1_tp5
                                                enabled: true
                                                width: 50
                                                text: model.display
                                                onClicked:{
                                                    tp_5_Dialog2_Venturie.open()
                                                    ///console.log("clicked"+tableModel1_venturie_tp5.rows[index].DH+":"+index)
                                                    indexqexpMoy=index
                                                }
                                                onTextChanged: {
                                                    qexp1tableModel1_venturie_tp5=tableModel1_venturie_tp5.rows[0].Qexp
                                                    qexp2tableModel1_venturie_tp5=tableModel1_venturie_tp5.rows[1].Qexp
                                                    qexp3tableModel1_venturie_tp5=tableModel1_venturie_tp5.rows[2].Qexp
                                                }
                                            }
                                        }
                                        DelegateChoice {
                                            column: 1
                                            delegate: TextField {
                                                id:textdhVenturie_tp5
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                ///wrapMode: Text.WordWrap
                                                selectByMouse: true
                                                renderType: Text.NativeRendering
                                                onEditingFinished: {
                                                    model.display = text
                                                }
                                                onAccepted: {
                                                    ///console.log("clicked"+tableModel1_venturie_tp5.rows[index].Qtheo+":"+index)
                                                    tableModel1_venturie_tp5.updatechart1_venturie_tp5();
                                                }

                                                Rectangle {
                                                    anchors.fill: parent
                                                    height: textdhVenturie_tp5.implicitHeight
                                                    width: textdhVenturie_tp5.implicitWidth
                                                    ///width: parent.width/2
                                                    color:"transparent"
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                        DelegateChoice {
                                            column: 2
                                            delegate: TextField {
                                                id:textQtheoVenturie_tp5
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                ///wrapMode: Text.WordWrap
                                                readOnly : true
                                                selectByMouse: false
                                                renderType: Text.NativeRendering
                                                Rectangle {
                                                    anchors.fill: parent
                                                    height: textQtheoVenturie_tp5.implicitHeight
                                                    width: textQtheoVenturie_tp5.implicitWidth
                                                    ///width: parent.width/2
                                                    color:"transparent"
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                        DelegateChoice {
                                            column: 3
                                            delegate: TextField {
                                                id:textCdVenturie_tp5
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                ///wrapMode: Text.WordWrap
                                                readOnly : true
                                                selectByMouse: false
                                                renderType: Text.NativeRendering
                                                Rectangle {
                                                    anchors.fill: parent
                                                    height: textCdVenturie_tp5.implicitHeight
                                                    width: textCdVenturie_tp5.implicitWidth
                                                    ///width: parent.width/2
                                                    color:"transparent"
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                    }
                                    Dialog {
                                        id: tp_5_Dialog2_Venturie
                                        title: "Flow rate measurement (Venturi)"
                                        anchors.centerIn: Overlay.overlay
                                        width:app.width
                                        height: 450
                                        Column {
                                            width: parent.width
                                            Row {
                                                width: parent.width
                                                spacing: 0
                                                ToolSeparator {
                                                    height: 25
                                                    width: (parent.width-label3_Measured_tp5.width)/2
                                                    orientation: Qt.Horizontal
                                                }
                                                Label {
                                                    id:label3_Measured_tp5
                                                    width: label3_Measured_tp5.text.width
                                                    text: "With: Volumetric method"
                                                    anchors.fill: parent.center
                                                }

                                                ToolSeparator {
                                                    height: 25
                                                    width: (parent.width-label3_Measured_tp5.width)/2
                                                    orientation: Qt.Horizontal
                                                }
                                            }

                                            Rectangle {
                                                id:rectabview2_tp5
                                                width: parent.width
                                                height: 185
                                                TableView {
                                                    id:tabview2_tp5
                                                    anchors.fill: parent
                                                    // columnSpacing: 1
                                                    // rowSpacing: 1
                                                    boundsBehavior: Flickable.StopAtBounds
                                                    model: TableModel {
                                                        id:tableModelQexp_tp5
                                                        TableModelColumn { display: "Volume" }
                                                        TableModelColumn { display: "Temps" }
                                                        TableModelColumn { display: "Qexp" }
                                                        function calculQexpMoy_tp5()
                                                        {
                                                            volume1modelQexp_tp5=tableModelQexp_tp5.rows[2].Volume
                                                            temps1modelQexp_tp5=tableModelQexp_tp5.rows[2].Temps
                                                            qexp1modelQexp_tp5=(volume1modelQexp_tp5/temps1modelQexp_tp5).toFixed(3)
                                                            volume2modelQexp_tp5=tableModelQexp_tp5.rows[3].Volume
                                                            temps2modelQexp_tp5=tableModelQexp_tp5.rows[3].Temps
                                                            qexp2modelQexp_tp5=(volume2modelQexp_tp5/temps2modelQexp_tp5).toFixed(3)
                                                            volume3modelQexp_tp5=tableModelQexp_tp5.rows[4].Volume
                                                            temps3modelQexp_tp5=tableModelQexp_tp5.rows[4].Temps
                                                            qexp3modelQexp_tp5=(volume3modelQexp_tp5/temps3modelQexp_tp5).toFixed(3)

                                                            savesettings()
                                                        }
                                                        rows: [
                                                            {
                                                                Volume: "V",
                                                                Temps: "t",
                                                                Qexp: "Qexp",
                                                            },
                                                            {
                                                                Volume: "(l)",
                                                                Temps: "(s)",
                                                                Qexp: "(l/s)",
                                                            },
                                                            {
                                                                Volume: settings.volume1modelQexp_tp5,
                                                                Temps: settings.temps1modelQexp_tp5,
                                                                Qexp: settings.qexp1modelQexp_tp5,
                                                            },
                                                            {
                                                                Volume: settings.volume2modelQexp_tp5,
                                                                Temps: settings.temps2modelQexp_tp5,
                                                                Qexp: settings.qexp2modelQexp_tp5,
                                                            },
                                                            {
                                                                Volume: settings.volume3modelQexp_tp5,
                                                                Temps: settings.temps3modelQexp_tp5,
                                                                Qexp: settings.qexp3modelQexp_tp5,
                                                            }
                                                        ]
                                                    }
                                                    delegate:  TextInput {
                                                        id:textItemQexp_tp5
                                                        verticalAlignment: Text.AlignVCenter
                                                        horizontalAlignment: Text.AlignHCenter
                                                        inputMethodHints: Qt.ImhDigitsOnly
                                                        text: model.display
                                                        padding: 9
                                                        ///wrapMode: Text.WordWrap
                                                        selectByMouse: true
                                                        renderType: Text.NativeRendering
                                                        onTextEdited: {
                                                            model.display = text
                                                        }
                                                        onAccepted:  {
                                                            tableModelQexp_tp5.calculQexpMoy_tp5();
                                                        }
                                                        Rectangle {
                                                            anchors.fill: parent
                                                            height: textItemQexp_tp5.implicitHeight
                                                            width: textItemQexp_tp5.implicitWidth
                                                            ///width: parent.width/2
                                                            color:"transparent"
                                                            z: -1
                                                            border.color: "steelblue"
                                                        }

                                                    }
                                                }
                                            }
                                            Button {
                                                width: parent.width
                                                text: qsTr("Calcul Qexp")
                                                onClicked: {
                                                    tableModelQexp_tp5.calculQexpMoy_tp5();
                                                }
                                            }
                                            Row {
                                                width: parent.width
                                                spacing: 2
                                                Label {
                                                    id:labeltextQexp_tp5
                                                    width: text.width
                                                    height: textQexp_tp5.height
                                                    text: qsTr("QexpMoy=")
                                                    horizontalAlignment: Text.AlignRight
                                                    verticalAlignment: Text.AlignVCenter
                                                }
                                                TextField {
                                                    id:textQexp_tp5
                                                    width: parent.width-labeltextQexp_tp5.width-labeltextunitQexp_tp5.width-10
                                                    placeholderText: qsTr("QexpMoy")
                                                    ///enabled: false
                                                    text: ((qexp1modelQexp_tp5+qexp2modelQexp_tp5+qexp3modelQexp_tp5)/3).toFixed(3)
                                                    onTextChanged: qexpMoy=textQexp_tp5.text
                                                }
                                                Label {
                                                    id:labeltextunitQexp_tp5
                                                    width: text.width
                                                    height: textQexp_tp5.height
                                                    text: qsTr("l/s")
                                                    horizontalAlignment: Text.AlignLeft
                                                    verticalAlignment: Text.AlignVCenter
                                                }
                                            }
                                        }
                                        standardButtons: Dialog.Ok
                                        onAccepted: {
                                            qexpMoy=qexpMoy.toFixed(3)
                                            tableModel1_venturie_tp5.setRow(indexqexpMoy, {Qexp:qexpMoy,DH:tableModel1_venturie_tp5.rows[indexqexpMoy].DH,Qtheo:tableModel1_venturie_tp5.rows[indexqexpMoy].Qtheo,Cd:tableModel1_venturie_tp5.rows[indexqexpMoy].Cd,})
                                            if (indexqexpMoy==2) qexp1tableModel1_venturie_tp5=qexpMoy
                                            if (indexqexpMoy==3) qexp2tableModel1_venturie_tp5=qexpMoy
                                            if (indexqexpMoy==4) qexp3tableModel1_venturie_tp5=qexpMoy
                                            tableModel1_venturie_tp5.updatechart1_venturie_tp5();
                                            close()
                                        }
                                    }
                                }
                            }

                        }
                        Rectangle {
                            width: parent.width-rectabview1_tp5.width
                            height: rectabview1_tp5.height
                            color:"transparent"
                            ChartView {
                                id: myChart_tp5
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
                                ///legend.visible: false
                                ///theme: ChartView.ChartThemeDark
                                ScatterSeries{
                                    id:scatterSerie1_tp5
                                    axisX: axisX
                                    axisY: axisY
                                    markerSize: 30
                                    name: "Qtheo=f(Qexp) for Venturi" /// "Scatter"
                                    borderColor: "transparent"
                                    brush: gui.chartBrush
                                    markerShape: ScatterSeries.MarkerShapeRectangle
                                    pointsVisible: true
                                }
                                ValueAxis {
                                    id: axisX
                                    gridVisible: true
                                    titleText:  "Qexp l/s"
                                }
                                ValueAxis {
                                    id: axisY
                                    gridVisible: true
                                    titleText: "Qtheo l/s"
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
                                        myChart_tp5.zoomReset();

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
                                        myChart_tp5.zoomIn(r);
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
                                            myChart_tp5.zoomReset();
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
                                            myChart_tp5.scrollLeft( x - oldX );
                                            oldX = x;
                                        }
                                        onYChanged: {
                                            myChart_tp5.scrollUp( y - oldY );
                                            oldY = y;
                                        }
                                    }
                                }


                            }
                        }

                    }

                }///fin
                ////2 Diaphragme

                Column {
                    id:column_Diaphra_tp5
                    spacing: 7
                    width: parent.width
                    height: 250
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label2_Given_tp5.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label2_Given_tp5
                            width: label2_Given_tp5.text.width
                            text: "Given"
                            anchors.fill: parent.center
                        }
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label2_Given_tp5.width)/2
                            orientation: Qt.Horizontal
                        }
                    }
                    Row {
                        width: parent.width
                        spacing: 2
                        Row {
                            width: parent.width/2
                            spacing: 2
                            Label {
                                id:labeltextd1_Diaphra_tp5
                                width: text.width
                                height: textd1_Diaphra_tp5.height
                                text: qsTr("D1=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textd1_Diaphra_tp5
                                width: parent.width-labeltextd1_Diaphra_tp5.width-labeltextunitd1_Diaphra_tp5.width-10
                                placeholderText: qsTr("D1")
                                text: settings.d1_Diaphra_tp5
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textd1_Diaphra_tp5.text==="nan" || textd1_Diaphra_tp5.text==="NaN") textd1_tp5.text=0.100 ;
                                    d1_Diaphra_tp5=textd1_Diaphra_tp5.text}
                                onEditingFinished: tableModel1_Diaphra_tp5.updatechart1_Diaphra_tp5();
                            }
                            Label {
                                id:labeltextunitd1_Diaphra_tp5
                                width: text.width
                                height: textd1_Diaphra_tp5.height
                                text: qsTr("mm")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Row {
                            width: parent.width/2
                            spacing: 2
                            Label {
                                id:labeltextd2_Diaphra_tp5
                                width: text.width
                                height: textd2_Diaphra_tp5.height
                                text: qsTr("D2=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textd2_Diaphra_tp5
                                width: parent.width-labeltextunitd2_Diaphra_tp4.width-labeltextunitd2_Diaphra_tp4.width-10
                                placeholderText: qsTr("D2")
                                text: settings.d2_Diaphra_tp5
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textd2_Diaphra_tp5.text==="nan" || textd2_Diaphra_tp5.text==="NaN") textd2_tp5.text=0.075 ;
                                    d2_Diaphra_tp5=textd2_Diaphra_tp5.text}
                                onEditingFinished: tableModel1_Diaphra_tp5.updatechart1_Diaphra_tp5();
                            }
                            Label {
                                id:labeltextunitd2_Diaphra_tp4
                                width: text.width
                                height: textd2_Diaphra_tp5.height
                                text: qsTr("mm")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }

                    }

                    TabBar {
                        id: tabbar2_Diaphra_tp5
                        width: parent.width
                        TabButton {
                            text: qsTr("Theory")
                            width: implicitWidth
                        }
                        TabButton {
                            text: qsTr("Table")
                            width: implicitWidth
                        }
                        TabButton {
                            text: qsTr("Graph")
                            width: implicitWidth
                        }
                        onCurrentIndexChanged: tableModel1_Diaphra_tp5.updatechart1_Diaphra_tp5();
                    }

                    StackLayout {
                        id: view2_Diaphra_tp5
                        width: parent.width
                        currentIndex: tabbar2_Diaphra_tp5.currentIndex
                        Image {
                            id: imagehelp2_tp5
                            width: parent.width
                            ///scale: 0.25
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            source: "images/TP_5-Fig1.jpg"
                        }
                        Column {
                            id:column4_Diaphra_tp5
                            width: parent.width
                            spacing: 7
                            height: 250
                            Row {
                                width: parent.width
                                spacing: 0
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_Diaphra_tp5.width)/2
                                    orientation: Qt.Horizontal
                                }
                                Label {
                                    id:label3_Diaphra_tp5
                                    width: label3_Diaphra_tp5.text.width
                                    text: "Calcul"
                                    anchors.fill: parent.center
                                }
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_Diaphra_tp5.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Rectangle {
                                id:rectabview1_Diaphra_tp5
                                width: parent.width
                                height: 250
                                color: "transparent"
                                HorizontalHeaderView {
                                    id: horizontalHeader2_tp5
                                    anchors.left: tabview1_Diaphra_tp5.left
                                    anchors.top: parent.top
                                    syncView: tabview1_Diaphra_tp5
                                    clip: true
                                    model: ["Qexp (l/s)" , "DH (mm)","Qtheo (l/s)" , "Cd (-)"]
                                }
                                VerticalHeaderView {
                                    id: verticalHeader2_tp5
                                    anchors.top: tabview1_Diaphra_tp5.top
                                    anchors.left: parent.left
                                    syncView: tabview1_Diaphra_tp5
                                    clip: true
                                }
                                TableView {
                                    id:tabview1_Diaphra_tp5
                                    anchors.left: verticalHeader2_tp5.right
                                    anchors.top: horizontalHeader2_tp5.bottom
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
                                        id:tableModel1_Diaphra_tp5
                                        TableModelColumn { display: "Qexp" }
                                        TableModelColumn { display: "DH" }
                                        TableModelColumn { display: "Qtheo" }
                                        TableModelColumn { display: "Cd" }
                                        function updatechart1_Diaphra_tp5()
                                        {
                                            ///-------------------------
                                            dh1tableModel1_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[0].DH
                                            dh2tableModel1_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[1].DH
                                            dh3tableModel1_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[2].DH

                                            var s1_Diaphra=3.14*d1_Diaphra_tp5*0.001*d1_Diaphra_tp5*0.001/4
                                            var s2_Diaphra=3.14*d2_Diaphra_tp5*0.001*d2_Diaphra_tp5*0.001/4

                                            qtheo1tableModel1_Diaphra_tp5=(s1_Diaphra*s2_Diaphra)*Math.sqrt(2*9.81*dh1tableModel1_Diaphra_tp5*0.001)/Math.sqrt(s1_Diaphra*s1_Diaphra-s2_Diaphra*s2_Diaphra)
                                            qtheo2tableModel1_Diaphra_tp5=(s1_Diaphra*s2_Diaphra)*Math.sqrt(2*9.81*dh2tableModel1_Diaphra_tp5*0.001)/Math.sqrt(s1_Diaphra*s1_Diaphra-s2_Diaphra*s2_Diaphra)
                                            qtheo3tableModel1_Diaphra_tp5=(s1_Diaphra*s2_Diaphra)*Math.sqrt(2*9.81*dh3tableModel1_Diaphra_tp5*0.001)/Math.sqrt(s1_Diaphra*s1_Diaphra-s2_Diaphra*s2_Diaphra)

                                            qtheo1tableModel1_Diaphra_tp5=(qtheo1tableModel1_Diaphra_tp5*1000).toFixed(3)
                                            qtheo2tableModel1_Diaphra_tp5=(qtheo2tableModel1_Diaphra_tp5*1000).toFixed(3)
                                            qtheo3tableModel1_Diaphra_tp5=(qtheo3tableModel1_Diaphra_tp5*1000).toFixed(3)

                                            cd1_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[0].Qexp/qtheo1tableModel1_Diaphra_tp5
                                            cd2_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[1].Qexp/qtheo2tableModel1_Diaphra_tp5
                                            cd3_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[2].Qexp/qtheo3tableModel1_Diaphra_tp5

                                            tableModel1_Diaphra_tp5.setRow(0, {Qexp:tableModel1_Diaphra_tp5.rows[0].Qexp,DH:tableModel1_Diaphra_tp5.rows[0].DH,Qtheo:qtheo1tableModel1_Diaphra_tp5.toFixed(3),Cd:cd1_Diaphra_tp5.toFixed(3),})
                                            tableModel1_Diaphra_tp5.setRow(1, {Qexp:tableModel1_Diaphra_tp5.rows[1].Qexp,DH:tableModel1_Diaphra_tp5.rows[1].DH,Qtheo:qtheo2tableModel1_Diaphra_tp5.toFixed(3),Cd:cd2_Diaphra_tp5.toFixed(3),})
                                            tableModel1_Diaphra_tp5.setRow(2, {Qexp:tableModel1_Diaphra_tp5.rows[2].Qexp,DH:tableModel1_Diaphra_tp5.rows[2].DH,Qtheo:qtheo3tableModel1_Diaphra_tp5.toFixed(3),Cd:cd3_Diaphra_tp5.toFixed(3),})

                                            ///----------------
                                            myChart_Diaphra_tp5.removeAllSeries();
                                            var line = myChart_Diaphra_tp5.createSeries(ChartView.SeriesTypeScatter, "Qtheo =f (Qexp) Orifice", axisX_Diaphra, axisY_Diaphra);

                                            line.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                                            line.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function

                                            var maxQtheo_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[0].Qtheo);
                                            var maxQexp_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[0].Qexp);
                                            var miniQtheo_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[0].Qtheo);
                                            var miniQexp_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[0].Qexp);
                                            for (var i = 0; i < tableModel1_Diaphra_tp5.rowCount; i++)  {
                                                if (tableModel1_Diaphra_tp5.rows[i].Qtheo > maxQtheo_Diaphra)
                                                    maxQtheo_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[i].Qtheo) ;
                                                if (tableModel1_Diaphra_tp5.rows[i].Qexp > maxQexp_Diaphra)
                                                    maxQexp_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[i].Qexp) ;
                                                if (tableModel1_Diaphra_tp5.rows[i].Qtheo < miniQtheo_Diaphra)
                                                    miniQtheo_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[i].Qtheo) ;
                                                if (tableModel1_Diaphra_tp5.rows[i].Qexp < miniQexp_Diaphra)
                                                    miniQexp_Diaphra=parseFloat(tableModel1_Diaphra_tp5.rows[i].Qexp) ;
                                            }
                                            for (i = 0; i < tableModel1_Diaphra_tp5.rowCount; i++)  {
                                                if (tableModel1_Diaphra_tp5.rows[i].Qexp!==0
                                                        && tableModel1_Diaphra_tp5.rows[i].Qtheo!==""
                                                        )
                                                    line.append(tableModel1_Diaphra_tp5.rows[i].Qexp,tableModel1_Diaphra_tp5.rows[i].Qtheo)
                                            }

                                            axisX_Diaphra.min = Math.floor(miniQexp_Diaphra-0.1*miniQexp_Diaphra);
                                            axisX_Diaphra.max = Math.ceil(maxQexp_Diaphra+0.1*maxQexp_Diaphra);
                                            axisY_Diaphra.min = Math.floor(miniQtheo_Diaphra-0.1*miniQtheo_Diaphra);
                                            axisY_Diaphra.max = Math.ceil(maxQtheo_Diaphra+0.1*maxQtheo_Diaphra);
                                            ///
                                        }
                                     }
                                    delegate: DelegateChooser {
                                        DelegateChoice {
                                            column: 0
                                            delegate: Button {
                                                id:button1_Diaphra_tp5
                                                enabled: true
                                                width: 50
                                                text: model.display
                                                onClicked:{
                                                    tp5_Dialog2_Diaphra.open()
                                                    ///console.log("clicked"+tableModel1_Diaphra_tp5.rows[index].DH+":"+index)
                                                    indexqexpMoy_Diaphra=index
                                                }
                                                onTextChanged: {
                                                    qexp1tableModel1_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[0].Qexp
                                                    qexp2tableModel1_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[1].Qexp
                                                    qexp3tableModel1_Diaphra_tp5=tableModel1_Diaphra_tp5.rows[2].Qexp
                                                }
                                            }
                                        }
                                        DelegateChoice {
                                            column: 1
                                            delegate: TextField {
                                                id:textdh_Diaphra_tp5
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                ///wrapMode: Text.WordWrap
                                                selectByMouse: true
                                                renderType: Text.NativeRendering
                                                onEditingFinished: {
                                                    model.display = text
                                                }
                                                onAccepted: {
                                                    ///console.log("clicked"+tableModel1_Diaphra_tp5.rows[index].Qtheo+":"+index)
                                                    tableModel1_Diaphra_tp5.updatechart1_Diaphra_tp5();

                                                }

                                                Rectangle {
                                                    anchors.fill: parent
                                                    height: textdh_Diaphra_tp5.implicitHeight
                                                    width: textdh_Diaphra_tp5.implicitWidth
                                                    ///width: parent.width/2
                                                    color:"transparent"
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                        DelegateChoice {
                                            column: 2
                                            delegate: TextField {
                                                id:textQtheo_Diaphra_tp5
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                ///wrapMode: Text.WordWrap
                                                readOnly : true
                                                selectByMouse: false
                                                renderType: Text.NativeRendering
                                                Rectangle {
                                                    anchors.fill: parent
                                                    height: textQtheo_Diaphra_tp5.implicitHeight
                                                    width: textQtheo_Diaphra_tp5.implicitWidth
                                                    ///width: parent.width/2
                                                    color:"transparent"
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                        DelegateChoice {
                                            column: 3
                                            delegate: TextField {
                                                id:textCd_Diaphra_tp5
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                ///wrapMode: Text.WordWrap
                                                readOnly : true
                                                selectByMouse: false
                                                renderType: Text.NativeRendering
                                                Rectangle {
                                                    anchors.fill: parent
                                                    height: textCd_Diaphra_tp5.implicitHeight
                                                    width: textCd_Diaphra_tp5.implicitWidth
                                                    ///width: parent.width/2
                                                    color:"transparent"
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                    }
                                    Dialog {
                                        id: tp5_Dialog2_Diaphra
                                        title: "Flow rate measurement (Orifice)"
                                        anchors.centerIn: Overlay.overlay
                                        width:app.width
                                        height: 450
                                        Column {
                                            width: parent.width
                                            Row {
                                                width: parent.width
                                                spacing: 0
                                                ToolSeparator {
                                                    height: 25
                                                    width: (parent.width-label3_Measured_Diaphra_tp5.width)/2
                                                    orientation: Qt.Horizontal
                                                }
                                                Label {
                                                    id:label3_Measured_Diaphra_tp5
                                                    width: label3_Measured_Diaphra_tp5.text.width
                                                    text: "With: Volumetric method"
                                                    anchors.fill: parent.center
                                                }

                                                ToolSeparator {
                                                    height: 25
                                                    width: (parent.width-label3_Measured_Diaphra_tp5.width)/2
                                                    orientation: Qt.Horizontal
                                                }
                                            }

                                            Rectangle {
                                                id:rectabview2_Diaphra_tp5
                                                width: parent.width
                                                height: 185
                                                TableView {
                                                    id:tabview2_Diaphra_tp5
                                                    anchors.fill: parent
                                                    // columnSpacing: 1
                                                    // rowSpacing: 1
                                                    boundsBehavior: Flickable.StopAtBounds
                                                    model: TableModel {
                                                        id:tableModelQexp_Diaphra_tp5
                                                        TableModelColumn { display: "Volume" }
                                                        TableModelColumn { display: "Temps" }
                                                        TableModelColumn { display: "Qexp" }
                                                        function calculQexpMoy_Diaphra_tp5()
                                                        {
                                                            volume1modelQexp_Diaphra_tp5=tableModelQexp_Diaphra_tp5.rows[2].Volume
                                                            temps1modelQexp_Diaphra_tp5=tableModelQexp_Diaphra_tp5.rows[2].Temps
                                                            qexp1modelQexp_Diaphra_tp5=(volume1modelQexp_Diaphra_tp5/temps1modelQexp_Diaphra_tp5).toFixed(3)
                                                            volume2modelQexp_Diaphra_tp5=tableModelQexp_Diaphra_tp5.rows[3].Volume
                                                            temps2modelQexp_Diaphra_tp5=tableModelQexp_Diaphra_tp5.rows[3].Temps
                                                            qexp2modelQexp_Diaphra_tp5=(volume2modelQexp_Diaphra_tp5/temps2modelQexp_Diaphra_tp5).toFixed(3)
                                                            volume3modelQexp_Diaphra_tp5=tableModelQexp_Diaphra_tp5.rows[4].Volume
                                                            temps3modelQexp_Diaphra_tp5=tableModelQexp_Diaphra_tp5.rows[4].Temps
                                                            qexp3modelQexp_Diaphra_tp5=(volume3modelQexp_Diaphra_tp5/temps3modelQexp_Diaphra_tp5).toFixed(3)

                                                            savesettings()
                                                        }
                                                        rows: [
                                                            {
                                                                Volume: "V",
                                                                Temps: "t",
                                                                Qexp: "Qexp",
                                                            },
                                                            {
                                                                Volume: "(l)",
                                                                Temps: "(s)",
                                                                Qexp: "(l/s)",
                                                            },
                                                            {
                                                                Volume: settings.volume1modelQexp_Diaphra_tp5,
                                                                Temps: settings.temps1modelQexp_Diaphra_tp5,
                                                                Qexp: settings.qexp1modelQexp_Diaphra_tp5,
                                                            },
                                                            {
                                                                Volume: settings.volume2modelQexp_Diaphra_tp5,
                                                                Temps: settings.temps2modelQexp_Diaphra_tp5,
                                                                Qexp: settings.qexp2modelQexp_Diaphra_tp5,
                                                            },
                                                            {
                                                                Volume: settings.volume3modelQexp_Diaphra_tp5,
                                                                Temps: settings.temps3modelQexp_Diaphra_tp5,
                                                                Qexp: settings.qexp3modelQexp_Diaphra_tp5,
                                                            }
                                                        ]
                                                    }
                                                    delegate:  TextInput {
                                                        id:textItemQexp_Diaphra_tp5
                                                        verticalAlignment: Text.AlignVCenter
                                                        horizontalAlignment: Text.AlignHCenter
                                                        inputMethodHints: Qt.ImhDigitsOnly
                                                        text: model.display
                                                        padding: 9
                                                        ///wrapMode: Text.WordWrap
                                                        selectByMouse: true
                                                        renderType: Text.NativeRendering
                                                        onTextEdited: {
                                                            model.display = text
                                                        }
                                                        onAccepted:  {
                                                            tableModelQexp_Diaphra_tp5.calculQexpMoy_Diaphra_tp5();
                                                        }
                                                        Rectangle {
                                                            anchors.fill: parent
                                                            height: textItemQexp_Diaphra_tp5.implicitHeight
                                                            width: textItemQexp_Diaphra_tp5.implicitWidth
                                                            ///width: parent.width/2
                                                            color:"transparent"
                                                            z: -1
                                                            border.color: "steelblue"
                                                        }

                                                    }
                                                }
                                            }
                                            Button {
                                                width: parent.width
                                                text: qsTr("Calcul Qexp")
                                                onClicked: {
                                                    tableModelQexp_Diaphra_tp5.calculQexpMoy_Diaphra_tp5();
                                                }
                                            }
                                            Row {
                                                width: parent.width
                                                spacing: 2
                                                Label {
                                                    id:labeltextQexp_Diaphra_tp5
                                                    width: text.width
                                                    height: textQexp_Diaphra_tp5.height
                                                    text: qsTr("QexpMoy=")
                                                    horizontalAlignment: Text.AlignRight
                                                    verticalAlignment: Text.AlignVCenter
                                                }
                                                TextField {
                                                    id:textQexp_Diaphra_tp5
                                                    width: parent.width-labeltextQexp_Diaphra_tp5.width-labeltextunitQexp_Diaphra_tp5.width-10
                                                    placeholderText: qsTr("QexpMoy")
                                                    ///enabled: false
                                                    text: ((qexp1modelQexp_Diaphra_tp5+qexp2modelQexp_Diaphra_tp5+qexp3modelQexp_Diaphra_tp5)/3).toFixed(3)
                                                    onTextChanged: qexpMoy_Diaphra=textQexp_Diaphra_tp5.text
                                                }
                                                Label {
                                                    id:labeltextunitQexp_Diaphra_tp5
                                                    width: text.width
                                                    height: textQexp_Diaphra_tp5.height
                                                    text: qsTr("l/s")
                                                    horizontalAlignment: Text.AlignLeft
                                                    verticalAlignment: Text.AlignVCenter
                                                }
                                            }
                                        }
                                        standardButtons: Dialog.Ok
                                        onAccepted: {
                                            qexpMoy_Diaphra=qexpMoy_Diaphra.toFixed(3)
                                            tableModel1_Diaphra_tp5.setRow(indexqexpMoy_Diaphra, {Qexp:qexpMoy_Diaphra,DH:tableModel1_Diaphra_tp5.rows[indexqexpMoy_Diaphra].DH,Qtheo:tableModel1_Diaphra_tp5.rows[indexqexpMoy_Diaphra].Qtheo,Cd:tableModel1_Diaphra_tp5.rows[indexqexpMoy_Diaphra].Cd,})
                                            if (indexqexpMoy_Diaphra==2) qexp1tableModel1_Diaphra_tp5=qexpMoy_Diaphra
                                            if (indexqexpMoy_Diaphra==3) qexp2tableModel1_Diaphra_tp5=qexpMoy_Diaphra
                                            if (indexqexpMoy_Diaphra==4) qexp3tableModel1_Diaphra_tp5=qexpMoy_Diaphra
                                            tableModel1_Diaphra_tp5.updatechart1_Diaphra_tp5();
                                            close()
                                        }
                                    }
                                }
                            }

                        }
                        Rectangle {
                            width: parent.width-rectabview1_Diaphra_tp5.width
                            height: rectabview1_Diaphra_tp5.height
                            ///color:"transparent"
                            color: Material.dialogColor
                            ChartView {
                                id: myChart_Diaphra_tp5
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
                                ///legend.visible: false
                                theme: ChartView.ChartThemeDark
                                ScatterSeries{
                                    id:scatterSerie1_Diaphra_tp5
                                    axisX: axisX_Diaphra
                                    axisY: axisY_Diaphra
                                    markerSize: 30
                                    name: "Qtheo=f(Qexp) for Orifice" ///"Scatter"
                                    borderColor: "transparent"
                                    brush: gui.chartBrush
                                    markerShape: ScatterSeries.MarkerShapeRectangle
                                    pointsVisible: true
                                }
                                ValueAxis {
                                    id: axisX_Diaphra
                                    gridVisible: true
                                    titleText:  "Qexp l/s"
                                }
                                ValueAxis {
                                    id: axisY_Diaphra
                                    gridVisible: true
                                    titleText: "Qtheo l/s"
                                }
                                PinchArea{
                                    id: pa_Diaphra
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
                                        myChart_tp5.zoomReset();

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
                                        myChart_Diaphra_tp5.zoomIn(r);
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
                                            myChart_Diaphra_tp5.zoomReset();
                                            parent.currentPinchScaleX = 1;
                                            parent.currentPinchScaleY = 1;
                                        }
                                    }

                                    Item {
                                        // A virtual item to receive drag signals from the MouseArea.
                                        // When x or y properties are changed by the MouseArea's
                                        // drag signals, the ChartView is scrolled accordingly.
                                        id: dragTarget_Diaphra

                                        property real oldX : x
                                        property real oldY : y

                                        onXChanged: {
                                            myChart_tp5.scrollLeft( x - oldX );
                                            oldX = x;
                                        }
                                        onYChanged: {
                                            myChart_tp5.scrollUp( y - oldY );
                                            oldY = y;
                                        }
                                    }
                                }


                            }
                        }

                    }

                }///fin

            }
        }
    }
    Component.onCompleted: {
        ///console.log("settings.dh1tableModel1_venturie_tp5=:"+settings.dh1tableModel1_venturie_tp5)
        tableModel1_venturie_tp5.appendRow({Qexp:settings.qexp1tableModel1_venturie_tp5,DH:settings.dh1tableModel1_venturie_tp5,Qtheo:settings.qtheo1tableModel1_venturie_tp5,Cd:settings.cd1tableModel1_venturie_tp5})
        tableModel1_venturie_tp5.appendRow({Qexp:settings.qexp2tableModel1_venturie_tp5,DH:settings.dh2tableModel1_venturie_tp5,Qtheo:settings.qtheo2tableModel1_venturie_tp5,Cd:settings.cd2tableModel1_venturie_tp5})
        tableModel1_venturie_tp5.appendRow({Qexp:settings.qexp3tableModel1_venturie_tp5,DH:settings.dh3tableModel1_venturie_tp5,Qtheo:settings.qtheo3tableModel1_venturie_tp5,Cd:settings.cd3tableModel1_venturie_tp5})

        tableModel1_Diaphra_tp5.appendRow({Qexp:settings.qexp1tableModel1_Diaphra_tp5,DH:settings.dh1tableModel1_Diaphra_tp5,Qtheo:settings.qtheo1tableModel1_Diaphra_tp5,Cd:settings.cd1tableModel1_Diaphra_tp5})
        tableModel1_Diaphra_tp5.appendRow({Qexp:settings.qexp2tableModel1_Diaphra_tp5,DH:settings.dh2tableModel1_Diaphra_tp5,Qtheo:settings.qtheo2tableModel1_Diaphra_tp5,Cd:settings.cd2tableModel1_Diaphra_tp5})
        tableModel1_Diaphra_tp5.appendRow({Qexp:settings.qexp3tableModel1_Diaphra_tp5,DH:settings.dh3tableModel1_Diaphra_tp5,Qtheo:settings.qtheo3tableModel1_Diaphra_tp5,Cd:settings.cd3tableModel1_Diaphra_tp5})

        tableModel1_venturie_tp5.updatechart1_venturie_tp5();
        tableModel1_Diaphra_tp5.updatechart1_Diaphra_tp5();
    }
}
