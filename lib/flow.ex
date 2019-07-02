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
    position = Player.get_move(current, board, players)
    Board.register(board, current, position)
  end

  def game_over(board, players) do
    case Rules.has_winner(board, players) do
      :no_winner -> if Board.is_full(board), do: game_finished, else: continue_playing
      _ -> game_finished
    end
  end

  def announcements(board, players) do
    case Rules.has_winner(board, players) do
      :no_winner -> announce_draw(board)
      winner -> announce_winner(winner)
    end
  end

  defp announce_winner(winner) do
    Dialog.message(:winner, winner.mark)
    |> UI.display
  end

  defp announce_draw(board) do
    Dialog.message(:is_draw)
    |> UI.display
  end

  defp continue_playing, do: false
  defp game_finished, do: true

end
