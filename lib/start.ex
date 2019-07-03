defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_) do
    Game.new()
  end
end
