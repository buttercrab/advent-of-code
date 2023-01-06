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

  defp array_to_integer_impl([]) do
    0
  end

  defp array_to_integer_impl([x | xs]) do
    x + array_to_integer_impl(xs) * 2
  end

  defp array_to_integer(arr) do
    arr
    |> Enum.reverse()
    |> array_to_integer_impl()
  end

  def part1() do
    inp = input()
    len = Enum.count(inp)

    gamma =
      inp
      |> Enum.reduce(fn a, b -> Enum.zip_with(a, b, &+/2) end)
      |> Enum.map(fn a -> if a * 2 > len, do: 1, else: 0 end)
      |> array_to_integer()

    epsilon =
      inp
      |> Enum.reduce(fn a, b -> Enum.zip_with(a, b, &+/2) end)
      |> Enum.map(fn a -> if a * 2 > len, do: 0, else: 1 end)
      |> array_to_integer()

    IO.puts(gamma * epsilon)
  end

  defp solve_oxygen(arr, idx) do
    len = Enum.count(arr)

    if len == 1 do
      Enum.at(arr, 0)
    else
      msb =
        arr
        |> Enum.reduce(fn a, b -> Enum.zip_with(a, b, &+/2) end)
        |> Enum.map(fn a -> if a * 2 >= len, do: 1, else: 0 end)
        |> Enum.at(idx)

      next_arr =
        arr
        |> Enum.filter(fn a -> Enum.at(a, idx) == msb end)

      solve_oxygen(next_arr, idx + 1)
    end
  end

  defp solve_co2(arr, idx) do
    len = Enum.count(arr)

    if len == 1 do
      Enum.at(arr, 0)
    else
      lsb =
        arr
        |> Enum.reduce(fn a, b -> Enum.zip_with(a, b, &+/2) end)
        |> Enum.map(fn a -> if a * 2 >= len, do: 0, else: 1 end)
        |> Enum.at(idx)

      next_arr =
        arr
        |> Enum.filter(fn a -> Enum.at(a, idx) == lsb end)

      solve_co2(next_arr, idx + 1)
    end
  end

  def part2() do
    inp = input()

    oxygen =
      inp
      |> solve_oxygen(0)
      |> array_to_integer()

    co2 =
      inp
      |> solve_co2(0)
      |> array_to_integer()

    IO.puts(oxygen * co2)
  end
end
