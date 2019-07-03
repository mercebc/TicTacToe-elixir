defmodule GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Game

  test "selects a mode game" do
    assert capture_io([input: "1\n1\n2\n3\n4\n5\n6\n7\n", capture_prompt: false], fn ->
      Game.new()
    end) =~ "You have selected human_vs_human\n"
  end
end
