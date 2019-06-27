defmodule Flow do
  alias Board

  def start(players, size), do: play(Board.new(size), players)

  def play(board, players) do
    if Board.is_full(board) do
      Display.message("End game")
    else
    make_move(board, players)
    swap_players(players)
    play(board, players)
    end
  end

  def swap_players(players), do: [List.last(players), List.first(players)]

  def make_move(board, players) do
    current = players.first
    Human.get_move(current.mark)
    Board.register(position, board, current.mark)
  end

end
