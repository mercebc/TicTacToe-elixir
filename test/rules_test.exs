defmodule RulesTest do
  use ExUnit.Case
  doctest Rules

  test "gets the rows" do
    board = ["O","X","O","O","O","X","X","O","X"]
    assert Rules.rows(board) == [["O","X","O"],["O","O","X"],["X","O","X"]]
  end

  test "gets the columns" do
    rows = [["O","X","O"],["O","O","X"],["X","O","X"]]
    assert Rules.columns(rows) == [["O","O","X"],["X","O","O"],["O","X","X"]]
  end
end
