defmodule Aoc2021.Day4 do
  @moduledoc false

  defp input() do
    inp = File.stream!("#{File.cwd!()}/input/day4.txt")

    first =
      inp
      |> Enum.take(1)
      |> List.first()
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&(&1 + 1))

    bingo =
      inp
      |> Enum.drop(1)
      |> Enum.chunk_every(6)
      |> Enum.map(fn s ->
        s
        |> Enum.drop(1)
        |> Enum.map(fn x ->
          String.split(x)
          |> Enum.map(&String.trim/1)
          |> Enum.map(&String.to_integer/1)
          |> Enum.map(&(&1 + 1))
        end)
      end)

    {first, bingo}
  end

  def transpose([[] | _]), do: []

  def transpose(m) do
    [Enum.map(m, &hd/1) | transpose(Enum.map(m, &tl/1))]
  end

  def row_bingo?(bingo) do
    bingo
    |> Enum.reduce(false, fn x, a -> a || Enum.all?(x, &(&1 == 0)) end)
  end

  def bingo?(bingo) do
    row_bingo?(bingo) ||
      bingo
      |> transpose()
      |> row_bingo?()
  end

  def step1(arr, idx, bingo) do
    x = Enum.at(arr, idx)

    bingo =
      bingo
      |> Enum.map(fn a ->
        Enum.map(a, fn b -> Enum.map(b, &if(&1 == x, do: 0, else: &1)) end)
      end)

    bingo_ =
      Enum.reduce(
        bingo,
        -1,
        fn x, a ->
          if bingo?(x) do
            x
            |> Enum.map(fn b ->
              Enum.reduce(b, 0, fn y, b -> if y > 0, do: b + y - 1, else: b end)
            end)
            |> Enum.sum()
          else
            a
          end
        end
      )

    if bingo_ != -1 do
      bingo_ * (x - 1)
    else
      step1(arr, idx + 1, bingo)
    end
  end

  def part1() do
    {first, bingo} = input()
    IO.puts(step1(first, 0, bingo))
  end

  def step2(arr, idx, bingo) do
    x = Enum.at(arr, idx)

    bingo =
      bingo
      |> Enum.map(fn a ->
        Enum.map(a, fn b -> Enum.map(b, &if(&1 == x, do: 0, else: &1)) end)
      end)

    len = Enum.count(bingo)
    first = Enum.at(bingo, 0)
    bingo = Enum.filter(bingo, fn x -> !bingo?(x) end)

    if len == 1 && Enum.empty?(bingo) do
      (x - 1) *
        (first
         |> Enum.map(fn b ->
           Enum.reduce(b, 0, fn y, b -> if y > 0, do: b + y - 1, else: b end)
         end)
         |> Enum.sum())
    else
      step2(arr, idx + 1, bingo)
    end
  end

  def part2() do
    {first, bingo} = input()
    IO.puts(step2(first, 0, bingo))
  end
end
