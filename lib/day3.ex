defmodule Advent.Day3 do
  def input do
    __ENV__.module
    |> Advent.input_file
    |> File.read!
    |> String.trim
    |> String.split("")
  end

  defmodule Part1 do
    def calculate do
      {steps, _} =
        Advent.Day3.input
        |> Enum.reduce({MapSet.new([{0,0}]), {0,0}}, fn(step, acc) -> next_step(acc, step) end)
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

  defmodule Part2 do
    def calculate do
      {steps, _} =
        Advent.Day3.input
        |> Enum.chunk(2)
        |> Enum.reduce({MapSet.new([{0,0}]), [{0,0}, {0,0}]}, fn(step, acc) -> next_step(acc, step) end)
      MapSet.size(steps)
    end

    def next_step({coordinates, [santa_coordinate, robo_coordinate]}, [santa_step, robo_step]) do
      new_santa_coordinate = calucate_coordinate(santa_coordinate, santa_step)
      new_robo_coordinate = calucate_coordinate(robo_coordinate, robo_step)
      {MapSet.union(coordinates, MapSet.new([new_santa_coordinate, new_robo_coordinate])), [new_santa_coordinate, new_robo_coordinate]}
    end

    def calucate_coordinate({x, y}, ">"), do: {x+1, y}
    def calucate_coordinate({x, y}, "<"), do: {x-1, y}
    def calucate_coordinate({x, y}, "^"), do: {x, y+1}
    def calucate_coordinate({x, y}, "v"), do: {x, y-1}
    def calucate_coordinate({x, y}, ""), do: {x, y}
  end
end
