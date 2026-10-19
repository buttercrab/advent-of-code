import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn day1(part: Int) {
  let input =
    simplifile.read("src/input/day1.txt")
    |> result.unwrap("")
    |> string.trim

  case part {
    1 -> part1(input)
    2 -> part2(input)
    _ -> io.println("Invalid part")
  }
}

fn part1(input: String) {
  // TODO: Implement part 1
  io.println("Part 1: TODO")
}

fn part2(input: String) {
  // TODO: Implement part 2
  io.println("Part 2: TODO")
}
