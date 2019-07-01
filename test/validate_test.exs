defmodule ValidateTest do
  use ExUnit.Case
  doctest Validate

  test "validate if a position is valid" do
    board = ["","","","O","","","X","",""]
    position = "2"
    assert Validate.position(position, board) == {:valid, 1}
  end

  test "raise error if a position isn't available" do
    board = [1,"X",3,"O",5,6,7,"X",9]
    position = "2"
    assert Validate.position(position, board) == {:error, :positionTaken}
  end

  test "raise error if a position is not in range" do
    board = [1,"X",3,"O",5,6,7,"X",9]
    position = "12"
    assert Validate.position(position, board) == {:error, :numberNotInRange}
  end

  test "raise error if a position is not a number" do
    board = [1,"X",3,"O",5,6,7,"X",9]
    position = "2d"
    assert Validate.position(position, board) == {:error, :invalidNumber}
  end
end

