defmodule ExMon.Game.Attack do
  alias ExMon.Game

  @move_rnd_power 18..25
  @move_avg_power 10..20

  def attack(move, opponent) do
    damage = calculate_power(move)

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_life_opponent(opponent)

  end

  def calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  def calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)


  def calculate_total_life(life, damage) when life  - damage < 0, do: 0
  def calculate_total_life(life, damage), do: life - damage

  def update_life_opponent(life,opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(opponent)
  end

  def update_game(player, opponent) do
    Game.info()
    |> Map.put(opponent,player)
    |> Game.update()
  end
end
