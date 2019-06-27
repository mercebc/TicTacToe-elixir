defmodule HumanTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Human

  test "creates a human player" do
    assert Human.new("X") == %Player{mark: "X"}
  end

  test "can get a move" do
    player = %Player{mark: "X"}
    assert capture_io("3", fn ->
      IO.write Human.get_move(player)
    end) == "Please X, insert a position\n3"
  end

end

