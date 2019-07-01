defmodule Validate do

  def position(position, board) do
    case is_number_in_range(position, 1, length(board)) do
      {:valid, position} -> is_position_available(position-1, board)
      error -> error
    end
  end

  defp is_position_available(position, board) do
    case Enum.member?(Board.available_positions(board), position) do
      true -> {:valid, position}
      false -> {:error, :positionTaken}
    end
  end

  defp is_number_in_range(num, min, max) do
    case Integer.parse(num) do
      {num, "\n"} -> in_range(num, min, max)
      {num, ""} -> in_range(num, min, max)
      _ -> {:error, :invalidNumber}
    end
  end

  defp in_range(num, min, max) do
    case num in (min..max) do
      true -> {:valid, num}
      false -> {:error, :numberNotInRange}
    end
  end

end
