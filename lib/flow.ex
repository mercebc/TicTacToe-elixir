defmodule Flow do
  alias Board
  alias Human
  alias Board

  def start(players, size), do: play(Board.new(size), players)

  def play(board, players) do
    Display.board(board)
    if !game_over(board, players) do
      board = make_move(board, players)
      players = swap_players(players)
      play(board, players)
    end
  end

  defp swap_players([first, second]), do: [second, first]

  defp make_move(board, [current, _]) do
    position = Human.get_move(current)
    Board.register(current, board, position)
  end

  defp game_over(board, players) do
    case Rules.has_winner(board, players) do
      :no_winner -> is_draw(board)
      winner -> announce_winner(winner)
    end
  end

  defp announce_winner(winner) do
    Display.announcement(winner.mark <> " is a winner")
    true
  end

  defp is_draw(board) do
    if Board.is_full(board) do
      Display.announcement("It's a draw")
      true
    else
      false
    end
  end

end
