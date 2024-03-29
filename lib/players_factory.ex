defmodule PlayersFactory do
  def create(mode) do
    case mode do
      :human_vs_human -> [Human.new("X"), Human.new("O")]
      :human_vs_random -> [Human.new("X"), RandomComputer.new("O")]
      :human_vs_super -> [Human.new("X"), SuperComputer.new("O")]
    end
  end
end
