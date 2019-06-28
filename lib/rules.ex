defmodule Rules do
  alias Board

  def winning_lines(board) do
    rows = rows(board)
    rows ++ columns(rows) ++ [left_diagonal(rows)] ++ [right_diagonal(rows)]
  end

  defp columns(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  defp rows(board) do
    board
    |> Enum.chunk_every(Board.size(board))
  end

  defp left_diagonal(rows) do
    rows
    |> Enum.with_index
    |> Enum.map(fn({row, index}) -> Enum.at(row, index) end)
  end

  defp right_diagonal(rows) do
    rows
    |> Enum.reverse
    |> left_diagonal
  end

end
