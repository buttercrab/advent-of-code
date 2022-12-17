import aoc2022.*

@main def main(args: String*): Unit =
  args(0) match
    case "1" | "day1" => day1(args(1).toInt)
    case "2" | "day2" => day2(args(1).toInt)
