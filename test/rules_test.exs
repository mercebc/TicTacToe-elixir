defmodule RulesTest do
  use ExUnit.Case
  doctest Rules

  test "gets the winning lines" do
    board = [1,2,3,4,5,6,7,8,9]
    assert Rules.winning_lines(board) == [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [7, 5, 3]
    ]
  end
end
