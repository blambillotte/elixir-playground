defmodule Demo do

  def run(str) do
    len = String.length(str)
    cond do
      len > 0 && len < 5 -> "short"
      len >= 5 && len < 10 -> "medium"
      len > 10 -> "long"
      true -> "N/A"
    end
  end

  def run2(argv) do
    parsed_args = OptionParser.parse(argv, switches: [debug: :boolean])
    case Keyword.fetch(elem(parsed_args, 0), :debug) do
      {:ok, true} -> "Debug"
      {:ok, false} -> "No debug"
      _ -> "Debug option not set"
    end
  end

end

Demo.run("Hi There")
  |> IO.inspect

Demo.run2(System.argv)
  |> IO.inspect