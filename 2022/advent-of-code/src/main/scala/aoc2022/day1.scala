package aoc2022

import scala.io.Source

def day1(part: Int): Unit =
  val v = Source
    .fromFile("input/1.txt")
    .getLines()
    .foldLeft(Array.empty[Int] :+ 0)((arr, s) =>
      if s.isEmpty then arr :+ 0
      else arr.init :+ (arr.last + s.toInt)
    )
  if part == 1 then println(v.max)
  else println(v.sorted.reverse.slice(0, 3).sum)
