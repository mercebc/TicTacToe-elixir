defmodule UI do
  def display(message), do: IO.puts(message)
  def get_from_user(message), do: IO.gets(message)

  def display_board(board) do
    board
    |> format
    |> display
  end

  def ask_position(mark, board) do
    Dialog.message(:askPosition, mark)
    |> get_from_user
    |> Validate.position(board)
    |> handle_validation_results(mark, board, &ask_position/2)
  end

  defp handle_validation_results({:valid, position}, _, _, _), do: position
  defp handle_validation_results({:error, _} = error, mark, board, callback) do
    handle_error(error)
    callback.(mark, board)
  end

  defp handle_error({_, reason}) do
    Error.message(reason)
    |> display
  end

  defp format(board) do
    board
    |> Enum.chunk_every(Board.size(board))
    |> Enum.map(fn x -> Enum.intersperse(x," | ") end)
    |> Enum.intersperse("\n")
  end

  defp position_numbers(board) do
    board
    |> Enum.with_index
    |> Enum.reject(fn ({value, _}) -> value != "" end)
    |> Enum.map(fn ({_, position}) -> position + 1 end)
  end

end
