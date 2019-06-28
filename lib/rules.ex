defmodule Rules do
  alias Board

  def columns(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  def rows(board) do
    board
    |> Enum.chunk_every(Board.size(board))
  end

end
