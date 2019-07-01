defmodule PlayersFactory do
  def create(mode) do
    case mode do
      :human_vs_human -> [%Player{mark: "X"}, %Player{mark: "O"}]
    end
  end
end
