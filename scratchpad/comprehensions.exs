defmodule Comp do

  require Integer

  def demo(list) do
    for el <- list, Integer.is_even(el), do: el *2
    # list |> Enum.map( &(&1 * 2) )
  end

  def format_data(data) do
    for {name, age} <- data, into: Map.new,
    do: {format_name(name), age}
    # %{name: age}
  end

  defp format_name(name) do
    name
      |> String.downcase
      |> String.to_atom
  end
end

data = %{"Joe" => 50, "Bill" => 25, "Alice" => 23}


Comp.demo(1..10)
  |> IO.inspect

Comp.format_data(data)
  |> IO.inspect