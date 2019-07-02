defmodule Human do
  defstruct [:mark]

  def new(mark), do: %Human{mark: mark}

  defimpl Player, for: Human do
    def get_move(player, board), do: UI.ask_position(player.mark, board)
  end
end
