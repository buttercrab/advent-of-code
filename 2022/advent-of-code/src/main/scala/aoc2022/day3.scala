package aoc2022

import scala.io.Source

/** Returns priority of the char
  *
  * @param c
  *   input char
  * @return
  *   priority of char
  */
def priority(c: Char): Int =
  val x = c.toInt
  if 'A' <= x && x <= 'Z' then x - 'A' + 27
  else x - 'a' + 1

def day3(part: Int): Unit =
  if part == 1 then
    val s = Source
      .fromFile("input/3.txt")
      .getLines()
      .map(line =>
        val l = line.length
        val a = line.slice(0, l / 2).toSet
        val b = line.slice(l / 2, l).toSet
        a.intersect(b).map(priority).sum
      )
      .sum
    println(s)
  else
    val s = Source
      .fromFile("input/3.txt")
      .getLines()
      .grouped(3)
      .map(x =>
        val a = x.head.toSet
        val b = x(1).toSet
        val c = x(2).toSet
        a.intersect(b).intersect(c).map(priority).sum
      )
      .sum
    println(s)
