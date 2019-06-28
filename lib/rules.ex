defmodule Rules do
  alias Board

  def has_winner(board, [first, second] = players) do
    players
    |> Enum.map(fn(player) -> is_winner(player, board) end)
    |> case do
      [true, _] -> first
      [_, true] -> second
      _ -> :no_winner
    end
  end

  defp is_winner(player, board) do
    winning_lines(board)
    |> Enum.map(fn(line) -> same_mark(line, player) end)
    |> Enum.any?(fn x -> x == true end)
  end

  defp same_mark(line, player), do: Enum.all?(line, fn(mark) -> mark == player.mark end)

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
