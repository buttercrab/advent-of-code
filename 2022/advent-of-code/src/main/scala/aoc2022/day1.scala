package aoc2022

import scala.io.Source

def day1(part: Int): Unit =
  var s: Int = 0
  var v: Array[Int] = new Array(0)
  for line <- Source.fromFile("input/1.txt").getLines() do
    if line.isEmpty then
      v = v :+ s
      s = 0
    else s += line.toInt
  if part == 1 then println(v.max)
  else println(v.sorted.reverse.slice(0, 3).sum)
