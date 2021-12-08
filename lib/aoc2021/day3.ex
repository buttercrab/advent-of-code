defmodule Aoc2021.Day3 do
  @moduledoc false

  defp input() do
    File.stream!("#{File.cwd!()}/input/day3.txt")
    |> Stream.map(&string_to_array/1)
  end

  defp string_to_array(str) do
    str
    |> String.trim()
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
  end

  defp array_to_integer_impl(arr) do
    case arr do
      [] -> 0
      [x | xs] -> x + array_to_integer_impl(xs) * 2
    end
  end

  defp array_to_integer(arr) do
    arr
    |> Enum.reverse()
    |> array_to_integer_impl()
  end

  def part1() do
    inp = input()
    len = inp
          |> Enum.count()
    gamma = inp
            |> Enum.reduce(fn a, b -> Enum.zip_with(a, b, &+/2) end)
            |> Enum.map(fn a -> if a * 2 > len, do: 1, else: 0 end)
            |> array_to_integer()
    epsilon = inp
              |> Enum.reduce(fn a, b -> Enum.zip_with(a, b, &+/2) end)
              |> Enum.map(fn a -> if a * 2 > len, do: 0, else: 1 end)
              |> array_to_integer()
    IO.puts(gamma * epsilon)
  end

  def part2() do
    inp = input()
    len = inp
          |> Enum.count()
  end
end
