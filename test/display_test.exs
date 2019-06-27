defmodule DisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Display

  test "can display a formatted board" do
    board = ["","X","","O","","","X","",""]
    assert capture_io(fn ->
      Display.board(board)
    end) == "1 | X | 3\nO | 5 | 6\nX | 8 | 9\n"
  end
end
