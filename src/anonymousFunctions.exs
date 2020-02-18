add = fn a, b -> a + b end
IO.puts add.(1, 2)

subtract = fn a, b -> a - b end
IO.puts subtract.(1, 2)

list_concat = fn [a, b], [c, d] -> [a, b, c, d] end
IO.inspect list_concat.([:a, :b], [:c, :d])

pair_tuple_to_list = fn { a, b } -> [a, b] end
IO.inspect pair_tuple_to_list.( { 1234, 5678 } )

prefix = fn pre -> (fn fix -> pre <> " " <> fix end) end
IO.puts prefix.("first").("second")
