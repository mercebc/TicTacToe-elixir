defmodule SuperComputerTest do
  use ExUnit.Case
  doctest SuperComputer

  test "chooses position to win" do
    players = [%SuperComputer{mark: "O"}, %Human{mark: "X"}]
    board = ["X","O","X","O","","X","X","","O"]
    assert Player.get_move(List.first(players), board, players) == 4
    assert Game.new() == ""
  end

  test "doesnt allow opponent to win" do
    players = [%SuperComputer{mark: "X"}, %Human{mark: "O"}]
    board = ["X","O","X","O","","X","X","","O"]
    assert Player.get_move(List.first(players), board, players) == 4
  end
end
