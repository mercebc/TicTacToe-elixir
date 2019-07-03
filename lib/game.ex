defmodule Game do
  def new do
    UI.display_message(:welcome)
    size = 3
    mode = UI.ask_mode
    UI.display_message(:selected_mode, mode)
    players = PlayersFactory.create(mode)
    Flow.start(players,size)
  end
end


