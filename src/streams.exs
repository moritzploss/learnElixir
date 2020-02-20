printValue = &(IO.inspect(&1))
timesTwo = &(&1 * 2)

IO.puts "List:"
1..3
  |> Enum.map(printValue)
  |> Enum.map(timesTwo)
  |> Enum.map(printValue)

IO.puts "Stream:"
stream = 1..3
  |> Stream.map(printValue)
  |> Stream.map(timesTwo)
  |> Stream.map(printValue)
Enum.to_list(stream)

IO.puts "Double Eternally"
Stream.iterate(1, &(&1 + &1))
  |> Enum.take(10)
  |> Enum.map(printValue)

IO.puts "Fibonacci"
Stream.unfold({0, 1}, fn {f0, f1} -> {f0, {f1, f0 + f1}} end)
  |> Enum.take(10)
  |> Enum.map(printValue)


defmodule Countdown do
  def sleep(milliseconds) do
    receive do
      after milliseconds -> nil
    end
  end

  def timer do
    Stream.resource(
      fn ->
        {_h, _m, s} = :erlang.time
        s
      end,

      fn
        0 -> {:halt, 0}
        count ->
          sleep(100)
          { %{ count: count }, count - 1 }
      end,

      fn _ -> nil end
    )
  end
end

IO.puts "Countdown to 1"
counter = Countdown.timer
printer = counter |> Stream.each(&IO.inspect/1)
printer |> Enum.take(60)
