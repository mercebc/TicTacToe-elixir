defmodule Validate do

  def game_mode(mode) do
    case is_number_in_range(mode, 1, 3) do
      {:valid, mode} -> {:valid, mode_tag(mode)}
      error -> error
    end
  end

  defp mode_tag(mode) do
    case mode do
      1 -> :human_vs_human
      2 -> :human_vs_random
      3 -> :human_vs_super
    end
  end

  def size_board(size) do
    case is_number_in_range(size, 3, 4) do
      {:valid, size} -> {:valid, size}
      error -> error
    end
  end

  def position(position, board) do
    case is_number_in_range(position, 1, length(board)) do
      {:valid, position} -> is_position_available(position-1, board)
      error -> error
    end
  end

  defp is_position_available(position, board) do
    case Enum.member?(Board.available_positions(board), position) do
      true -> {:valid, position}
      false -> {:error, :position_taken}
    end
  end

  defp is_number_in_range(num, min, max) do
    case Integer.parse(num) do
      {num, "\n"} -> in_range(num, min, max)
      {num, ""} -> in_range(num, min, max)
      _ -> {:error, :invalid_number}
    end
  end

  defp in_range(num, min, max) do
    case num in (min..max) do
      true -> {:valid, num}
      false -> {:error, :number_not_in_range}
    end
  end

end
