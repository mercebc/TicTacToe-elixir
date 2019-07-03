defmodule SuperComputer do
  defstruct [:mark]

  def new(mark), do: %SuperComputer{mark: mark}

  defimpl Player, for: SuperComputer do
    def get_position(superComputer, board, players) do
      UI.display_message(:super_computer_position, superComputer.mark)
      best_position(board, players, superComputer)
    end

    defp best_position(board, players, superComputer) do
      all_positions_scored(board, players, superComputer, 0)
      |> highest_position
    end

    defp highest_position(positions_scored), do: Enum.max_by(positions_scored, fn map -> map.score end).position

    defp all_positions_scored(board, players, superComputer, depth) do
      board
      |> Board.available_positions
      |> Enum.map(fn position -> score_each_position(position, board, players, superComputer, depth) end)
    end

    defp score_each_position(position, board, [current, _] = players, superComputer, depth) do
      board = Board.register(board, current, position)
      game_over = Flow.game_over(board, players)
      players = Flow.swap_players(players)
      %{ position: position,
        score: score(game_over, board, players, superComputer, depth)}
    end

    defp score(true, board, players, superComputer, depth) do
      case Rules.has_winner(board, players) do
        ^superComputer -> 10 - depth
        :no_winner -> 0
        _ -> depth - 10
      end
    end

    defp score(false, board, players, superComputer, depth) do
      case players do
        [^superComputer, _] -> all_positions_scored(board, players, superComputer, depth+1) |> highest_score
        [_,^superComputer] -> all_positions_scored(board, players, superComputer, depth+1) |> lowest_score
      end
    end

    defp highest_score(positions_scores), do: Enum.max_by(positions_scores, fn map -> map.score end).score
    defp lowest_score(positions_scores), do: Enum.min_by(positions_scores, fn map -> map.score end).score
  end
end
