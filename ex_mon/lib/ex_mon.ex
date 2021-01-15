defmodule ExMon do

  alias ExMon.{ Player, Game}
  alias ExMon.Game.{Status, Actions}

  @computer_name "RoboTinik"

  def create_player(name, move_rnd, mov_avg, move_heal) do
    Player.build(name, move_rnd, mov_avg, move_heal)
  end

  def create_game(player) do
    @computer_name
    |> create_player(:kick, :punch, :heal)
    |> Game.start(player)

    Status.print_round_message()

  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

 def do_move({:error, move }), do: Status.print_wrong_message(move)

 def do_move({:ok, move }) do
  case move do
    :move_heal -> "Realiza Cura"
    move -> Actions.attack(move)
  end
 end

end
