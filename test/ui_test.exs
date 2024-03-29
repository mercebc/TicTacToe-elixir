defmodule UITest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest UI

  test "can display a message" do
    assert capture_io(fn ->
      UI.display_message(:welcome)
    end) == "Welcome to Tic Tac Toe!\n\n"
  end

  test "can display a message with arguments" do
    assert capture_io(fn ->
      UI.display_message(:selected_mode, :human_vs_human)
    end) == "You have selected human_vs_human\n"
  end

  test "can display a formatted board" do
    board = ["","X","","O","","","X","",""]
    assert capture_io(fn ->
      UI.display_board(board)
    end) == "1 | X | 3\nO | 5 | 6\nX | 8 | 9\n"
  end

  test "cant register mark in a position already taken, ask again and it saves the position not taken" do
    board = ["","X","","O","","","X","",""]
    player = %Human{mark: "O"}
    capture_io([input: "2\n5\n", capture_prompt: false], fn ->
      assert UI.ask_position(player.mark, board) == 4
    end)
  end

  test "cant register an invalid number, ask again and it saves the valid number" do
    board = ["","X","","O","","","X","",""]
    player = %Human{mark: "O"}
    capture_io([input: "3p\n5\n", capture_prompt: false], fn ->
      assert UI.ask_position(player.mark, board) == 4
    end)
  end

  test "cant save a mode that is an invalid number, then can save human vs human" do
    capture_io([input: "3p\n1\n", capture_prompt: false], fn ->
      assert UI.ask_mode == :human_vs_human
    end)
  end

  test "cant save a mode that is not in range (1, 2 or 3), ask again and save the mode in range" do
    capture_io([input: "5\n1\n", capture_prompt: false], fn ->
      assert UI.ask_mode == :human_vs_human
    end)
  end
end
