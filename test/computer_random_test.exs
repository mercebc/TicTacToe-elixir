defmodule RandomComputerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest RandomComputer

  test "creates a random computer player" do
    assert RandomComputer.new("X") == %RandomComputer{mark: "X"}
  end

  test "can get a position" do
    players = [%RandomComputer{mark: "X"}, %Human{mark: "O"}]
    board = ["X","","","","X","","O","",""]
    capture_io([capture_prompt: false], fn ->
      assert Player.get_position(List.first(players), board, players) in Board.available_positions(board)
    end)
  end
end

