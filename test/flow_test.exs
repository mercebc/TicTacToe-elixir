defmodule FlowTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Flow

  test "X wins" do
    players = [%Player{mark: "X"}, %Player{mark: "O"}]
    assert capture_io([input: "1\n2\n3\n4\n5\n6\n7\n", capture_prompt: false], fn ->
      Flow.start(players,3)
    end) =~ "Yayyy! X is the winner!!!"
  end

  test "O wins" do
    players = [%Player{mark: "X"}, %Player{mark: "O"}]
    assert capture_io([input: "2\n3\n4\n5\n6\n7\n8\n9\n1\n", capture_prompt: false], fn ->
      Flow.start(players,3)
    end) =~ "Yayyy! O is the winner!!!"
  end

  test "its a draw" do
    players = [%Player{mark: "X"}, %Player{mark: "O"}]
    assert capture_io([input: "1\n2\n3\n4\n6\n5\n7\n9\n8\n", capture_prompt: false], fn ->
      Flow.start(players,3)
    end) =~ "It's a draw"
  end

  test "play" do
    players = [%Player{mark: "X"}, %Player{mark: "O"}]
    Flow.start(players,3)
  end
end
