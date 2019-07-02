defmodule RandomComputer do
  defstruct [:mark]

  def new(mark), do: %RandomComputer{mark: mark}

  defimpl Player, for: RandomComputer do
    def get_move(randomComputer, board, _players) do
      Dialog.message(:random_position, randomComputer.mark)
      |> UI.display
      board
      |> Board.available_positions
      |> Enum.random
    end
  end
end
