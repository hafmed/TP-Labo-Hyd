import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12

Rectangle {
    width: app.width
    height: app.height-rect.height

    color: Material.dialogColor

    function configcaractball(index) {
        comboxballcurrentIndex_tp2=index
        if (index===0) {roballgcm3_tp2=2.86 ; dballmm_tp2=10 }
        if (index===1) {roballgcm3_tp2=2.86 ; dballmm_tp2=5 }
        if (index===2) {roballgcm3_tp2=1.43 ; dballmm_tp2=10 }
        if (index===3) {roballgcm3_tp2=1.43 ; dballmm_tp2=5 }
        if (index===4) {roballgcm3_tp2=1.15 ; dballmm_tp2=10 }
        savesettings()
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
            ComboBox {
                id:comboxball_tp2
                width: parent.width
                model: ["Ball No1 (Aluminium,d=10mm)", "Ball No2 (Aluminium,d=5mm)", "Ball No3 (POM Delrin,d=10mm)",
                    "Ball No4 (POM Delrin,d=5mm)","Ball No5 (PE6.6 Nylon,d=10mm)"]
                currentIndex: settings.comboxballcurrentIndex_tp2
                onCurrentIndexChanged: {
                    configcaractball(currentIndex)
                }
            }
            Column{
                width:parent.width
                spacing: 7
                Image {
                    id: imagehelp1_tp2
                    width: parent.width

                    smooth: true
                    fillMode: Image.PreserveAspectFit
                    source: "images/Viscosim_help1_tp2.jpg"
                }
                Row {
                    width: parent.width
                    spacing: 2
                    Row {
                        width: parent.width/2
                        spacing: 2
                        Label {
                            width: parent.width/3
                            height: textroballgcm3_tp2.height
                            text: qsTr("\u03C1_ball=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textroballgcm3_tp2
                            width: parent.width/2
                            placeholderText: qsTr("density of ball")
                            text: settings.roballgcm3_tp2
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textroballgcm3_tp2.text==="nan" || textroballgcm3_tp2.text==="NaN") textroballgcm3_tp2.text=4.3 ;
                                roballgcm3_tp2=textroballgcm3_tp2.text}
                        }
                        Label {
                            width: parent.width/3
                            height: textroballgcm3_tp2.height
                            text: qsTr("g/cm3")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Row {
                        width: parent.width/2
                        spacing: 2
                        Label {
                            width: parent.width/3
                            height: textdballmm_tp2.height
                            text: qsTr("d_ball=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textdballmm_tp2
                            width: parent.width/2
                            placeholderText: qsTr("diameter of ball")
                            text: settings.dballmm_tp2
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textdballmm_tp2.text==="nan" || textdballmm_tp2.text==="NaN") textdballmm_tp2.text=1.56 ;
                                dballmm_tp2=textdballmm_tp2.text}
                        }
                        Label {
                            width: parent.width/3
                            height: textdballmm_tp2.height
                            text: qsTr("mm")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
                Row {
                    width: parent.width
                    spacing: 2
                    Row {
                        width: parent.width/2
                        spacing: 2
                        Label {
                            width: parent.width/3
                            height: textrolgcm3_tp2.height
                            text: qsTr("\u03C1_liquid=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textrolgcm3_tp2
                            width: parent.width/2
                            placeholderText: qsTr("density of liquid")
                            text: settings.rolgcm3_tp2
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textrolgcm3_tp2.text==="nan" || textrolgcm3_tp2.text==="NaN") textrolgcm3_tp2.text=0.949 ;
                                rolgcm3_tp2=textrolgcm3_tp2.text}
                        }
                        Label {
                            width: parent.width/3
                            height: textrolgcm3_tp2.height
                            text: qsTr("g/cm3")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Row {
                        width: parent.width/2
                        spacing: 2
                        Label {
                            width: parent.width/3
                            height: textdt_tp2.height
                            text: qsTr("dL=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textdl_tp2
                            width: parent.width/2
                            placeholderText: qsTr("dL mesured")
                            text: settings.dl_tp2
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textdl_tp2.text==="nan" || textdl_tp2.text==="NaN") textdl_tp2.text=150 ;
                                dl_tp2=textdl_tp2.text}
                        }
                        Label {
                            width: parent.width/3
                            height: textdt_tp2.height
                            text: qsTr("mm")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
                Row {
                    width: parent.width
                    spacing: 2
                    Row {
                        width: parent.width/2
                        spacing: 2
                        Label {
                            width: parent.width/3
                            height: textdt_tp2.height
                            text: qsTr("dt=")
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        TextField {
                            id:textdt_tp2
                            width: parent.width/2
                            placeholderText: qsTr("dt mesured")
                            text: settings.dt_tp2
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textdt_tp2.text==="nan" || textdl_tp2.text==="NaN") textdt_tp2.text=16.5 ;
                                dt_tp2=textdt_tp2.text}
                        }
                        Label {
                            width: parent.width/3
                            height: textdt_tp2.height
                            text: qsTr("s")
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    TextField {
                        id:textRe_tp2
                        width: parent.width/2-10
                        enabled: false
                        font.bold : true
                        placeholderText: qsTr("Re (Equations de Stokes (Re < 0.1))")
                        text: ((rolgcm3_tp2*(dl_tp2/dt_tp2)*dballmm_tp2)/viscodynamesur_tp2).toFixed(3)
                        color: "green"

                        // Animation to change the text color
                        ColorAnimation on color {
                            id: colorAnimation_tp2
                            from: "green"
                            to: "red"
                            duration: 1000 // 1 second
                            loops: Animation.Infinite // Loop forever
                            running: ((rolgcm3_tp2*(dl_tp2/dt_tp2)*dballmm_tp2)/viscodynamesur_tp2).toFixed(3) > 0.1 && tabBarcurrentIndex===1 //true // Start the animation automatically
                            onStopped: textRe_tp2.color="green"
                        }
                    }
                }
            }

            TextField {
                id:textviscodynamesur_tp2
                width: parent.width
                enabled: false
                color: 'red'
                placeholderText: qsTr("dynamic viscosity of liquid mesured")
                text: "\u03B7="+(((roballgcm3_tp2-rolgcm3_tp2)*dballmm_tp2*dballmm_tp2*9.81*1000)/(18*dl_tp2/dt_tp2)).toFixed(3)+" mPa.s"
                onTextChanged: {
                    viscodynamesur_tp2=(((roballgcm3_tp2-rolgcm3_tp2)*dballmm_tp2*dballmm_tp2*9.81*1000)/(18*dl_tp2/dt_tp2)).toFixed(3)
                }
            }
            TextField {
                id:textviscodynatheo_tp2
                width: parent.width
                placeholderText: qsTr("viscosity of liquid theoricaly (mPa.s)")
                text: settings.viscodynatheo_tp2
                inputMethodHints: Qt.ImhDigitsOnly
                onTextChanged: {if (textviscodynatheo_tp2.text==="nan" || textviscodynatheo_tp2.text==="NaN") textviscodynatheo_tp2.text=5.59;
                    viscodynatheo_tp2=textviscodynatheo_tp2.text}
            }
            TextField {
                id:textviscodyerror_tp2
                width: parent.width
                enabled: false
                color: 'red'
                placeholderText: qsTr("Error viscosity of liquid (%) (\u03B7_exp.-\u03B7_theo)/\u03B7_theo")
                text: ((viscodynamesur_tp2-viscodynatheo_tp2)/(viscodynatheo_tp2)*100).toFixed(2)+ "%"
            }

        }

    }
}
