defmodule Advent do
  def input_file(module) do
    path = module |> Module.split |> List.last |> String.downcase()
    Path.join([File.cwd!, "resources", "#{path}.txt"])
  end
end
