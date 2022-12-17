package aoc2022

import scala.io.Source

val leftMap = Map("A" -> 1, "B" -> 2, "C" -> 3)
val rightMap = Map("X" -> 1, "Y" -> 2, "Z" -> 3)

/** Rock Paper Scissors winner calculator
  *
  * @param left
  *   left hand
  * @param right
  *   right hand
  * @return
  *   0 when draw, 1 when right wins, -1 when left wins
  */
def rps(left: String, right: String): Int =
  val l = leftMap(left)
  val r = rightMap(right)
  (r - l + 4) % 3 - 1

/** Get Rock Paper Scissors hand from result
  *
  * @param left
  *   left hand
  * @param result
  *   result of game
  * @return
  *   1 when Rock, 2 when Paper, 3 when Scissors
  */
def invRps(left: String, result: String): Int =
  val l = leftMap(left)
  val r = rightMap(result)
  (l + r) % 3 + 1

def day2(part: Int): Unit =
  var s = 0
  for line <- Source.fromFile("input/2.txt").getLines() do
    val input = line.split(' ')
    val left = input(0)
    val right = input(1)
    if part == 1 then s += (rps(left, right) + 1) * 3 + rightMap(right)
    else s += (rightMap(right) - 1) * 3 + invRps(left, right)
  println(s)
