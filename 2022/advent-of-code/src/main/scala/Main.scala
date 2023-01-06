import aoc2022.*

@main def main(args: String*): Unit =
  assert(1 <= args(1).toInt && args(1).toInt <= 2)
  args(0) match
    case "1" | "day1" => day1(args(1).toInt)
    case "2" | "day2" => day2(args(1).toInt)
    case "3" | "day3" => day3(args(1).toInt)
    case "4" | "day4" => day4(args(1).toInt)
    case "5" | "day5" => day5(args(1).toInt)
