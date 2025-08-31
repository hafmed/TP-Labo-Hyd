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

    function calculmass() {
        mass=0;
        if (radiobutton1_tp3.checked) mass=mass+0.25
        if (radiobutton2_tp3.checked) mass=mass+0.5
        if (radiobutton3_tp3.checked) mass=mass+0.5
        if (radiobutton4_tp3.checked) mass=mass+1
        if (radiobutton5_tp3.checked) mass=mass+2.5
        if (radiobutton6_tp3.checked) mass=mass+5
        mass_tp3=mass;
        savesettings();
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
            // Rectangle {
            //        height: 10
            //        width: parent.width
            //        color: "transparent"
            //    }
            ButtonGroup {
                id:buttongroup1_tp3
                buttons: rowgroupbutton1_tp3.children
                exclusive : false
                onClicked: calculmass()

            }
            GridLayout {
                id:rowgroupbutton1_tp3
                columns: 3
                width:  parent.width

                RadioButton {
                    id:radiobutton1_tp3
                    checked: settings.radiobutton1ischecked_tp3
                    text: qsTr("M=1/4Kg")
                    ButtonGroup.group: buttongroup1_tp3
                    onCheckedChanged: radiobutton1ischecked_tp3=radiobutton1_tp3.checked
                }
                RadioButton {
                    id:radiobutton2_tp3
                    checked: settings.radiobutton2ischecked_tp3
                    text: qsTr("M=1/2Kg")
                    ButtonGroup.group: buttongroup1_tp3
                    onCheckedChanged: radiobutton2ischecked_tp3=radiobutton2_tp3.checked
                }
                RadioButton {
                    id:radiobutton3_tp3
                    checked: settings.radiobutton3ischecked_tp3
                    text: qsTr("M=1/2Kg")
                    ButtonGroup.group: buttongroup1_tp3
                    onCheckedChanged: radiobutton3ischecked_tp3=radiobutton3_tp3.checked
                }
                RadioButton {
                    id:radiobutton4_tp3
                    checked: settings.radiobutton4ischecked_tp3
                    text: qsTr("M=1Kg")
                    ButtonGroup.group: buttongroup1_tp3
                    onCheckedChanged: radiobutton4ischecked_tp3=radiobutton4_tp3.checked
                }
                RadioButton {
                    id:radiobutton5_tp3
                    checked: settings.radiobutton5ischecked_tp3
                    text: qsTr("M=2+1/2Kg")
                    ButtonGroup.group: buttongroup1_tp3
                    onCheckedChanged: radiobutton5ischecked_tp3=radiobutton5_tp3.checked
                }
                RadioButton {
                    id:radiobutton6_tp3
                    checked: settings.radiobutton6ischecked_tp3
                    text: qsTr("M=5Kg")
                    ButtonGroup.group: buttongroup1_tp3
                    onCheckedChanged: radiobutton6ischecked_tp3=radiobutton6_tp3.checked
                }

            }
            Row{
                width:parent.width
                spacing: 3

                Image {
                    id: imagehelp1_tp2
                    width: parent.width/2
                    /// scale: 0.5
                    smooth: true
                    fillMode: Image.PreserveAspectFit
                    source: "images/Viscosim_help1_tp3.jpg"
                }

                Column {
                    width: parent.width/2
                    height: imagehelp1_tp2.height
                    spacing: 10

                    Row {
                        width: parent.width
                        spacing: 2
                        Label {
                            id:labeltextmass_tp3
                            width: text.width
                            height: textmass_tp3.height
                            text: qsTr("Mass=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textmass_tp3
                            width: parent.width-labeltextmass_tp3.width-labeltextunit_tp3.width-10
                            placeholderText: qsTr("Mass")
                            text: settings.mass_tp3
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textmass_tp3.text==="nan" || textmass_tp3.text==="NaN") textmass_tp3.text=0.25 ;
                                mass_tp3=textmass_tp3.text}
                        }
                        Label {
                            id:labeltextunit_tp3
                            width: text.width
                            height: textmass_tp3.height
                            text: qsTr("Kg")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Row {
                        width: parent.width
                        spacing: 2
                        Label {
                            id:labeldiamtext_tp3
                            width: text.width
                            height: textdiampiston_tp3.height
                            text: qsTr("D=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textdiampiston_tp3
                            width: parent.width-labeldiamtext_tp3.width-labelunitdia_tp3.width-10
                            placeholderText: qsTr("Diameter of Deadweight Calibrator Piston")
                            text:  settings.diampiston_tp3
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textdiampiston_tp3.text==="nan" || textdiampiston_tp3.text==="NaN") textdiampiston_tp3.text=0.017655;
                                diampiston_tp3=textdiampiston_tp3.text}
                        }
                        Label {
                            id:labelunitdia_tp3
                            width: text.width
                            height: textdiampiston_tp3.height
                            text: qsTr("m")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Row {
                        width: parent.width
                        spacing: 2
                        Label {
                            id:labeltextmasspidton_tp3
                            width: text.width
                            height: textmasspiston_tp3.height
                            text: qsTr("Mass Piston=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textmasspiston_tp3
                            width: parent.width-labeltextmasspidton_tp3.width-labeltextunit2_tp3.width-10
                            placeholderText: qsTr("Mass")
                            text: settings.masspiston_tp3
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textmasspiston_tp3.text==="nan" || textmasspiston_tp3.text==="NaN") textmasspiston_tp3.text=0.5 ;
                                masspiston_tp3=textmasspiston_tp3.text}
                        }
                        Label {
                            id:labeltextunit2_tp3
                            width: text.width
                            height: textmass_tp3.height
                            text: qsTr("Kg")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                }
            }
            Row {
                width: parent.width
                spacing: 2
                TextField {
                    id:textpressionmesur_tp3
                    width: parent.width-comboxunitpression_tp3.width
                    enabled: false
                    color: 'red'
                    placeholderText: qsTr("for (Mass=")+mass_tp3+"+"+masspiston_tp3+"Kg) "+qsTr("the pressure of liquid is: ")
                    text: "P="+(((mass_tp3+masspiston_tp3)*9.81/(Math.PI*diampiston_tp3*diampiston_tp3/4))*factunitpression).toFixed(3)
                    onTextChanged: {
                        pressionmesur_tp3=((mass_tp3+masspiston_tp3)*9.81/(Math.PI*diampiston_tp3*diampiston_tp3/4)*factunitpression).toFixed(3)
                    }
                }
                ComboBox {
                    id:comboxunitpression_tp3
                    width: 150
                    model: ["KN/m2","Pa", "Bar", "mBar"]
                    currentIndex: settings.comboxunitpression_Index_tp3
                    onCurrentIndexChanged: {
                        if (currentIndex===0) {unitpression_tp3="KN/m2";factunitpression=0.001}
                        if (currentIndex===1) {unitpression_tp3="Pa";factunitpression=1}
                        if (currentIndex===2) {unitpression_tp3="Bar";factunitpression=0.00001}
                        if (currentIndex===3) {unitpression_tp3="mBar";factunitpression=0.01}
                    }
                }
            }

            Row {
                width: parent.width
                spacing: 2
                Label {
                    id:labeltextdegreBourdonGauge_tp3
                    width: text.width
                    height: textdegreBourdonGauge_tp3.height
                    text: qsTr("Degree=")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                }
                TextField {
                    id:textdegreBourdonGauge_tp3
                    width: parent.width-labeltextdegreBourdonGauge_tp3.width-labeltextunit3_tp3.width-10
                    placeholderText: qsTr("Degree Bourdon Gauge")
                    text: settings.degreBourdonGauge_tp3
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textdegreBourdonGauge_tp3.text==="nan" || textdegreBourdonGauge_tp3.text==="NaN") textdegreBourdonGauge_tp3.text=0 ;
                        degreBourdonGauge_tp3=textdegreBourdonGauge_tp3.text}
                }
                Label {
                    id:labeltextunit3_tp3
                    width: text.width
                    height: textdegreBourdonGauge_tp3.height
                    text: qsTr("°")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }
            }

            ////////////
            TabBar {
                id: tabbar1_tp3
                width: parent.width
                TabButton {
                    text: qsTr("Table")
                    width: implicitWidth
                }
                TabButton {
                    text: qsTr("Graph")
                    width: implicitWidth
                }
                onCurrentIndexChanged: tableModel1_tp3.updatechart1_tp3();
            }

            StackLayout {
                id: view
                width: parent.width
                currentIndex: tabbar1_tp3.currentIndex
                ///anchors.fill: parent

                Rectangle {
                    id:rectabview1_tp3
                    width: parent.width
                    height: 250
                    color: "transparent"
                    HorizontalHeaderView {
                        id: horizontalHeader1_tp3
                        anchors.left: tabview1_tp3.left
                        anchors.top: parent.top
                        syncView: tabview1_tp3
                        clip: true
                        model: ["P(kN/m2)" , "Degrees (°)","Tension (mV)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeader1_tp3
                        anchors.top: tabview1_tp3.top
                        anchors.left: parent.left
                        syncView: tabview1_tp3
                        clip: true
                    }
                    TableView {
                        id:tabview1_tp3
                        anchors.left: verticalHeader1_tp3.right
                        anchors.top: horizontalHeader1_tp3.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBar;
                            active:true
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModel1_tp3
                            TableModelColumn { display: "Pressure" }
                            TableModelColumn { display: "Degrees" }
                            TableModelColumn { display: "Tension" }
                            function updatechart1_tp3()
                            {
                                myChart_tp3.removeAllSeries();
                                var line1 = myChart_tp3.createSeries(scatterSerie1_tp3, "Degrees =f (P) ", axisX, axisY);
                                var line2 = myChart_tp3.createSeries(scatterSerie2_tp3, "Tension =f (P) ", axisX, axisZ);
                                line1.pointsVisible = true;
                                line2.pointsVisible = true;

                                line1.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                                line1.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function

                                var maxPressure=parseFloat(tableModel1_tp3.rows[0].Pressure);
                                var maxDegrees=parseFloat(tableModel1_tp3.rows[0].Degrees);
                                var maxTension=parseFloat(tableModel1_tp3.rows[0].Tension);

                                var miniPressure=parseFloat(tableModel1_tp3.rows[0].Pressure);
                                var miniDegrees=parseFloat(tableModel1_tp3.rows[0].Degrees);
                                var miniTension=parseFloat(tableModel1_tp3.rows[0].Tension);

                                for (var i = 0; i < tableModel1_tp3.rowCount; i++)  {
                                    if (tableModel1_tp3.rows[i].Pressure > maxPressure)
                                        maxPressure=parseFloat(tableModel1_tp3.rows[i].Pressure) ;
                                    if (tableModel1_tp3.rows[i].Tension > maxTension)
                                        maxTension=parseFloat(tableModel1_tp3.rows[i].Tension) ;
                                    if (tableModel1_tp3.rows[i].Pressure < miniPressure)
                                        miniPressure=parseFloat(tableModel1_tp3.rows[i].Pressure) ;
                                    if (tableModel1_tp3.rows[i].Tension < miniTension)
                                        miniTension=parseFloat(tableModel1_tp3.rows[i].Tension) ;
                                    if (tableModel1_tp3.rows[i].Degrees > maxDegrees)
                                        maxDegrees=parseFloat(tableModel1_tp3.rows[i].Degrees) ;
                                    if (tableModel1_tp3.rows[i].Degrees < miniDegrees)
                                        miniDegrees=parseFloat(tableModel1_tp3.rows[i].Degrees) ;
                                }
                                for (i = 0; i < tableModel1_tp3.rowCount; i++)  {
                                    if (tableModel1_tp3.rows[i].Tension!==0
                                            && tableModel1_tp3.rows[i].Pressure!==""
                                            && tableModel1_tp3.rows[i].Degrees!==""
                                            ){
                                        line1.append(tableModel1_tp3.rows[i].Pressure,tableModel1_tp3.rows[i].Degrees)
                                        line2.append(tableModel1_tp3.rows[i].Pressure,tableModel1_tp3.rows[i].Tension)
                                    }
                                }
                                axisX.min = Math.round(miniPressure-0.1*miniPressure);
                                axisX.max = Math.round(maxPressure+0.1*maxPressure);
                                axisY.min = Math.round(miniDegrees-0.1*miniDegrees);
                                axisY.max = Math.round(maxDegrees+0.1*maxDegrees);
                                axisZ.min = Math.round(miniTension-0.1*miniTension);
                                axisZ.max = Math.round(maxTension+0.1*maxTension);

                                ///console.log("maxQexp="+maxQexp)
                                pressuretableModel1_tp3=tableModel1_tp3.rows[0].Pressure
                                pressuretableModel2_tp3=tableModel1_tp3.rows[1].Pressure
                                pressuretableModel3_tp3=tableModel1_tp3.rows[2].Pressure
                                pressuretableModel4_tp3=tableModel1_tp3.rows[3].Pressure
                                pressuretableModel5_tp3=tableModel1_tp3.rows[4].Pressure

                                degreestableModel1_tp3=tableModel1_tp3.rows[0].Degrees
                                degreestableModel2_tp3=tableModel1_tp3.rows[1].Degrees
                                degreestableModel3_tp3=tableModel1_tp3.rows[2].Degrees
                                degreestableModel4_tp3=tableModel1_tp3.rows[3].Degrees
                                degreestableModel5_tp3=tableModel1_tp3.rows[4].Degrees

                                tensiontableModel1_tp3=tableModel1_tp3.rows[0].Tension
                                tensiontableModel2_tp3=tableModel1_tp3.rows[1].Tension
                                tensiontableModel3_tp3=tableModel1_tp3.rows[2].Tension
                                tensiontableModel4_tp3=tableModel1_tp3.rows[3].Tension
                                tensiontableModel5_tp3=tableModel1_tp3.rows[4].Tension
                            }
                        }
                        delegate: DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate:TextInput {
                                    id:textItem1_tp3
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 27
                                    ///wrapMode: Text.WordWrap
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    ///color:"white"
                                    onEditingFinished: {
                                        model.display = text
                                    }
                                    onAccepted: {
                                        tableModel1_tp3.updatechart1_tp3();
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textItem1_tp3.implicitHeight
                                        width: textItem1_tp3.implicitWidth
                                        ///width: parent.width/2
                                        color:"transparent"
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 1
                                // For 1st column we use CheckBox component
                                delegate:TextInput {
                                    id:textItem2_tp3
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 27
                                    ///wrapMode: Text.WordWrap
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    ///color:"white"
                                    onEditingFinished: {
                                        model.display = text
                                    }
                                    onAccepted: {
                                        tableModel1_tp3.updatechart1_tp3();
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textItem2_tp3.implicitHeight
                                        width: textItem2_tp3.implicitWidth
                                        ///width: parent.width/2
                                        color:"transparent"
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 2
                                // For 1st column we use CheckBox component
                                delegate:TextInput {
                                    id:textItem3_tp3
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 27
                                    ///wrapMode: Text.WordWrap
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    ///color:"white"
                                    onEditingFinished: {
                                        model.display = text
                                    }
                                    onAccepted: {
                                        tableModel1_tp3.updatechart1_tp3();
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textItem3_tp3.implicitHeight
                                        width: textItem3_tp3.implicitWidth
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
                    width: parent.width-rectabview1_tp3.width
                    height: rectabview1_tp3.height
                    color:"transparent"
                    ChartView {
                        id: myChart_tp3
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
                            id:scatterSerie1_tp3
                            axisX: axisX
                            axisY: axisY
                            markerSize: 30
                            name:"Scatter"
                            borderColor: "transparent"
                            brush: gui.chartBrush
                            markerShape: ScatterSeries.MarkerShapeRectangle
                            pointsVisible: true
                        }
                        ScatterSeries{
                            id:scatterSerie2_tp3
                            axisX: axisX
                            axisY: axisZ
                            markerSize: 30
                            name:"Scatter"
                            borderColor: "transparent"
                            brush: gui.chartBrush
                            markerShape: ScatterSeries.MarkerShapeRectangle
                            pointsVisible: true
                        }
                        ValueAxis {
                            id: axisX
                            gridVisible: true
                            titleText:  "Calibrator kN/m2"///"T (&deg;C)"
                            ///labelFormat: "%d&deg;C"
                        }
                        ValueAxis {
                            id: axisY
                            gridVisible: true
                            titleText: "Degrees"///"Calibrator kN/m2"
                            ///labelFormat: "%d mPa.s"
                        }
                        ValueAxis {
                            id: axisZ
                            gridVisible: true
                            titleText: "mV"///"Calibrator kN/m2"
                            ///labelFormat: "%d mPa.s"
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
                                myChart_tp3.zoomReset();

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
                                myChart_tp3.zoomIn(r);
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
                                    myChart_tp3.zoomReset();
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
                                    myChart_tp3.scrollLeft( x - oldX );
                                    oldX = x;
                                }
                                onYChanged: {
                                    myChart_tp3.scrollUp( y - oldY );
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
        tableModel1_tp3.appendRow({Pressure:settings.pressuretableModel1_tp3,Degrees:settings.degreestableModel1_tp3,Tension:settings.tensiontableModel1_tp3})
        tableModel1_tp3.appendRow({Pressure:settings.pressuretableModel2_tp3,Degrees:settings.degreestableModel2_tp3,Tension:settings.tensiontableModel2_tp3})
        tableModel1_tp3.appendRow({Pressure:settings.pressuretableModel3_tp3,Degrees:settings.degreestableModel3_tp3,Tension:settings.tensiontableModel3_tp3})
        tableModel1_tp3.appendRow({Pressure:settings.pressuretableModel4_tp3,Degrees:settings.degreestableModel4_tp3,Tension:settings.tensiontableModel4_tp3})
        tableModel1_tp3.appendRow({Pressure:settings.pressuretableModel5_tp3,Degrees:settings.degreestableModel5_tp3,Tension:settings.tensiontableModel5_tp3})

        tableModel1_tp3.updatechart1_tp3();
    }
}
