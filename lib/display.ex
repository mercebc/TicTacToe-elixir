defmodule Display do
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


  def ask_for_position(mark) do 
    {position, _} = IO.gets("Please "<>mark<>", insert a position\n")
    |> Integer.parse
    (position - 1)
  end

  def position_numbers(board) do
    position = Enum.find_index(board, fn x -> x == "" end)
    List.replace_at(board, position, Integer.to_string(position + 1))
  end

end
