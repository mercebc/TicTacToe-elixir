defmodule UI do
  def display(message), do: IO.puts(message)
  def get_from_user(message), do: IO.gets(message)

  def display_board(board) do
    board
    |> format
    |> display
  end

  def ask_mode() do
    Dialog.message(:ask_mode_game)
    |> get_from_user
    |> Validate.game_mode
    |> handle_validation_results(&ask_mode/0)
  end

  def ask_size() do
    Dialog.message(:ask_size_board)
    |> get_from_user
    |> Validate.size_board
    |> handle_validation_results(&ask_size/0)
  end

  def ask_position(mark, board) do
    Dialog.message(:ask_position, mark)
    |> get_from_user
    |> Validate.position(board)
    |> handle_validation_results(mark, board, &ask_position/2)
  end

  defp handle_validation_results({:valid, number}, _), do: number
  defp handle_validation_results({:valid, position}, _, _, _), do: position
  defp handle_validation_results({:error, _} = error, ask_again) do
    handle_error(error)
    ask_again.()
  end
  defp handle_validation_results({:error, _} = error, mark, board, ask_again) do
    handle_error(error)
    ask_again.(mark, board)
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
