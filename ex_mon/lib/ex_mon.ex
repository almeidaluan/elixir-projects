defmodule ExMon do
  alias ExMon.{ Player, Game}
  alias ExMon.Game.Status
  @computer_name "RoboTinik"

  def create_player(name, move_rnd, mov_avg, move_heal) do
    Player.build(name, move_rnd, mov_avg, move_heal)
  end

  def create_game(player) do
    @computer_name
    |> create_player(:kick,:punch,:heal)
    |> Game.start(player)

    Status.print_round_message()

  end
end
