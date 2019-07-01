defmodule HumanTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Human

  test "creates a human player" do
    assert Human.new("X") == %Human{mark: "X"}
  end

  test "can get a move" do
    player = %Human{mark: "X"}
    board = ["X","","","","X","","O","",""]
    capture_io([input: "3", capture_prompt: false], fn ->
      assert Player.get_move(player, board) == 2
    end)
  end

end

