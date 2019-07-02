defmodule Board do
  alias Validate

  def new(size), do: List.duplicate("", size*size)

  def size(board) do
    board
    |> length
    |> :math.sqrt
    |> trunc
  end

  def register(board, player, position), do: List.replace_at(board, position, player.mark)

  def is_full(board), do: !Enum.any?(board, fn x -> x == "" end)

  def available_positions(board) do
    board
    |> Enum.with_index
    |> Enum.reject(fn ({value, _}) -> value != "" end)
    |> Enum.map(fn ({_, position}) -> position end)
  end

end
