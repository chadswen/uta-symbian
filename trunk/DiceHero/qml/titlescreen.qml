import QtQuick 1.0
import Qt.labs.particles 1.0




Rectangle {

signal showScreen(string msg)

        id: screen

        width: 360; height: 640

        SystemPalette {
                id: activePalette
        }


        Item {
            id: titleBackground
            width: parent.width; height: parent.height
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            Rectangle {
                    anchors.fill: parent
                    color: "black"
            }
        }


        Rectangle {
            id: textHolder

            anchors {
                top: screen.top;
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            color: "black"
            width: 300
            height: 400
            border.color: "#336633"
            border.width: 4
            smooth: true
            radius: 50

            Image {
                id: titleText
                width: 289; height: 64
                anchors {
                    top: textHolder.top;
                    topMargin: 50
                    horizontalCenter: parent.horizontalCenter
                }
                source: "diceheroheader.png"
            }

            Text {
                id: versionNumber
                anchors {
                    top: titleText.bottom;
                    topMargin: 12
                    horizontalCenter: parent.horizontalCenter
                }
                font.bold: false
                smooth: true
                font.family: "Arial"
                font.pixelSize: 12
                color: "#FF9933"
                wrapMode: Text.WordWrap
                style: Text.Raised
                text: "V1.0"
            }

    Text {
        id: welcomeText
        width:280
        height: 60
        anchors {
            top: versionNumber.bottom;
            topMargin: 80
            horizontalCenter: parent.horizontalCenter
        }
        font.bold: false
        smooth: true
        font.family: "Helvetica [Cronyx]"
        font.pixelSize: 20
        color: "#AAAAAA"
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        style: Text.Raised
        text: "This is the dice bag of the 21st Century! All the common dice types are included - just pick your favorite, give them a shake, and watch them roll!"
    }
}

	ButtonInfo {
		id: infoButton
		anchors {
			bottom: screen.bottom;
			bottomMargin: 120
			horizontalCenter: screen.horizontalCenter
		}
		text: "?"
		onClicked: infoPopup.visible = true;
	}

        Button {
            id: selectGameButton
            anchors {
                bottom: screen.bottom;
                bottomMargin: 75
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "Game Modes"
            Particles {
                 id: particles            
                 width: 100; height: 100
                 anchors.bottom: parent.bottom
                 emissionRate: 0
                 lifeSpan: 700; lifeSpanDeviation: 600
                 angle: 0; angleDeviation: 360;
                 velocity: 100; velocityDeviation: 40
                 source: "logo_small.png"
           }
           onClicked: particles.burst(16, 0), timer.start();
        }

        Item {
            Timer {
                id: timer
                interval: 800; running: false; repeat: false;
                onTriggered: screen.showScreen("gameSelection.qml");
            }
        }
		
		Rectangle {
			id: infoPopup

			anchors {
				top: screen.top;
				topMargin: 50
				horizontalCenter: parent.horizontalCenter
			}
			color: "black"
			width: 300
			height: 400
			border.color: "#FF9100"
			border.width: 4
			smooth: true
			radius: 50
			visible: false

			Text {
					id: instructionsText
					width: 280
					height: 90
					anchors {
						top: parent.top;
						topMargin: 40
						horizontalCenter: parent.horizontalCenter
					}
					font.bold: false
					smooth: true
					font.family: "Helvetica [Cronyx]"
					font.pixelSize: 16
					color: "#AAAAAA"
					wrapMode: Text.Wrap
					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter
					style: Text.Raised
                                        text: "Instructions:\nFirst, choose your game mode. Some game modes will restrict the number and types of dice you can roll. The dice are identified by the number of sides (for instance, a d6 is a six-sided die). In Hero Mode, you can roll any type of die you want! At the die selection screen, just press the button corresponding to the type of die you want, and it will be added to the table. Hit the button multiple times for multiple dice! Hit the \"Roll Dice\" button to begin. Shake and tilt your phone and watch the dice roll - they will come to rest if you let them settle."
				}

			Text {
				id: creditsText
				width: 280
				height: 90
				anchors {
					top: instructionsText.bottom;
					topMargin: 40
					horizontalCenter: parent.horizontalCenter
				}
				font.bold: false
				smooth: true
				font.family: "Helvetica [Cronyx]"
				font.pixelSize: 16
				color: "#AAAAAA"
				wrapMode: Text.Wrap
				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter
				style: Text.Raised
				text: "The Dice Heroes:\nIvan Fan - Lead Systems Engineering Technician\nAaron Gann - Meritorious Game Mode Imperator\nDavid King - User Interface Specialist\nSkylar Seamans - Senior Commander of Artistic Design\nBrian Shef - Executive Producer of Productions\nChad Swenson - Chief Primary Architect"
			}
			
			Button {
				id: closeButton
				anchors {
					bottom: infoPopup.bottom;
					bottomMargin: 75
					horizontalCenter: infoPopup.horizontalCenter
				}
				text: "Close Info"

			   onClicked: infoPopup.visible = false;
			}
		}
}
