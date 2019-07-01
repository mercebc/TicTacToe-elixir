defmodule PlayersFactory do
  def create(mode) do
    case mode do
      :human_vs_human -> [%Human{mark: "X"}, %Human{mark: "O"}]
    end
  end
end
