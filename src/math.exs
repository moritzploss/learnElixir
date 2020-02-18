defmodule Math do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(double(n))

  def factorial(0), do: 1
  def factorial(n) when is_integer(n) and n > 0 do
    n * factorial(n - 1)
  end

  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

  def greatestCommonDivisor(x, 0), do: x
  def greatestCommonDivisor(x, y), do: greatestCommonDivisor(y, rem(x, y))
end

IO.puts Math.double(4)
IO.puts Math.triple(4)
IO.puts Math.quadruple(4)

IO.puts Math.factorial(4)
IO.puts Math.sum(4)
IO.puts Math.greatestCommonDivisor(8, 16)
