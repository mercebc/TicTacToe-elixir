# Tic Tac Toe :joystick:
Tic tac toe is a console game for two players who take turns marking the positions in a 3×3 board.

## Objectives :1st_place_medal:
The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row wins the game.

## Options :computer: :woman_technologist:
The game allows the player to choose a mode to play:
* human player vs. human player
* human player vs. random computer
* human player vs. super computer (unbeatable)

## Improvements :crystal_ball:
Adding the option to play in a 4x4 board when playing against a super computer made a game very slow and not a good user experience, so it has not been implemented for the following reason:

Currently minimax (the algorithm used in the super computer player to get the best position) has to evaluate ALL the possible moves to retrieve the best one, and in a 4x4 board there are lots of possible moves at the beginning of the game.
In order to accelerate that process, a good solution could be to implement alpha beta pruning, where it is not necessary to evaluate all the possible moves, when the algorithm finds a good move, it doesn't continue evaluating all the board.

## Tech requirements to play :wrench:
Having (elixir)[https://elixir-lang.org/install.html] installed


## Run me :runner:
In order to Run the game you need to clone the this github directory to your laptop.

`git clone git@github.com:mercebc/TicTacToe-elixir.git`

Open the directory

`cd TicTacToe-elixir`

Run the game

`mix start`

### And have fun playing!

## Run the tests :cop:

Open the directory

`cd TicTacToe-elixir`

Run the tests

`mix test`

