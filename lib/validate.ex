defmodule Validate do
  def game_mode(mode) do
    case is_number_in_range(mode, 1, 3) do
      {:ok, mode} -> {:ok, mode_tag(mode)}
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

  def position(position, board) do
    case is_number_in_range(position, 1, length(board)) do
      {:ok, position} -> is_position_available(position-1, board)
      error -> error
    end
  end

  defp is_position_available(position, board) do
    case Enum.member?(Board.available_positions(board), position) do
      true -> {:ok, position}
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
      true -> {:ok, num}
      false -> {:error, :number_not_in_range}
    end
  end
end
