defmodule RandomComputerTest do
  use ExUnit.Case
  doctest RandomComputer

  test "creates a random computer player" do
    assert RandomComputer.new("X") == %RandomComputer{mark: "X"}
  end

  test "can get a move" do
    player = %RandomComputer{mark: "X"}
    board = ["X","","","","X","","O","",""]
    assert Player.get_move(player, board) in Board.available_positions(board)
  end

end

