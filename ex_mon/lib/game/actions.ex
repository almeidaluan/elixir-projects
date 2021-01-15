defmodule ExMon.Game.Actions do
  alias ExMon.Game
  alias ExMon.Game.Attack

  def fetch_move(move) do
    Game.player()
    |>Map.get(:moves)
    |>find_move(move)
  end

  def find_move(moves, move) do
    Enum.find_value(moves, {:error, move},fn {key,value} ->
    if value == move do
    {:ok, key}
    end
    end)
  end

  def attack(move) do
    case Game.turn() do
      :player -> Attack.attack(move,:computer)
      :computer -> Attack.attack(move, :player)
    end
  end
end
