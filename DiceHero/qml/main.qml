import Qt 4.7

Image {
    id: board

    property real accX
    property real accY
    property real accZ
    property bool currentlyRolling: false

    // signaled just as the player initiates movement input (start rolling)
    signal calibrate()

    // functions are used as Qt slots when acceleromter changes
    function updateX(outVX) {
        board.accX = outVX
    }
    function updateY(outVY) {
        board.accY = outVY
    }
    function updateZ(outVZ) {
        board.accZ = outVZ
    }
    SystemPalette {
        id: activePalette
    }
    anchors.fill: parent
    source: "board.png"
    smooth: true

    Image {
        id: d6
        x: 60
        y: 60
        width: 75
        height: 75
        smooth: true
        source: "d6.png"

        Text {
            id: d6Num
            x: 20
            y: 27
            color: "#45c3c3"
            text: "6" //to be a random, generated by movement
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            styleColor: "#000000"
            style: Text.Sunken
            font.bold: true
            font.pixelSize: 18
        }
        MouseArea {
            anchors.fill: parent
            drag.target: d6
            drag.axis: Drag.XandYAxis
            drag.minimumX: 0
            drag.maximumX: board.width - d6.width
            drag.minimumY: 0
            drag.maximumY: board.height - d6.height
            drag.filterChildren: true
        }
    }

    Text {
        id:xLabel
        x: 395
        y: 137
        color: "#45c3c3"
        text: "X Acceleration: " + board.accX
        anchors.verticalCenterOffset: -92
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }


    Text {
        id:yLabel
        x: 395
        y: 212
        color: "#45c3c3"
        text: "Y Acceleration: " + board.accY
        anchors.verticalCenterOffset: -17
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id:zLabel
        x: 395
        y: 282
        color: "#45c3c3"
        text: "Z Acceleration: " + board.accZ
        anchors.verticalCenterOffset: 53
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    Button {
                id: calibrateBtn
                anchors {
                    bottom: board.bottom
                    bottomMargin: 75
                    horizontalCenter: board.horizontalCenter
                }
                text: "Calibrate"
                onClicked: {
                    calibrate();
                    currentlyRolling: true
                }

    }
}