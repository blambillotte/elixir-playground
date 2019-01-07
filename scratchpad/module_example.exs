defmodule MyApp.Calc do # = :"Exlixir.Myapp.Calc"
  alias IO, as: DemoIO

  def plus(a, b) do
    a + b
  end

  # def plus(a,b), do: a +b

  def mult(a,b) do
    do_private_stuff()
    a * b
  end

  defp do_private_stuff do
    [1,2,3]
    |> length
    |> DemoIO.puts
  end
end