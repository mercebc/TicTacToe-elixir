defmodule HumanTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Human

  test "creates a human player" do
    assert Human.new("X") == %Player{mark: "X"}
  end

  test "can get a move" do
    player = %Player{mark: "X"}
    board = ["X","","","","X","","O","",""]
    capture_io([input: "3", capture_prompt: false], fn ->
      assert Human.get_move(player, board) == 2
    end)
  end

end

