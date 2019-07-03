defmodule SuperComputerTest do
  use ExUnit.Case
  doctest SuperComputer

  test "chooses position to win" do
    players = [%SuperComputer{mark: "O"}, %Human{mark: "X"}]
    board = ["X","O","X","O","","X","X","","O"]
    assert Player.get_position(List.first(players), board, players) == 4
  end

  test "chooses position to win over avoiding human player to win" do
    players = [%SuperComputer{mark: "O"}, %Human{mark: "X"}]
    board = ["X","","O","X","","O","","",""]
    assert Player.get_position(List.first(players), board, players) == 8
  end

  test "doesnt allow opponent to win" do
    players = [%SuperComputer{mark: "X"}, %Human{mark: "O"}]
    board = ["X","O","X","O","","X","X","","O"]
    assert Player.get_position(List.first(players), board, players) == 4
  end
end
