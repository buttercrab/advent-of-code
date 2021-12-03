defmodule Aoc2021.Main do
  @moduledoc false

  def main(args) do
    case args do
      ["day1"] -> Aoc2021.Day1.main()
      [] -> IO.puts("Oops")
    end
  end
end
