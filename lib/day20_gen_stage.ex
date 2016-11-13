defmodule Day2GenStage do
  use Experimental.GenStage

  def calculate do
    __ENV__.module
    |> Advent.input_file
    |> File.stream!
    |> Enum.reduce(0, fn(side, acc) -> acc + side_calculate(side) end)
  end

  def side_calculate(str) when length(str) < 1, do: 0
  def side_calculate(raw_side) do
    sides = raw_side
      |> String.trim
      |> String.split("x")
      |> Enum.map(fn(x) -> String.to_integer(x) end)
      |> Enum.sort
    3 * Enum.at(sides, 0) * Enum.at(sides, 1) + 2 * Enum.at(sides, 0) * Enum.at(sides, 2) +
    2 * Enum.at(sides, 1) * Enum.at(sides, 2)
  end
end
