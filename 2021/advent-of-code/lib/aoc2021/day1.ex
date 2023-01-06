defmodule Aoc2021.Day1 do
  @moduledoc false

  defp input() do
    File.stream!("#{File.cwd!()}/input/day1.txt")
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end

  defp count_increasing(stream) do
    stream
    |> Stream.drop(1)
    |> Stream.zip(stream)
    |> Stream.map(fn {a, b} -> if a > b, do: 1, else: 0 end)
    |> Enum.sum()
  end

  def part1() do
    input()
    |> count_increasing()
    |> IO.puts()
  end

  def part2() do
    stream1 = input()
    stream2 = Stream.drop(stream1, 1)
    stream3 = Stream.drop(stream1, 2)

    Stream.zip([stream1, stream2, stream3])
    |> Stream.map(fn {a, b, c} -> a + b + c end)
    |> count_increasing()
    |> IO.puts()
  end
end
