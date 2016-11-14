defmodule Advent.Day4 do
  defp input do
    "iwrupvqb"
  end

  def calculate do
    check_string(md5(input), 0)
  end

  def check_string("000000" <> string, num), do: num
  def check_string(string, num) do
    num = num + 1
    "#{input()}#{num}"
    |> md5
    |> check_string(num)
  end

  def md5(string) do
    :crypto.hash(:md5, string) |> Base.encode16
  end
end
