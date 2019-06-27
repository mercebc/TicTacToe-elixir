defmodule Board do
  alias Validate

  def new(size), do: List.duplicate("", size*size)

  defp mark(board, player, position), do: List.replace_at(board, position, player.mark)

  def register(board, player, position) do
    case Validate.is_position_available(board, position) do
      {:valid, _} -> mark(board, player, position)
      {:error, :reason} -> Display.message(:reason)
    end
  end

end
