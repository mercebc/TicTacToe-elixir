defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "creates a board" do
    assert Board.new(3) == ["","","","","","","","",""]
  end

  test "gets the size of a board" do
    board = ["X","O","O","X","X","O","O","X","O"]
    assert Board.size(board) == 3
  end

  test "register a mark in a position" do
    board = ["","","","","","","","",""]
    player = %Human{mark: "X"}
    assert Board.register(board, player, 1) == ["","X","","","","","","",""]
  end

  test "the board is full" do
    board = ["X","O","O","X","X","O","O","X","O"]
    assert Board.is_full(board) == true
  end

  test "the board is not full" do
    board = ["X","","O","X","X","O","O","X","O"]
    assert Board.is_full(board) == false
  end

  test "available positions of a board" do
    board = ["X","","O","X","","O","","X","O"]
    assert Board.available_positions(board) == [1, 4, 6]
  end
end
