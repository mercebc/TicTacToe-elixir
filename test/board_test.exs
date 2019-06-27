defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "creates a board" do
    assert Board.new(3) == [1,2,3,4,5,6,7,8,9]
  end

  test "register a mark in a position" do
    board = [1,2,3,4,5,6,7,8,9]
    player = %Player{mark: "X"}
    assert Board.register(board,player, 1) == [1,"X",3,4,5,6,7,8,9]
  end

end
