defmodule Aoc2021.Day2 do
  @moduledoc false

  defp input() do
    File.stream!("#{File.cwd!()}/input/day2.txt")
    |> Stream.map(&String.split/1)
    |> Stream.map(fn [dir, x] -> {dir, String.to_integer(x)} end)
  end

  def part1() do
    {a, b} =
      input()
      |> Enum.reduce(
        {0, 0},
        fn {dir, x}, {hor, dep} ->
          case dir do
            "forward" -> {hor + x, dep}
            "up" -> {hor, dep - x}
            "down" -> {hor, dep + x}
          end
        end
      )

    IO.puts(a * b)
  end

  def part2() do
    {a, b, _} =
      input()
      |> Enum.reduce(
        {0, 0, 0},
        fn {dir, x}, {hor, dep, aim} ->
          case dir do
            "forward" -> {hor + x, dep + aim * x, aim}
            "up" -> {hor, dep, aim - x}
            "down" -> {hor, dep, aim + x}
          end
        end
      )

    IO.puts(a * b)
  end
end
