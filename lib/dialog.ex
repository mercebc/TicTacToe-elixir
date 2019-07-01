defmodule Dialog do

  def message(code) do
    case code do
      :welcome -> "Welcome to Tic Tac Toe\n"
      :is_draw -> "It's a draw\n"
      :ask_mode_game -> "Select the game mode\n"
      :ask_size_board -> "Type in the size of the board\n"
    end
  end

  def message(code, mark) do
    case code do
      :ask_position -> "Please #{mark}, type a position\n"
      :winner -> "Yayyy! #{mark} is the winner!!!\n"
    end
  end

end
