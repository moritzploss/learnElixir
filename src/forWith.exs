defmodule ForWith do
  def square do
    for n <- 1..5, do: n * n
  end

  def squareThenCube do
    with [_|_] = squares <- square(),
         %{} = cubes <- (for n <- 1..5, into: %{}, do: {n, n * n * n}),
         %MapSet{} = asMapSet <- (
           for {key, val} <- cubes,
           into: MapSet.new(),
           do: {key, val}
          )
    do
      IO.inspect squares
      IO.inspect cubes
      IO.inspect asMapSet
    else
      _error -> IO.inspect "didn't match anything"
    end
  end

end


IO.inspect ForWith.square()
ForWith.squareThenCube()
