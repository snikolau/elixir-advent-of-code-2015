defmodule Advent.Day2 do
  def input do
    __ENV__.module
    |> Advent.input_file
    |> File.read!
    |> String.trim
    |> String.split("\n")
  end

  def parse_side(raw_side) do
    raw_side
      |> String.split("x")
      |> Enum.map(fn(x) -> String.to_integer(x) end)
      |> Enum.sort
  end

  defmodule Part1 do
    def calculate do
      Advent.Day2.input |> Enum.reduce(0, fn(side, acc) -> acc + side_calculate(side) end)
    end

    defp side_calculate(raw_side) do
      sides = Advent.Day2.parse_side(raw_side)
      3 * Enum.at(sides, 0) * Enum.at(sides, 1) + 2 * Enum.at(sides, 0) * Enum.at(sides, 2) +
      2 * Enum.at(sides, 1) * Enum.at(sides, 2)
    end
  end

  defmodule Part2 do
    def calculate do
      Advent.Day2.input |> Enum.reduce(0, fn(side, acc) -> acc + side_calculate(side) end)
    end

    defp side_calculate(raw_side) do
      sides = Advent.Day2.parse_side(raw_side)
      2 * Enum.at(sides, 0) + 2 * Enum.at(sides, 1) +
      Enum.at(sides, 0) * Enum.at(sides, 1) * Enum.at(sides, 2)
    end
  end
end
