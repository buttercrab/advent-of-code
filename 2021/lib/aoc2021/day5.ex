defmodule Aoc2021.Day5 do
  @moduledoc false

  defp input() do
    File.stream!("#{File.cwd!()}/input/day5.txt")
    |> Enum.map(fn x ->
      x
      |> String.split("->")
      |> Enum.map(fn y ->
        y
        |> String.split(",")
        |> Enum.map(&String.trim/1)
        |> Enum.map(&String.to_integer/1)
      end)
    end)
  end

  def part1() do
    input()
    |> Enum.filter(fn [[a, b], [c, d]] ->
      a == c || b == d
    end)
    |> Enum.reduce(%{}, fn [[a, b], [c, d]], x ->
      l = max(abs(a - c) + 1, abs(b - d) + 1)

      Enum.zip_reduce(
        a..c |> Stream.cycle() |> Enum.take(l),
        b..d |> Stream.cycle() |> Enum.take(l),
        x,
        fn i, j, y ->
          Map.put(y, {i, j}, Map.get(y, {i, j}, 0) + 1)
        end
      )
    end)
    |> Map.values()
    |> Enum.count(&(&1 >= 2))
    |> IO.puts()
  end

  def part2() do
    input()
    |> Enum.reduce(%{}, fn [[a, b], [c, d]], x ->
      l = max(abs(a - c) + 1, abs(b - d) + 1)

      Enum.zip_reduce(
        a..c |> Stream.cycle() |> Enum.take(l),
        b..d |> Stream.cycle() |> Enum.take(l),
        x,
        fn i, j, y ->
          Map.put(y, {i, j}, Map.get(y, {i, j}, 0) + 1)
        end
      )
    end)
    |> Map.values()
    |> Enum.count(&(&1 >= 2))
    |> IO.puts()
  end
end
