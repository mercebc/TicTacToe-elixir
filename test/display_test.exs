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

  test "position numbers" do
    board = ["","X","","O"]
    assert(Display.position_numbers(board) == ["1","X","3","O"])
   end

  test "cant register mark in a position already taken" do
    board = ["","X","","O","","","X","",""]
    player = %Player{mark: "O"}
    capture_io([input: "2\n5\n", capture_prompt: false], fn ->
      assert Display.ask_for_position(player.mark, board) == 4
    end)
  end

end
