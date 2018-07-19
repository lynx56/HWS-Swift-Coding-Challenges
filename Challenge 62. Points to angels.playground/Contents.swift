/*
 Challenge 62: Points to angles
 Difficulty: Tricky Write a function that accepts an array of CGPoint pairs, and returns an array of the angles
 between each point pair. Return the angles in degrees, where 0 or 360 is straight up.
 */

import Foundation
import UIKit

func convertPointsToAngels(_ points: [(first: CGPoint, second: CGPoint)])->[Int]{
    var result = [Int]()
    for point in points{
        let angle = atan2(point.first.y - point.second.y, point.first.x - point.second.x)
        let angleDegrees = Measurement<UnitAngle>(value: Double(angle), unit: UnitAngle.radians).converted(to: UnitAngle.degrees)
        result.append(Int(angleDegrees.value))
    }
    
    return result
}

var points = [(first: CGPoint, second: CGPoint)]()
points.append((first: CGPoint.zero, second: CGPoint(x: 0, y:
    -100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
    -100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
    0)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
    100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 0, y:
    100)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
    100)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
    0)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
    -100)))

print(convertPointsToAngels(points))

/*
 Sample input and output
 Here is some code you can test with:
 var points = [(first: CGPoint, second: CGPoint)]()
 points.append((first: CGPoint.zero, second: CGPoint(x: 0, y:
 -100)))
 points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
 -100)))
 points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
 0)))
 points.append((first: CGPoint.zero, second: CGPoint(x: 100, y:
 100)))
 points.append((first: CGPoint.zero, second: CGPoint(x: 0, y:
 100)))
 points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
 100)))
 points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
 0)))
 points.append((first: CGPoint.zero, second: CGPoint(x: -100, y:
 -100)))
 print(challenge62(points: points))
 If your code has worked correctly, that should print [0.0, 45.0, 90.0, 135.0, 180.0, 225.0, 270.0, 315.0]. Returning 360.0 for the first number is also acceptable.
 */

