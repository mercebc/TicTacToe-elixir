defmodule Rules do
  def has_winner(board, players) do
    players
    |> Enum.map(fn(player) -> is_winner(player, board) end)
    |> who_is_winner(players)
  end

  defp who_is_winner([true, _], [first, _]), do: first
  defp who_is_winner([_, true], [_, second]), do: second
  defp who_is_winner(_, _players), do: :no_winner

  defp is_winner(player, board) do
    winning_lines(board)
    |> Enum.map(fn(line) -> same_mark(line, player) end)
    |> Enum.any?(fn winning_line -> winning_line == true end)
  end

  defp same_mark(line, player), do: Enum.all?(line, fn(mark) -> mark == player.mark end)

  defp winning_lines(board) do
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
