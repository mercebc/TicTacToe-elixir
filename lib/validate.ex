defmodule Validate do
  def is_position_available(position, board) do
    case Enum.member?(Board.available_positions(board), position) do
      true -> {:valid, position}
      false -> {:error, :positionTaken}
    end
  end

end
