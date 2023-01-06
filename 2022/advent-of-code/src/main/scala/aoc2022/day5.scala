package aoc2022

import scala.io.Source

def day5(part: Int): Unit =
  val c = Source
    .fromFile("input/4.txt")
    .getLines()
    .count(line =>
      val l = line.split("[-,]").map(_.toInt)
      if part == 1 then
        (l(0) <= l(2) && l(3) <= l(1)) || (l(2) <= l(0) && l(1) <= l(3))
      else !(l(3) < l(0) || l(1) < l(2))
    )
  println(c)
