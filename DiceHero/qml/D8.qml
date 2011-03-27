import QtQuick 1.0
import Box2D 1.0

Die {
    id: d8
    currentSource: "d6.png"
    sides: 8

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(0, 0),
            Qt.point(0, 70),
            Qt.point(70, 70),
            Qt.point(70, 0)
        ]
    }
}