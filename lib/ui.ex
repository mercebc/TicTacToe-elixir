defmodule UI do
  defp display(message), do: IO.puts(message)
  defp get_from_user(message), do: IO.gets(message)

  def display_message(label) do
    label
    |> Dialog.message
    |> display
  end
  def display_message(label, mark) do
    label
    |> Dialog.message(mark)
    |> display
  end

  def display_board(board) do
    board
    |> format_board
    |> display
  end

  def ask_mode() do
    Dialog.message(:ask_mode_game)
    |> get_from_user
    |> Validate.game_mode
    |> handle_validation_mode(&ask_mode/0)
  end

  def ask_position(mark, board) do
    Dialog.message(:ask_position, mark)
    |> get_from_user
    |> Validate.position(board)
    |> handle_validation_position(mark, board, &ask_position/2)
  end

  defp handle_validation_mode({:ok, mode}, _), do: mode
  defp handle_validation_mode({:error, _} = error, ask_mode_again) do
    handle_error(error)
    ask_mode_again.()
  end

  defp handle_validation_position({:ok, position}, _, _, _), do: position
  defp handle_validation_position({:error, _} = error, mark, board, ask_position_again) do
    handle_error(error)
    ask_position_again.(mark, board)
  end

  defp handle_error({_, reason}) do
    Error.message(reason)
    |> display
  end

  defp format_board(board) do
    board
    |> add_numbers
    |> Enum.chunk_every(Board.size(board))
    |> Enum.map(fn x -> Enum.intersperse(x," | ") end)
    |> Enum.intersperse("\n")
  end

  defp add_numbers(board) do
    board
    |> Enum.with_index
    |> Enum.map(fn position -> format_position(position) end)
  end

  defp format_position({"", position}), do: Integer.to_string(position + 1)
  defp format_position({mark, _position}), do: mark
end
