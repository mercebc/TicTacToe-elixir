defmodule RandomComputerTest do
  use ExUnit.Case
  doctest RandomComputer

  test "creates a random computer player" do
    assert RandomComputer.new("X") == %RandomComputer{mark: "X"}
  end

  test "can get a move" do
    players = [%RandomComputer{mark: "X"}, %Human{mark: "O"}]
    board = ["X","","","","X","","O","",""]
    assert Player.get_move(List.first(players), board, players) in Board.available_positions(board)
  end

end

