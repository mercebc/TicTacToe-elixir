defmodule Human do
  defstruct [:mark]

  def new(mark), do: %Human{mark: mark}

  defimpl Player, for: Human do
    def get_position(human, board, _players), do: UI.ask_position(human.mark, board)
  end
end
