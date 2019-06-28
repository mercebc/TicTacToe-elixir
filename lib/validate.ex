defmodule Validate do
  def is_position_available(board, position) do
    case Enum.member?(Board.available_positions(board), position) do
      true -> {:valid, :positionAvailable}
      false -> {:error, :positionTaken}
    end
  end

end
