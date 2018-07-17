/*
 Challenge 60: Tic-Tac-Toe winner
 Difficulty: Tricky Create a function that detects whether either player has won in a game of Tic-Tac-Toe.
 */

import Foundation

class TicTacToe{
  
    func isWin(_ one: String, _ second: String, _ third: String)->Bool{
        return one.isEmpty == false && one == second && one == third
    }
    
    func check(board: [[String]])->String?{
        for i in 0..<3{
            if isWin(board[i][0], board[i][1] , board[i][2]){
                return board[i][0]
            }
            if isWin(board[0][i], board[1][i] , board[2][i]){
                return board[0][i]
            }
        }
        
        if isWin(board[0][0], board[1][1], board[2][2]){
            return board[0][0]
        }
        if isWin(board[0][2], board[1][1], board[2][0]){
            return board[0][2]
        }
        
        return nil
    }
}

let game = TicTacToe()

game.check(board: [["X", "", "O"], ["", "X", "O"], ["", "", "X"]])
game.check(board: [["X", "", "O"], ["X", "", "O"], ["X", "", ""]])
game.check(board: [["", "X", ""], ["O", "X", ""], ["O", "X", ""]])
game.check(board: [["", "X", ""], ["O", "X", ""], ["O", "", "X"]])
game.check(board: [["", "", ""], ["", "", ""], ["", "", ""]])

/*
 Sample input and output
 •    The array [["X", "", "O"], ["", "X", "O"], ["", "", "X"]] should return true.  
 •    The array [["X", "", "O"], ["X", "", "O"], ["X", "", ""]] should return true.  
 •    The array [["", "X", ""], ["O", "X", ""], ["O", "X", ""]] should return true.  
 •    The array [["", "X", ""], ["O", "X", ""], ["O", "", "X"]] should return false.  
 •    The array [["", "", ""], ["", "", ""], ["", "", ""]] should return false.
 */

