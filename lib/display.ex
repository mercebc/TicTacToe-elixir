defmodule Display do
  alias Validate

  def announcement(message), do: IO.puts(message)

  def board(board) do
    board
    |> format
    |> IO.puts
  end

  defp format(board) do
    board
    |> Enum.chunk_every(3)
    |> Enum.map(fn x -> Enum.intersperse(x," | ") end)
    |> Enum.intersperse("\n")
  end

  def ask_for_position(mark, board) do
    mark
    |> position_given
    |> Validate.is_position_available(board)
    |> case do
      {:valid, position} -> position
      {:error, reason} -> ask_for_position(mark, board)
    end
  end

  defp position_given(mark) do
    {position, _} = IO.gets("Please "<>mark<>", insert a position\n")
    |> Integer.parse
    (position - 1)
  end

  def position_numbers(board) do
    board
    |> Enum.with_index
    |> Enum.reject(fn ({value, _}) -> value != "" end)
    |> Enum.map(fn ({_, position}) -> position + 1 end)
  end




end
