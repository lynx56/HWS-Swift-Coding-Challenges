/*
 Challenge 63: Flood fill
 Difficulty: Taxing
 Write a function that accepts a two-dimensional array of integers that are 0 or 1, a new number to place, and a position to start. You should read the existing number at the start position, change it to the new number, then change any surrounding numbers that matched the start number, then change any surrounding those, and so on - like a flood fill algorithm in Photoshop.
 */

import Foundation
import GameplayKit

func floodFill(_ number: Int, in grid: inout [[Int]], at position: (x: Int, y: Int), replacing: Int? = 0){
    guard position.x >= 0, position.x < grid.count, position.y >= 0, position.y < grid.count
        else { return }
    let startNumber = replacing ?? grid[position.y][position.x]
    
    if grid[position.x][position.y] == startNumber{
        grid[position.x][position.y] = number
        
        floodFill(number, in: &grid, at: (x: position.x, y: position.y - 1), replacing: startNumber)
        floodFill(number, in: &grid, at: (x: position.x, y: position.y + 1), replacing: startNumber)
        floodFill(number, in: &grid, at: (x: position.x - 1, y: position.y), replacing: startNumber)
        floodFill(number, in: &grid, at: (x: position.x + 1, y: position.y), replacing: startNumber)
    }
}

let random = GKMersenneTwisterRandomSource(seed: 1)
var grid: [[Int]] = (1...10).map { _ in (1...10).map { _ in Int(random.nextInt(upperBound: 2)) } }

floodFill(5, in: &grid, at: (x: 2, y: 0))

var check = [[0, 0, 0, 0, 0, 1, 0, 0, 1, 1],
    [0, 1, 1, 0, 0, 0, 0, 1, 0, 0],
    [0, 1, 0, 0, 0, 0, 0, 0, 1, 1],
    [1, 0, 1, 0, 0, 1, 1, 0, 0, 0],
    [1, 0, 1, 0, 1, 1, 1, 1, 1, 0],
    [1, 0, 1, 1, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 1, 1, 0, 1, 1],
    [1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
    [1, 1, 0, 1, 1, 1, 1, 0, 0, 0],
    [0, 1, 1, 0, 0, 1, 0, 1, 1, 1]]

floodFill(5, in: &check, at: (x: 0, y: 2))

check ==  [[5, 5, 5, 5, 5, 1, 5, 5, 1, 1],
[5, 1, 1, 5, 5, 5, 5, 1, 0, 0],
[5, 1, 5, 5, 5, 5, 5, 5, 1, 1],
[1, 0, 1, 5, 5, 1, 1, 5, 5, 5],
[1, 0, 1, 5, 1, 1, 1, 1, 1, 5],
[1, 0, 1, 1, 5, 5, 5, 5, 5, 5],
[0, 0, 0, 0, 1, 1, 1, 5, 1, 1],
[1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
[1, 1, 0, 1, 1, 1, 1, 0, 0, 0],
[0, 1, 1, 0, 0, 1, 0, 1, 1, 1]]

/*
 You will have the following grid:
 [0, 0, 0, 0, 0, 1, 0, 0, 1, 1]
 [0, 1, 1, 0, 0, 0, 0, 1, 0, 0]
 [0, 1, 0, 0, 0, 0, 0, 0, 1, 1]
 [1, 0, 1, 0, 0, 1, 1, 0, 0, 0]
 [1, 0, 1, 0, 1, 1, 1, 1, 1, 0]
 [1, 0, 1, 1, 0, 0, 0, 0, 0, 0]
 [0, 0, 0, 0, 1, 1, 1, 0, 1, 1]
 [1, 1, 1, 0, 0, 1, 1, 1, 1, 1]
 [1, 1, 0, 1, 1, 1, 1, 0, 0, 0]
 [0, 1, 1, 0, 0, 1, 0, 1, 1, 1]
 After running this code:
 challenge63(fill: 5, in: grid, at: (x: 2, y: 0)) You will have the following grid:
 [5, 5, X, 5, 5, 1, 5, 5, 1, 1]
 [5, 1, 1, 5, 5, 5, 5, 1, 0, 0]
 [5, 1, 5, 5, 5, 5, 5, 5, 1, 1]
 [1, 0, 1, 5, 5, 1, 1, 5, 5, 5]
 [1, 0, 1, 5, 1, 1, 1, 1, 1, 5]
 [1, 0, 1, 1, 5, 5, 5, 5, 5, 5]
 [0, 0, 0, 0, 1, 1, 1, 5, 1, 1]
 [1, 1, 1, 0, 0, 1, 1, 1, 1, 1]
 [1, 1, 0, 1, 1, 1, 1, 0, 0, 0]
 [0, 1, 1, 0, 0, 1, 0, 1, 1, 1]
 */

