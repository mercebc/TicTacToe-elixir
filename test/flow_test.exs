defmodule FlowTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Flow

  test "swap players" do
    players = [%Player{mark: "X"}, %Player{mark: "O"}]
    assert Flow.swap_players(players) == [%Player{mark: "O"}, %Player{mark: "X"}]
  end

  test "plays until full board" do
    players = [%Player{mark: "X"}, %Player{mark: "O"}]
    assert capture_io([input: "1\n2\n3\n4\n5\n6\n7\n8\n9\n", capture_prompt: false], fn ->
      Flow.start(players,3)
    end) =~ "End game"
  end
end
