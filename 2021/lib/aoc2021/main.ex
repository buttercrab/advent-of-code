defmodule Aoc2021.Main do
  @moduledoc """
  Compile this with:

  ```bash
  mix escript.build
  ```

  run with:

  ```bash
  ./aoc2021 day# part#
  ```

  put numbers in #
  """

  def main(args) do
    Code.eval_string("Aoc2021.#{String.capitalize(Enum.at(args, 0))}.#{Enum.at(args, 1)}")
  end
end
