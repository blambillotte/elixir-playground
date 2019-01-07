mad_printer = fn(initial_string) ->
  initial_string
    |> String.reverse
    |> IO.puts
end

capture_mad_printer = &(
  &1
    |> String.reverse
    |> IO.puts
)

mad_printer.("hello there friend")
IO.puts("----")
Enum.each ["hello", "there", "friend"], mad_printer
IO.puts("----")
Enum.each ["hello", "there", "friend"], &IO.puts/1
IO.puts("----")
Enum.each ["hello", "there", "friend"], capture_mad_printer

