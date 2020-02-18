defmodule ListFunctions do
  def all?(list), do: reduce(list, true, &(&1 and &2))

  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def mapsum([], _func), do: []
  def mapsum(list, func) do
    map(list, func)
    |> reduce(0, &(&1 + &2))
  end

  def max([currentMax | []]), do: currentMax
  def max([head | tail]) do
    [first_of_tail | rest_of_tail] = tail
    cond do
      head >= first_of_tail -> max([head | rest_of_tail])
      head < first_of_tail -> max(tail)
    end
  end

  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def span(from, to) when from <= to do
    cond do
      from < to -> [from | span(from + 1, to)]
      from === to -> [to]
    end
  end

  # def split(enumerable, count) do
  #   first = take(enumerable, count)
  #   [^first, second ] = enumerable
  # end

  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head) do
    flatten(head) ++ flatten(tail)
  end
  def flatten([head | tail]), do: [head | flatten(tail)]

  # this is much more efficient
  def flatten2(list), do: flatten2(list, []) |> Enum.reverse
  def flatten2([head | tail], acc) when head == [], do: flatten2(tail, acc)
  def flatten2([head | tail], acc) when is_list(head), do: flatten2(tail, flatten2(head, acc))
  def flatten2([head | tail], acc), do: flatten2(tail, [head | acc])
  def flatten2([], acc), do: acc

  def take(_enumerable, 0), do: []
  def take([head | tail], amount) do
    [head | take(tail, amount - 1)]
  end
end

ListFunctions.map([1, 2, 3, 4], &(&1 * &1))
IO.puts ListFunctions.reduce([1, 2, 3, 4], 0, &(&1 + &2))
IO.puts ListFunctions.mapsum([1, 2, 3, 4], &(&1 * &1))
IO.puts ListFunctions.max([1, 7, 3, 4])
IO.inspect ListFunctions.span(1, 7)
IO.inspect ListFunctions.all?([true, true, false, true])
IO.puts ListFunctions.each(["this", "is", "a", "test"], &(IO.puts &1))
IO.inspect ListFunctions.filter([true, false, true, false, true], &(&1))
IO.inspect ListFunctions.take([1, 2, 3, 4], 2)

nestedList = [[1], 2, [[3, 4], 5]]
{time, _} = :timer.tc fn -> ListFunctions.flatten(nestedList) end
IO.puts "flatten took #{time}"

{time, _} = :timer.tc fn -> ListFunctions.flatten2(nestedList) end
IO.puts "flatten2 took #{time}"

IO.inspect ListFunctions.flatten(nestedList)
IO.inspect ListFunctions.flatten2(nestedList)
