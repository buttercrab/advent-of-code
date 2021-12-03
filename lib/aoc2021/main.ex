defmodule Aoc2021.Main do
  @moduledoc false

  def main(args) do
    case args do
      ["day1", "part1"] -> Aoc2021.Day1.part1()
      ["day1", "part2"] -> Aoc2021.Day1.part2()
      ["day2", "part1"] -> Aoc2021.Day2.part1()
      ["day2", "part2"] -> Aoc2021.Day2.part2()
      [] -> IO.puts("Oops")
    end
  end
end
