defmodule Board do
  def new(size) do
    Enum.to_list(1..size*size)
  end

  def register(board, player, position) do
    List.replace_at(board, position, player.mark)
  end

end
