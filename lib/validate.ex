defmodule Validate do
  def is_position_available(board, position) do
    case position_in_board(board, position) do
      x when is_integer(x) -> {:valid, :positionAvailable}
      _ -> {:error, :positionTaken}
    end
  end

  def position_in_board(board, position), do: Enum.at(board, position)
end
