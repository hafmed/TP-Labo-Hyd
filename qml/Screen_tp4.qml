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
                source: tabbar1_tp4.currentIndex===0? "images/TP_4-Fig1.jpg":"images/TP_4-Fig2.jpg"
            }
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
                Label {
                    id:labelrolgkgm3_tp4
                    width: text.width
                    height: textrolgkgm3_tp4.height
                    text: qsTr("\u03C1_liquid=")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                }
                TextField {
                    id:textrolgkgm3_tp4
                    width: parent.width-labelrolgkgm3_tp4.width-labelunitrolgkgm3_tp4.width-10
                    placeholderText: qsTr("density of liquid")
                    text: settings.rolkgm3_tp4
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textrolgkgm3_tp4.text==="nan" || textrolgkgm3_tp4.text==="NaN") textrolgkgm3_tp4.text=1000 ;
                        rolkgm3_tp4=textrolgkgm3_tp4.text}
                }
                Label {
                    id: labelunitrolgkgm3_tp4
                    height: textrolgkgm3_tp4.height
                    text: qsTr("kg/m3")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Row {
                width: parent.width
                spacing: 2
                Row {
                    width: parent.width/2
                    spacing: 2
                    Label {
                        id:labeltextD_tp4
                        width: text.width
                        height: textD_tp4.height
                        text: qsTr("D=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textD_tp4
                        width: parent.width-labeltextD_tp4.width-labeltextunitD_tp4.width-10
                        placeholderText: qsTr("Height of quadrant endface")
                        text: settings.dQuadrant_tp4
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textD_tp4.text==="nan" || textD_tp4.text==="NaN") textD_tp4.text=0.100 ;
                            dQuadrant_tp4=textD_tp4.text}
                    }
                    Label {
                        id:labeltextunitD_tp4
                        width: text.width
                        height: textD_tp4.height
                        text: qsTr("m")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Row {
                    width: parent.width/2
                    spacing: 2
                    Label {
                        id:labeltextB_tp4
                        width: text.width
                        height: textB_tp4.height
                        text: qsTr("B=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textB_tp4
                        width: parent.width-labeltextB_tp4.width-labeltextunitB_tp4.width-10
                        placeholderText: qsTr("Width of submerged")
                        text: settings.bQuadrant_tp4
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textB_tp4.text==="nan" || textB_tp4.text==="NaN") textB_tp4.text=0.075 ;
                            bQuadrant_tp4=textB_tp4.text}
                    }
                    Label {
                        id:labeltextunitB_tp4
                        width: text.width
                        height: textB_tp4.height
                        text: qsTr("m")
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
                        id:labeltextL_tp4
                        width: text.width
                        height: textL_tp4.height
                        text: qsTr("L=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textL_tp4
                        width: parent.width-labeltextL_tp4.width-labeltextunitL_tp4.width-10
                        placeholderText: qsTr("Length of balance arm")
                        text: settings.l_tp4
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textL_tp4.text==="nan" || textL_tp4.text==="NaN") textL_tp4.text=0.275 ;
                            l_tp4=textL_tp4.text}
                    }
                    Label {
                        id:labeltextunitL_tp4
                        width: text.width
                        height: textL_tp4.height
                        text: qsTr("m")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Row {
                    width: parent.width/2
                    spacing: 2
                    Label {
                        id:labeltextH_tp4
                        width: text.width
                        height: textH_tp4.height
                        text: qsTr("H=")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextField {
                        id:textH_tp4
                        width: parent.width-labeltextH_tp4.width-labeltextunitH_tp4.width-10
                        placeholderText: qsTr("Distance from base of quadrant to pivot")
                        text: settings.h_tp4
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textH_tp4.text==="nan" || textH_tp4.text==="NaN") textH_tp4.text=0.200 ;
                            h_tp4=textH_tp4.text}
                    }
                    Label {
                        id:labeltextunitH_tp4
                        width: text.width
                        height: textH_tp4.height
                        text: qsTr("m")
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }
                }

            }

            ////////////
            TabBar {
                id: tabbar1_tp4
                width: parent.width
                TabButton {
                    text: qsTr("Partially submerged quadrant")
                    width: implicitWidth
                }
                /// ToolSeparator {}
                TabButton {
                    text: qsTr("Fully submerged quadrant")
                    width: implicitWidth
                }
                ///onCurrentIndexChanged: ///tableModel1_tp3.updatechart1_tp3();
            }

            StackLayout {
                id: view
                width: parent.width
                currentIndex: tabbar1_tp4.currentIndex
                ///anchors.fill: parent

                ////1
                Column {
                    id:column_PartiallySubmerged_tp4
                    width: parent.width
                    height: 250
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_Measured_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label1_Measured_tp4
                            width: label1_Measured_tp4.text.width
                            text: "Measured"
                            anchors.fill: parent.center
                        }
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_Measured_tp4.width)/2
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
                                id:labeltextm1_tp4
                                width: text.width
                                height: textm1_tp4.height
                                text: qsTr("m=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textm1_tp4
                                width: parent.width-labeltextm1_tp4.width-labeltextm1_tp4.width-10
                                placeholderText: qsTr("")
                                text: settings.mPartially_sub_tp4
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textm1_tp4.text==="nan" || textm1_tp4.text==="NaN") textm1_tp4.text=0 ;
                                    mPartially_sub_tp4=textm1_tp4.text}
                            }
                            Label {
                                id:labeltextunitm1_tp4
                                width: text.widthMass
                                height: textm1_tp4.height
                                text: qsTr("g")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Row {
                            width: parent.width/2
                            spacing: 2
                            Label {
                                id:labeltextd1_tp4
                                width: text.width
                                height: textd1_tp4.height
                                text: qsTr("d=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textd1_tp4
                                width: parent.width-labeltextd1_tp4.width-labeltextunitd1_tp4.width-10
                                placeholderText: qsTr("Depth of Immersion")
                                text: settings.dPartially_sub_tp4
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textd1_tp4.text==="nan" || textd1_tp4.text==="NaN") textd1_tp4.text=0 ;
                                    dPartially_sub_tp4=textd1_tp4.text}
                            }
                            Label {
                                id:labeltextunitd1_tp4
                                width: text.width
                                height: textd1_tp4.height
                                text: qsTr("mm")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_Calculated_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label1_Calculated_tp4
                            width: label1_Calculated_tp4.text.width
                            text: "Calculated"
                            anchors.fill: parent.center
                        }
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_Calculated_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                    }
                    TabBar {
                        id: tabbar2_tp4
                        width: parent.width
                        TabButton {
                            text: qsTr("Hydrostatic Thrust")
                            width: implicitWidth
                        }
                        TabButton {
                            text: qsTr("Centre of Pressure")
                            width: implicitWidth
                        }
                    }

                    StackLayout {
                        id: view2_tp4
                        width: parent.width
                        currentIndex: tabbar2_tp4.currentIndex
                        Column {
                            id:column3_tp4
                            width: parent.width
                            height: 250
                            Row {
                                width: parent.width
                                spacing: 0
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label2_Measured_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                                Label {
                                    id:label2_Measured_tp4
                                    width: label2_Measured_tp4.text.width
                                    text: "Theoretical"
                                    anchors.fill: parent.center
                                }
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label2_Measured_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 2
                                Image {
                                    id: imagehelp3_tp4
                                    width:imagehelp3_tp4.source.width
                                    height: texttheoHydostaticF_tp4.height
                                    scale: 1
                                    smooth: true
                                    fillMode: Image.PreserveAspectFit
                                    source:  "images/TP_4-Fig3.jpg"
                                }
                                TextField {
                                    id:texttheoHydostaticF_tp4
                                    width: parent.width-imagehelp3_tp4.width-10
                                    enabled: false
                                    color: 'red'
                                    placeholderText: qsTr("Hydrostatic Thrust for Partially submerged quadrant")
                                    text: "F="+(1./2*(rolkgm3_tp4*9.81*bQuadrant_tp4*dPartially_sub_tp4*0.001*dPartially_sub_tp4*0.001)).toFixed(3)+qsTr(" N")
                                    onTextChanged: {
                                        theoHydostaticF_Partially_sub_tp4=(1./2*(rolkgm3_tp4*9.81*bQuadrant_tp4*dPartially_sub_tp4*0.001*dPartially_sub_tp4*0.001)).toFixed(3)
                                    }
                                }
                            }

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
                                    text: "Theoretical"
                                    anchors.fill: parent.center
                                }
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_Theoretical_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 2
                                Image {
                                    id: imagehelp4_tp4
                                    width:imagehelp3_tp4.source.width
                                    height: texttheoHydostaticF_tp4.height
                                    scale: 1
                                    smooth: true
                                    fillMode: Image.PreserveAspectFit
                                    source:  "images/TP_4-Fig4.jpg"
                                }
                                TextField {
                                    id:texttheoHydostaticF2_tp4
                                    width: parent.width-imagehelp4_tp4.width-10
                                    enabled: false
                                    color: 'red'
                                    placeholderText: qsTr("Theoretical Centre of Pressure for Partially Submerged Body")
                                    text: "y="+(h_tp4-dPartially_sub_tp4*0.001/3).toFixed(3)*1000+qsTr(" mm")
                                    onTextChanged: {
                                        theoCentrePressure_Partially_sub_tp4=(h_tp4-dPartially_sub_tp4*0.001/3).toFixed(3)*1000
                                    }
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 0
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_Measured_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                                Label {
                                    id:label3_Measured_tp4
                                    width: label3_Measured_tp4.text.width
                                    text: "Experimental"
                                    anchors.fill: parent.center
                                }

                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_Measured_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 2
                                Image {
                                    id: imagehelp5_tp4
                                    width:imagehelp3_tp4.source.width
                                    height: texexpCentrePressure1_tp4.height
                                    scale: 1
                                    smooth: true
                                    fillMode: Image.PreserveAspectFit
                                    source:  "images/TP_4-Fig5.jpg"
                                }
                                TextField {
                                    id:texexpCentrePressure1_tp4
                                    width: parent.width-imagehelp5_tp4.width-10
                                    enabled: false
                                    color: 'red'
                                    placeholderText: qsTr("Experimental Centre of Pressure for Partially Submerged Body")
                                    text: "y="+(mPartially_sub_tp4*0.001*9.81*l_tp4/theoHydostaticF_Partially_sub_tp4).toFixed(3)*1000+qsTr(" mm")
                                    onTextChanged: {
                                        expCentrePressure_Partially_sub_tp4=(mPartially_sub_tp4*0.001*9.81*l_tp4/theoHydostaticF_Partially_sub_tp4).toFixed(3)*1000
                                    }
                                }
                            }
                            TextField {
                                id:textCentrePrressureerror1_tp4
                                width: parent.width
                                enabled: false
                                color: 'red'
                                placeholderText: qsTr("Error Centre of pressure (%)")
                                text: ((expCentrePressure_Partially_sub_tp4-theoCentrePressure_Partially_sub_tp4)/(theoCentrePressure_Partially_sub_tp4)*100).toFixed(2)+ "%"
                            }
                        }

                    }

                }///fin
                ////2

                Column {
                    id:column_FullySubmerged_tp4
                    width: parent.width
                    height: 250
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1FullySub_Measured_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label1FullySub_Measured_tp4
                            width: label1FullySub_Measured_tp4.text.width
                            text: "Measured"
                            anchors.fill: parent.center
                        }
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1FullySub_Measured_tp4.width)/2
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
                                id:labeltextm1FullySub_tp4
                                width: text.width
                                height: textm1FullySub_tp4.height
                                text: qsTr("m=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textm1FullySub_tp4
                                width: parent.width-labeltextm1FullySub_tp4.width-labeltextm1FullySub_tp4.width-10
                                placeholderText: qsTr("Mass")
                                text: settings.mFully_sub_tp4
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textm1FullySub_tp4.text==="nan" || textm1FullySub_tp4.text==="NaN") textm1FullySub_tp4.text=0 ;
                                    mFully_sub_tp4=textm1FullySub_tp4.text}
                            }
                            Label {
                                id:labeltextunitm1FullySub_tp4
                                width: text.width
                                height: textm1FullySub_tp4.height
                                text: qsTr("g")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Row {
                            width: parent.width/2
                            spacing: 2
                            Label {
                                id:labeltextd1FullySub_tp4
                                width: text.width
                                height: textd1FullySub_tp4.height
                                text: qsTr("d=")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                            }
                            TextField {
                                id:textd1FullySub_tp4
                                width: parent.width-labeltextd1FullySub_tp4.width-labeltextunitd1FullySub_tp4.width-10
                                placeholderText: qsTr("Depth of Immersion")
                                text: settings.dFully_sub_tp4
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textd1FullySub_tp4.text==="nan" || textd1FullySub_tp4.text==="NaN") textd1FullySub_tp4.text=0 ;
                                    dFully_sub_tp4=textd1FullySub_tp4.text}
                            }
                            Label {
                                id:labeltextunitd1FullySub_tp4
                                width: text.width
                                height: textd1FullySub_tp4.height
                                text: qsTr("mm")
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                    Row {
                        width: parent.width
                        spacing: 0
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_CalculatedFullySub_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                        Label {
                            id:label1_CalculatedFullySub_tp4
                            width: label1_CalculatedFullySub_tp4.text.width
                            text: "Calculated"
                            anchors.fill: parent.center
                        }
                        ToolSeparator {
                            height: 25
                            width: (parent.width-label1_CalculatedFullySub_tp4.width)/2
                            orientation: Qt.Horizontal
                        }
                    }
                    TabBar {
                        id: tabbar2FullySub_tp4
                        width: parent.width
                        TabButton {
                            text: qsTr("Hydrostatic Thrust")
                            width: implicitWidth
                        }
                        TabButton {
                            text: qsTr("Centre of Pressure")
                            width: implicitWidth
                        }
                    }
                    StackLayout {
                        id: view2FullySub_tp4
                        width: parent.width
                        currentIndex: tabbar2FullySub_tp4.currentIndex
                        Column {
                            id:column3FullySub_tp4
                            width: parent.width
                            height: 250
                            Row {
                                width: parent.width
                                spacing: 0
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label2_MeasuredFullySub_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                                Label {
                                    id:label2_MeasuredFullySub_tp4
                                    width: label2_MeasuredFullySub_tp4.text.width
                                    text: "Theoretical"
                                    anchors.fill: parent.center
                                }
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label2_MeasuredFullySub_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 2
                                Image {
                                    id: imagehelp3FullySub_tp4
                                    width:imagehelp3FullySub_tp4.source.width
                                    height: texttheoHydostaticFFullySub_tp4.height
                                    scale: 1
                                    smooth: true
                                    fillMode: Image.PreserveAspectFit
                                    source:  "images/TP_4-Fig6.jpg"
                                }
                                TextField {
                                    id:texttheoHydostaticFFullySub_tp4
                                    width: parent.width-imagehelp3FullySub_tp4.width-10
                                    enabled: false
                                    color: 'red'
                                    placeholderText: qsTr("Hydrostatic Thrust for Fully submerged Body")
                                    text: "F="+(rolkgm3_tp4*9.81*bQuadrant_tp4*dQuadrant_tp4*(dFully_sub_tp4*0.001-dQuadrant_tp4/2)).toFixed(3)+qsTr(" N")
                                    onTextChanged: {
                                        theoHydostaticF_Fully_sub_tp4=(rolkgm3_tp4*9.81*bQuadrant_tp4*dQuadrant_tp4*(dFully_sub_tp4*0.001-dQuadrant_tp4/2)).toFixed(3)
                                    }
                                }
                            }
                        }
                        Column {
                            id:column4FullySub_tp4
                            width: parent.width
                            spacing: 7
                            height: 250
                            Row {
                                width: parent.width
                                spacing: 0
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_TheoreticalFullySub_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                                Label {
                                    id:label3_TheoreticalFullySub_tp4
                                    width: label3_TheoreticalFullySub_tp4.text.width
                                    text: "Theoretical"
                                    anchors.fill: parent.center
                                }
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_TheoreticalFullySub_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 2
                                Image {
                                    id: imagehelp4FullySub_tp4
                                    width:imagehelp3FullySub_tp4.source.width
                                    height: texttheoHydostaticFFullySub_tp4.height
                                    scale: 1
                                    smooth: true
                                    fillMode: Image.PreserveAspectFit
                                    source:  "images/TP_4-Fig7.jpg"
                                }
                                TextField {
                                    id:texttheoHydostaticF2FullySub_tp4
                                    width: parent.width-imagehelp4FullySub_tp4.width-10
                                    enabled: false
                                    color: 'red'
                                    placeholderText: qsTr("Theoretical Centre of Pressure for Fully Submerged Body")
                                    text: "y="+(((dQuadrant_tp4*dQuadrant_tp4)/12+((dFully_sub_tp4*0.001-dQuadrant_tp4/2)*(dFully_sub_tp4*0.001-dQuadrant_tp4/2)))/(dFully_sub_tp4*0.001-dQuadrant_tp4/2)+h_tp4-dFully_sub_tp4*0.001).toFixed(3)*1000+qsTr(" mm")
                                    onTextChanged: {
                                        theoCentrePressure_Fully_sub_tp4=(((dQuadrant_tp4*dQuadrant_tp4)/12+((dFully_sub_tp4*0.001-dQuadrant_tp4/2)*(dFully_sub_tp4*0.001-dQuadrant_tp4/2)))/(dFully_sub_tp4*0.001-dQuadrant_tp4/2)+h_tp4-dFully_sub_tp4*0.001).toFixed(3)*1000
                                    }
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 0
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_MeasuredFullySub_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                                Label {
                                    id:label3_MeasuredFullySub_tp4
                                    width: label3_MeasuredFullySub_tp4.text.width
                                    text: "Experimental"
                                    anchors.fill: parent.center
                                }
                                ToolSeparator {
                                    height: 25
                                    width: (parent.width-label3_MeasuredFullySub_tp4.width)/2
                                    orientation: Qt.Horizontal
                                }
                            }
                            Row {
                                width: parent.width
                                spacing: 2
                                Image {
                                    id: imagehelp5FullySub_tp4
                                    width:imagehelp3FullySub_tp4.source.width
                                    height: texexpCentrePressure1FullySub_tp4.height
                                    scale: 1
                                    smooth: true
                                    fillMode: Image.PreserveAspectFit
                                    source:  "images/TP_4-Fig8.jpg"
                                }
                                TextField {
                                    id:texexpCentrePressure1FullySub_tp4
                                    width: parent.width-imagehelp5FullySub_tp4.width-10
                                    enabled: false
                                    color: 'red'
                                    placeholderText: qsTr("Experimental Centre of Pressure for Fully Submerged Body")
                                    text: "y="+(mFully_sub_tp4*0.001*l_tp4/(rolkgm3_tp4*bQuadrant_tp4*dQuadrant_tp4*(dFully_sub_tp4*0.001-dQuadrant_tp4/2))).toFixed(3)*1000+qsTr(" mm")
                                    onTextChanged: {
                                        expCentrePressure_Fully_sub_tp4=(mFully_sub_tp4*0.001*l_tp4/(rolkgm3_tp4*bQuadrant_tp4*dQuadrant_tp4*(dFully_sub_tp4*0.001-dQuadrant_tp4/2))).toFixed(3)*1000
                                    }
                                }
                            }
                            TextField {
                                id:textCentrePrressureerror1FullySub_tp4
                                width: parent.width
                                enabled: false
                                color: 'red'
                                placeholderText: qsTr("Error Centre of pressure (%)")
                                text: ((expCentrePressure_Fully_sub_tp4-theoCentrePressure_Fully_sub_tp4)/(theoCentrePressure_Fully_sub_tp4)*100).toFixed(2)+ "%"
                            }
                        }
                    }
                }
            }
        }
    }
    Component.onCompleted: {
        ///tableModel1_tp3.updatechart1_tp3();
    }
}
