defmodule RandomComputer do
  defstruct [:mark]

  def new(mark), do: %RandomComputer{mark: mark}

  defimpl Player, for: RandomComputer do
    def get_move(player, board) do
      Dialog.message(:random_position, player.mark)
      |> UI.display

      board
      |> Board.available_positions
      |> Enum.random
    end
  end
end
