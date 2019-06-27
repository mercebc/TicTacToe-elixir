defmodule Human do
  def new(mark), do: %Player{mark: mark}

  def get_move(player), do: Display.ask_for_position(player.mark)
end
