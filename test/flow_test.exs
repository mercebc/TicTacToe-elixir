defmodule FlowTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Flow

  test "X wins" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    assert capture_io([input: "1\n2\n3\n4\n5\n6\n7\n", capture_prompt: false], fn ->
      Flow.start(players,3)
    end) =~ "Yayyy! X is the winner!!!"
  end

  test "O wins" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    assert capture_io([input: "2\n3\n4\n5\n6\n7\n8\n9\n1\n", capture_prompt: false], fn ->
      Flow.start(players,3)
    end) =~ "Yayyy! O is the winner!!!"
  end

  test "its a draw" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    assert capture_io([input: "1\n2\n3\n4\n6\n5\n7\n9\n8\n", capture_prompt: false], fn ->
      Flow.start(players,3)
    end) =~ "It's a draw"
  end

  test "swaps players" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    assert Flow.swap_players(players) == [%Human{mark: "O"}, %Human{mark: "X"}]
  end

  test "the game is over if game has a winner" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    board = ["X","O","O","X","X","O","X","X","O"]
    assert Flow.game_over(board, players) == true
  end

  test "the game is over if it is a draw" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    board = ["X","O","X","X","X","O","O","X","O"]
    assert Flow.game_over(board, players) == true
  end

  test "the game continues if not a win or a draw" do
    players = [%Human{mark: "X"}, %Human{mark: "O"}]
    board = ["X","O","O","","X","O","","X",""]
    assert Flow.game_over(board, players) == false
  end
end
