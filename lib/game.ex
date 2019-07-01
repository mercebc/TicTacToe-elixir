defmodule Game do
  def new do
    Dialog.message(:welcome)
    |> UI.display

    size = UI.ask_size
    mode = UI.ask_mode
    players = PlayersFactory.create(mode)
    Flow.start(players,size)
  end


end


