defmodule Human do
  def new(mark), do: %Player{mark: mark}

  def get_move(player, board), do: UI.ask_position(player.mark, board)
end
