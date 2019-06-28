defmodule Human do
  def new(mark), do: %Player{mark: mark}

  def get_move(player, board), do: Display.ask_for_position(player.mark, board)
end
