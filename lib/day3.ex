defmodule Day3 do
  def calculate do
    {steps, _} =
      __ENV__.module
      |> Advent.input_file
      |> File.read!
      |> String.trim
      |> String.split("")
      |> Enum.reduce({MapSet.new([{0,0}]), {0,0}}, fn(step, acc) -> acc = next_step(acc, step) end)

    MapSet.size(steps)
  end

  def next_step({coordinates, current_coordinate}, step) do
    new_coordinate = calucate_coordinate(current_coordinate, step)
    {MapSet.put(coordinates, new_coordinate), new_coordinate}
  end

  def calucate_coordinate({x, y}, ">"), do: {x+1, y}
  def calucate_coordinate({x, y}, "<"), do: {x-1, y}
  def calucate_coordinate({x, y}, "^"), do: {x, y+1}
  def calucate_coordinate({x, y}, "v"), do: {x, y-1}
  def calucate_coordinate({x, y}, ""), do: {x, y}

end
