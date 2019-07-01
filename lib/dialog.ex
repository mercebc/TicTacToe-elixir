defmodule Dialog do

  def message(code) do
    case code do
      :welcome -> "Welcome to Tic Tac Toe\n"
      :is_draw -> "It's a draw\n"
    end
  end

  def message(code, mark) do
    case code do
      :askPosition -> "Please #{mark}, type a position\n"
      :winner -> "Yayyy! #{mark} is the winner!!!\n"
    end
  end

end
