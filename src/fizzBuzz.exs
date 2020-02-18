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

IO.puts runFizzBuzz.(10)
IO.puts runFizzBuzz.(11)
IO.puts runFizzBuzz.(12)
IO.puts runFizzBuzz.(13)
IO.puts runFizzBuzz.(14)
IO.puts runFizzBuzz.(15)
IO.puts runFizzBuzz.(16)