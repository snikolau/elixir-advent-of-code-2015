defmodule Day2 do
  defp path do
    Path.join([File.cwd!(), "resources", "day2.txt"])
  end

  def calculate do
    File.read!(path)
    |> String.trim
    |> String.split("\n")
    |> Enum.reduce(0, fn(side, acc) -> acc + side_calculate(side) end)
  end

  def side_calculate(raw_side) do
    sides = raw_side
      |> String.split("x")
      |> Enum.map(fn(x) -> String.to_integer(x) end)
      |> Enum.sort
    3 * Enum.at(sides, 0) * Enum.at(sides, 1) + 2 * Enum.at(sides, 0) * Enum.at(sides, 2) +
    2 * Enum.at(sides, 1) * Enum.at(sides, 2)
  end
end
