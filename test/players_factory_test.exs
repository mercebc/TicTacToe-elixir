defmodule PLayersFactoryTest do
  use ExUnit.Case
  doctest PlayersFactory

  test "creates two human players" do
    assert PlayersFactory.create(:human_vs_human) == [%Human{mark: "X"}, %Human{mark: "O"}]
  end

  test "creates a human player and a random computer player" do
    assert PlayersFactory.create(:human_vs_random) == [%Human{mark: "X"}, %RandomComputer{mark: "O"}]
  end

  test "creates a human player and a supercomputer player" do
    assert PlayersFactory.create(:human_vs_super) == [%Human{mark: "X"}, %SuperComputer{mark: "O"}]
  end
end
