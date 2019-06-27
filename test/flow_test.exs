defmodule FlowTest do
  use ExUnit.Case
  doctest Flow

  test "swap players" do
    players = [%Player{mark: "X"}, %Player{mark: "O"}]
    assert Flow.swap_players(players) == [%Player{mark: "O"}, %Player{mark: "X"}]
  end
end
