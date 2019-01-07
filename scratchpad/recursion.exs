defmodule ListUtils do

  def max([ current_maximum | [ head | tail]]) when current_maximum < head do
    max [head | tail]
  end

  def max([ current_maximum | [ head | tail]]) when current_maximum >= head do
    max [current_maximum | tail]
  end

  def max([current_maximum]), do: current_maximum # found max

  def map([], _fn), do: []
  def map([head | tail], fun) do
    [ fun.(head) | map(tail, fun) ]
  end

  def mult([]), do: 1

  def mult([head | tail]) do
    head * mult(tail)
  end
end

ListUtils.mult([1,2,3])
  |> IO.puts

ListUtils.map([2,3,4], fn(a) -> (a * 3) end)
  |> IO.inspect

ListUtils.max([2,3,50, 30, 15, 20])
  |> IO.inspect