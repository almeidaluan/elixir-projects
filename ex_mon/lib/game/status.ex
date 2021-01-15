defmodule ExMon.Game.Status do

  alias ExMon.Game

  def print_round_message() do
    IO.puts("\n The Game is Started!")
    IO.inspect(Game.info())
    IO.puts("--------------------------")
  end
end
