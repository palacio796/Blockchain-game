// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnhancedTicTacToe {
    // Define the players and current player
    address public player1;
    address public player2;
    address public player3;
    address public currentPlayer;
    address public winner;
    bool public gameFinished;

    // Define the game board as a 4x4 grid
    uint8[4][4] public board;

    constructor() {
        // Initialize player 1 and set them as the current player
        player1 = msg.sender;
        currentPlayer = player1;
    }

    function makeMove(uint8 row, uint8 col) public {
        // Ensure the game is not finished
        require(!gameFinished, "The game has finished.");
        // Ensure it's the player's turn
        require(msg.sender == currentPlayer, "It's not your turn.");
        // Ensure the selected cell is empty
        require(board[row][col] == 0, "Invalid move.");

        // Assign the player's token (1 for X, 2 for O, 3 for Triangle)
        uint8 playerToken = 1; // or 2 or 3, depending on the player's symbol
        board[row][col] = playerToken;

        // Check for a win
        if (checkWin(row, col, playerToken)) {
            winner = currentPlayer;
            gameFinished = true;
        }
        // Check for a draw (if the entire board is filled)
        else if (checkDraw()) {
            gameFinished = true;
        }
        // Switch to the next player's turn
        else {
            currentPlayer = getNextPlayer(currentPlayer);
        }
    }

    function getNextPlayer(address current) internal view returns (address) {
        // Determine the next player in a cyclical fashion
        if (current == player1) {
            return player2;
        } else if (current == player2) {
            return player3;
        } else {
            return player1;
        }
    }

    function checkWin(uint8 row, uint8 col, uint8 playerToken) internal view returns (bool) {
        // Check for win conditions
        // Implement your win condition logic here

        // Example: Check horizontal and vertical for three in a row
        bool rowWin = true;
        bool colWin = true;

        for (uint8 i = 0; i < 4; i++) {
            if (board[i][col] != playerToken) {
                colWin = false;
            }
            if (board[row][i] != playerToken) {
                rowWin = false;
            }
        }

        // You can implement diagonal checks and other win conditions here

        return rowWin || colWin;
    }

    function checkDraw() internal view returns (bool) {
        // Check for a draw (if the entire board is filled)
        for (uint8 i = 0; i < 4; i++) {
            for (uint8 j = 0; j < 4; j++) {
                if (board[i][j] == 0) {
                    return false;
                }
            }
        }
        return true;
    }
}