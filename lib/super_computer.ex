defmodule SuperComputer do
  defstruct [:mark]

  def new(mark), do: %SuperComputer{mark: mark}

  defimpl Player, for: SuperComputer do
    def get_move(superComputer, board, players) do
      Dialog.message(:super_computer_position, superComputer.mark)
      |> UI.display
      best_position(board, players, superComputer)
    end

    def best_position(board, players, superComputer) do
      positions_scored(board, players, superComputer, 0)
      |> highest_position
    end

    def highest_position(positions_scored), do: Enum.max_by(positions_scored, fn map -> map.score end).position

    defp positions_scored(board, players, superComputer, depth) do
      board
      |> Board.available_positions
      |> Enum.map(& score_each_position(&1, board, players, superComputer, depth))
    end

    defp score_each_position(position, board, [current, _] = players, superComputer, depth) do
      board = Board.register(board, current, position)

      if Flow.game_over(board, players) do
        players = Flow.swap_players(players)
        %{ position: position,
          score: score_final_state(board, players, superComputer, depth)}
      else
        players = Flow.swap_players(players)
        %{ position: position,
          score: score_not_final_state(board, players, superComputer, depth)}
      end
    end

    def score_final_state(board, players, superComputer, depth) do
      case Rules.has_winner(board, players) do
        ^superComputer -> 10 - depth
        :no_winner -> 0
        _ -> depth - 10
      end
    end

    def score_not_final_state(board, players, superComputer, depth) do
      case players do
        [^superComputer, _] -> positions_scored(board, players, superComputer, depth+1) |> highest_score
        [_,^superComputer] -> positions_scored(board, players, superComputer, depth+1) |> lowest_score
      end
    end

    def highest_score(positions_scores), do: Enum.max_by(positions_scores, fn map -> map.score end).score

    def lowest_score(positions_scores), do: Enum.min_by(positions_scores, fn map -> map.score end).score

  end
  A
end
