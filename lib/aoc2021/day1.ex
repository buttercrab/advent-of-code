defmodule Aoc2021.Day1 do
  @moduledoc false

  def main() do
    stream = File.stream!("#{File.cwd!()}/input/day1.txt")
             |> Stream.map(&String.trim/1)
             |> Stream.map(&String.to_integer/1)
    stream
    |> Stream.drop(1)
    |> Stream.zip(stream)
    |> Stream.map(fn {a, b} -> if a > b, do: 1, else: 0 end)
    |> Enum.sum()
    |> IO.puts()
  end
end
