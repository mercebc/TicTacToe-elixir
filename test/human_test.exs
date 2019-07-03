defmodule HumanTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Human

  test "creates a human player" do
    assert Human.new("X") == %Human{mark: "X"}
  end

  test "can get a move" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    board = ["X","","","","X","","O","",""]
    capture_io([input: "3", capture_prompt: false], fn ->
      assert Player.get_position(List.first(players), board, players) == 2
    end)
  end

end

