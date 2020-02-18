fizzBuzz = fn
  0, 0, c -> "FizzBuzz"
  0, b, c -> "Fizz"
  a, 0, c -> "Buzz"
  a, b, c -> c
end

runFizzBuzz = fn
  int -> fizzBuzz.(
    rem(int, 3),
    rem(int, 5),
    int
  )
end

IO.inspect Enum.map(1..100, runFizzBuzz)
