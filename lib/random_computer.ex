defmodule RandomComputer do
  defstruct [:mark]

  def new(mark), do: %RandomComputer{mark: mark}

  defimpl Player, for: RandomComputer do
    def get_position(randomComputer, board, _players) do
      UI.display_message(:random_position, randomComputer.mark)
      board
      |> Board.available_positions
      |> Enum.random
    end
  end
end
