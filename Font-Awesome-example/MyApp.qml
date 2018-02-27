/* Copyright 2017 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

import ArcGIS.AppFramework 1.0
import ArcGIS.AppFramework.Controls 1.0
import ArcGIS.AppFramework.SecureStorage 1.0

import "controls" as Controls

App {
    id: app
    width: 400
    height: 750

    function units(value) {
        return AppFramework.displayScaleFactor * value
    }

    property real scaleFactor: AppFramework.displayScaleFactor
    property int baseFontSize : app.info.propertyValue("baseFontSize", 15 * scaleFactor) + (isSmallScreen ? 0 : 3)
    property bool isSmallScreen: (width || height) < units(400)
    property color iconColor: "#4C4C4C"

    Page{
        anchors.fill: parent
        header: ToolBar{
            id:header
            width: parent.width
            height: 50 * scaleFactor
            Material.background: "#8f499c"
            Controls.HeaderBar{}
        }

        // sample starts here ------------------------------------------------------------------
        contentItem: Rectangle{
            anchors.top:header.bottom

            //setup Font Awesome fonts for use
            FontLoader {
                id: faBrands
                source: "assets/fa-brands-400.ttf" //"Brands" icon set
            }

            FontLoader {
                id: faSolid
                source: "assets/fa-solid-900.ttf" //"Solid" icon set
            }

            //layout beginning
            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter

                //row 1
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight:app. height/3 * scaleFactor
                    spacing: 40 *scaleFactor
                    anchors.horizontalCenter: parent.horizontalCenter

                    //Add a Font Awesome Github icon by creating a Text element
                    Text {
                        font.family: faBrands.name //from FontLoader id
                        text: "\uf092" //icon character code
                        font.pixelSize: 35 *scaleFactor //icon character size
                        color: "black" //icon character color
                    }

                }

                //row 2
                RowLayout {

                    Layout.preferredHeight:app. height/3 * scaleFactor
                    spacing: 15 * scaleFactor

                    //icon
                    Text {
                        id: homeIcon
                        font.family: faSolid.name
                        text: "\uf015"
                        font.pixelSize: 35 * scaleFactor
                        color: iconColor
                    }

                    //icon label
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: homeIcon.right
                        anchors.leftMargin: 8 *scaleFactor
                        text: qsTr("Home") //the 'qsTr()' function marks a string for localization translation
                        font.pixelSize: 15 * scaleFactor
                        color: iconColor
                    }

                }

                //row 3
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight:app. height/3 * scaleFactor
                    spacing: 10 *scaleFactor

                    //begin button
                    Button {
                        Layout.preferredWidth: 100 * scaleFactor
                        Layout.preferredHeight: 50 * scaleFactor
                        Layout.alignment: Qt.AlignHCenter

                        //icon
                        Text{
                            id: emailIcon
                            anchors.left: parent.left
                            anchors.leftMargin: 15 * scaleFactor
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: faSolid.name
                            text: "\uf0e0"
                            font.pixelSize: 20 *scaleFactor
                            color: "green"
                        }

                        //label
                        Text {
                            anchors.left: emailIcon.right
                            anchors.leftMargin: 13 * scaleFactor
                            anchors.verticalCenter: parent.verticalCenter
                            text:qsTr("Email")
                            font.pixelSize: 15 * scaleFactor
                            color:"#888"
                        }

                    }
                }
            }
        }
    }


    // sample ends here ------------------------------------------------------------------------
    Controls.DescriptionPage{
        id:descPage
        visible: false
    }
}

