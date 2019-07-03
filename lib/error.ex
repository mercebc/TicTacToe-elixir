defmodule Error do
  def message(code) do
    case code do
      :position_taken -> "Position already taken"
      :invalid_number -> "The number you typed is not a valid number"
      :number_not_in_range -> "The number you typed is not in the range allowed"
    end
  end
end
