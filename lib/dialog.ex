defmodule Dialog do
  def message(label) do
    case label do
      :welcome -> "Welcome to Tic Tac Toe!\n"
      :is_draw -> "It's a draw\n"
      :ask_mode_game -> "Type in the number of the game mode you would like to play:\n1. human VS human    2. human VS random    3. human VS super computer\n"
    end
  end

  def message(label, arg) do
    case label do
      :selected_mode -> "You have selected #{arg}"
      :random_position -> "Random computer(#{arg})'s turn"
      :super_computer_position -> "Super computer(#{arg})'s turn"
      :ask_position -> "Please #{arg}, type a position\n"
      :winner -> "Yayyy! #{arg} is the winner!!!\n"
    end
  end
end
