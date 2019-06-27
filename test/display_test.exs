defmodule DisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Display

  test "can display a message" do
    assert capture_io(fn ->
      Display.message("Please try again")
    end) == "Please try again"
  end
end
