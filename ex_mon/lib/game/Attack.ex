defmodule ExMon.Game.Attack do

  @move_rnd_power 18..25
  @move_avg_power 10..20

  def attack(move, opponent) do
    move
    |> calculate_power()

  end

  def calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  def calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)

end
