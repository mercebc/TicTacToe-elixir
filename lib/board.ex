defmodule Board do
  def new(size) do
    Enum.to_list(1..size*size)
  end

  def register(mark, position, board) do
    List.replace_at(board, position, mark)
  end
end
