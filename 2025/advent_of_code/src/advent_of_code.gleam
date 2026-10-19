import aoc2025/day1
import argv
import gleam/int
import gleam/io
import glint

pub fn main() {
  glint.new()
  |> glint.with_name("aoc2025")
  |> glint.pretty_help(glint.default_pretty_help())
  |> glint.add(at: [], do: run())
  |> glint.run(argv.load().arguments)
}

fn run() -> glint.Command(Nil) {
  use <- glint.command_help("Run Advent of Code 2025 solutions")
  use day <- glint.named_arg("day")
  use part <- glint.named_arg("part")
  use named, _args, _flags <- glint.command()

  let day = day(named) |> int.parse
  let part = part(named) |> int.parse

  case day, part {
    Ok(1), Ok(p) -> day1.day1(p)
    Ok(d), Ok(p) ->
      io.println(
        "Day "
        <> int.to_string(d)
        <> " part "
        <> int.to_string(p)
        <> " not implemented yet",
      )
    _, _ -> io.println("Usage: gleam run -- <day> <part>")
  }
}
