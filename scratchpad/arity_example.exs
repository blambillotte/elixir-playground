defmodule Calc do
  
  def factorial(0), do: 1
  
  def factorial(a) when is_integer(a) and a > 0 do
    a * factorial(a - 1)
  end

  def factorial(_) do
    {:error, :invalid_argument}
  end
  
  # use pattern matching to catch specific scenerios
  # note that Elixir runs top to bottom so the placement is important
  def divide(_a, 0) do
    {:error, :zero_division}
  end
  
  def divide(a, b) do
    a / b
  end
  
  def add(a) do
    add a, 0
  end

  def add(a, b) do
    a + b
  end

  # Same as above
  # def add(a, b \\ 0)
  #   a + b
  # end
end