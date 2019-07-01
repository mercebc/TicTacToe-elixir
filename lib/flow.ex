defmodule Flow do
  alias Board
  alias Human
  alias Board

  def start(players, size), do: play(Board.new(size), players)

  def play(board, players) do
    UI.display_board(board)
    if !game_over(board, players) do
      board = make_move(board, players)
      players = swap_players(players)
      play(board, players)
    end
  end

  defp swap_players([first, second]), do: [second, first]

  defp make_move(board, [current, _]) do
    position = Human.get_move(current, board)
    Board.register(board, current, position)
  end

  defp game_over(board, players) do
    case Rules.has_winner(board, players) do
      :no_winner -> is_draw(board)
      winner -> announce_winner(winner)
    end
  end

  defp announce_winner(winner) do
    Dialog.message(:winner, winner.mark)
    |> UI.display
    game_finished
  end

  defp is_draw(board) do
    if Board.is_full(board) do
      Dialog.message(:is_draw)
      |> UI.display
      game_finished
    else
      continue_playing
    end
  end

  defp continue_playing, do: false
  defp game_finished, do: true

end
