defmodule Flow do
  alias Board
  alias Human
  alias Board

  def start(players, size), do: play(Board.new(size), players)

  def play(board, players) do
    Display.board(board)
    if Board.is_full(board) do
      Display.announcement("End game")
    else
    board = make_move(board, players)
    players = swap_players(players)
    play(board, players)
    end
  end

  def swap_players(players), do: [List.last(players), List.first(players)]

  def make_move(board, players) do
    current = List.first(players)
    position = Human.get_move(current)
    Board.register(current, board, position)
  end

end
