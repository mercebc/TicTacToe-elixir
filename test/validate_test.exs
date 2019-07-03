defmodule ValidateTest do
  use ExUnit.Case
  doctest Validate

  test "Position is valid" do
    board = ["","","","O","","","X","",""]
    position = "2"
    assert Validate.position(position, board) == {:ok, 1}
  end

  test "raise error if a position isn't available" do
    board = [1,"X",3,"O",5,6,7,"X",9]
    position = "2"
    assert Validate.position(position, board) == {:error, :position_taken}
  end

  test "raise error if a position is not in range" do
    board = [1,"X",3,"O",5,6,7,"X",9]
    position = "12"
    assert Validate.position(position, board) == {:error, :number_not_in_range}
  end

  test "raise error if a position is not a number" do
    board = [1,"X",3,"O",5,6,7,"X",9]
    position = "2d"
    assert Validate.position(position, board) == {:error, :invalid_number}
  end

  test "Game mode introduced is valid" do
    mode = "1"
    assert Validate.game_mode(mode) == {:ok, :human_vs_human}
  end

  test "raise error if mode is not in range" do
    mode = "5"
    assert Validate.game_mode(mode) == {:error, :number_not_in_range}
  end

  test "raise error if mode is not a number" do
    mode = "2d"
    assert Validate.game_mode(mode) == {:error, :invalid_number}
  end
end

