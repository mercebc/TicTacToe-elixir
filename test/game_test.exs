defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Game

  test "I can create a game" do
    assert Game.new == ""
  end

end
