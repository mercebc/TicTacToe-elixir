defmodule HumanTest do
  use ExUnit.Case
  doctest Human

  test "creates a human player" do
    assert Human.new("X") == %Player{mark: "X"}
  end

end

