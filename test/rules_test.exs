defmodule RulesTest do
  use ExUnit.Case
  doctest Rules

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
