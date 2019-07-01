defmodule RulesTest do
  use ExUnit.Case
  doctest Rules

  test "gets the winning lines" do
    board = [1,2,3,4,5,6,7,8,9]
    assert Rules.winning_lines(board) == [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [7, 5, 3]
    ]
  end

  test "current player is winner" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    board = ["O","X","X","O","O","X","X","O","O"]
    assert Rules.has_winner(board, players) == %Human{mark: "O"}
  end

  test "opponent player is winner" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    board = ["X","O","O","X","X","O","","X","X"]
    assert Rules.has_winner(board, players) == %Human{mark: "X"}
  end

  test "there isnt a winner" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    board = ["","O","O","X","X","O","O","X","X"]
    assert Rules.has_winner(board, players) == :no_winner
  end

  

end
