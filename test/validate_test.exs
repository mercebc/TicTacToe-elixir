defmodule ValidateTest do
  use ExUnit.Case
  doctest Validate

  test "valid if a position is available" do
    board = ["","","","O","","","X","",""]
    position = 2
    assert Validate.is_position_available(position, board) == {:valid, 2}
  end

  test "raise error if a position isn't available" do
    board = [1,"X",3,"O",5,6,7,"X",9]
    position = 2
    assert Validate.is_position_available(position, board) == {:error, :positionTaken}
  end
end

