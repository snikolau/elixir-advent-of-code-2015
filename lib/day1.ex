defmodule Advent.Day1 do
  def input do
    __ENV__.module
    |> Advent.input_file
    |> File.read!
    |> String.trim
    |> String.split("")
  end

  defmodule Part1 do
    def calculate do
      Advent.Day1.input |> Enum.reduce(0, fn(direction, acc) -> acc + decision(direction) end)
    end

    def decision("("), do: 1
    def decision(")"), do: -1
    def decision(_), do: 0
  end

  defmodule Part2 do
    def calculate do
      Advent.Day1.input |> next_floor(0, 0)
    end

    defp next_floor(_, -1, num), do: num
    defp next_floor([],_, num), do: num
    defp next_floor([head|rest], floor, count) do
      case head do
        "(" -> next_floor(rest, floor + 1, count + 1)
        ")" -> next_floor(rest, floor - 1, count + 1)
      end
    end
  end
end
