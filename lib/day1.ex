defmodule Day1 do
  def floor do
    __ENV__.module
    |> Advent.input_file
    |> File.read!
    |> String.split("")
    |> Enum.reduce(0, fn(direction, acc) -> acc + decision(direction) end)
  end

  def decision("("), do: 1
  def decision(")"), do: -1
  def decision(_), do: 0
end
