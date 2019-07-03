defmodule ErrorTest do
  use ExUnit.Case
  doctest Error

  test "can get an error message from error tag" do
    assert Error.message(:position_taken) == "Position already taken"
  end
end

