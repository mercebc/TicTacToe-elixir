defmodule Flow do
  def start(players, size), do: play(Board.new(size), players)

  def play(board, players) do
    UI.display_board(board)
    if !game_over(board, players) do
      board = make_move(board, players)
      players = swap_players(players)
      play(board, players)
    else
      announcements(board, players)
    end
  end

  def swap_players([first, second]), do: [second, first]

  defp make_move(board, [current, _] = players) do
    position = Player.get_position(current, board, players)
    Board.register(board, current, position)
  end

  def game_over(board, players) do
    case Rules.has_winner(board, players) do
      :no_winner -> if Board.is_full(board), do: game_finished(), else: continue_playing()
      _ -> game_finished()
    end
  end

  defp announcements(board, players) do
    case Rules.has_winner(board, players) do
      :no_winner -> UI.display_message(:is_draw)
      winner -> UI.display_message(:winner, winner.mark)
    end
  end

  defp continue_playing, do: false
  defp game_finished, do: true
end
