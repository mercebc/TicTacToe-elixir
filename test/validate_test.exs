defmodule ValidateTest do
  use ExUnit.Case
  doctest Validate

  test "valid if a position is available" do
    board = [1,2,3,4,5,6,7,8,9]
    position = 2
    assert Validate.is_position_available(board, position) == {:valid, :positionAvailable}
  end

  test "raise error if a position isn't available" do
    board = [1,"X",3,4,5,"O",7,8,9]
    position = 2
    assert Validate.is_position_available(board, position) == {:error, :positionTaken}
  end
end

