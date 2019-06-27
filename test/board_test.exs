defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "creates a board" do
    assert Board.new(3) == ["","","","","","","","",""]
  end

  test "register a mark in a position" do
    board = ["","","","","","","","",""]
    player = %Player{mark: "X"}
    assert Board.register(board,player, 1) == ["","X","","","","","","",""]

  end

end
