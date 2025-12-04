import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn day1(part: Int) {
  let #(a, b) =
    simplifile.read("src/input/day1.txt")
    |> result.unwrap("")
    |> string.split("\n")
    |> list.map(fn(line) {
      let assert [a, b] =
        line
        |> string.split("   ")
        |> list.map(fn(a) { int.parse(a) |> result.unwrap(0) })
      #(a, b)
    })
    |> list.unzip()

  let a = list.sort(a, int.compare)
  let b = list.sort(b, int.compare)

  list.zip(a, b)
  |> list.map(fn(a) { int.absolute_value(a.0 - a.1) })
  |> list.reduce(int.add)
  |> result.unwrap(0)
  |> int.to_string
  |> io.println
}
