defmodule SuperComputerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest SuperComputer

  test "creates a super computer player" do
    assert SuperComputer.new("X") == %SuperComputer{mark: "X"}
  end

  test "chooses position to win" do
    players = [%SuperComputer{mark: "O"}, %Human{mark: "X"}]
    board = ["X","O","X","O","","X","X","","O"]
    capture_io([capture_prompt: false], fn ->
      assert Player.get_position(List.first(players), board, players) == 4
    end)
  end

  test "chooses position to win over avoiding human player to win" do
    players = [%SuperComputer{mark: "O"}, %Human{mark: "X"}]
    board = ["X","","O","X","","O","","",""]
    capture_io([capture_prompt: false], fn ->
      assert Player.get_position(List.first(players), board, players) == 8
    end)
  end

  test "doesnt allow opponent to win" do
    players = [%SuperComputer{mark: "X"}, %Human{mark: "O"}]
    board = ["X","O","X","O","","X","X","","O"]
    capture_io([capture_prompt: false], fn ->
      assert Player.get_position(List.first(players), board, players) == 4
    end)
  end
end
