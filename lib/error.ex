defmodule Error do

  def message(code) do
    case code do
      :positionTaken -> "Position already taken"
      :invalidNumber -> "The position you typed is not a valid number"
      :numberNotInRange -> "The position you typed is not in the board range"
    end
  end

end
