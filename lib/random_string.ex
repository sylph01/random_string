defmodule RandomString do
  def take(character_class, n) when is_integer(n) do
    stream(character_class) |> Enum.take(n)
  end

  def stream(character_classes) when is_list(character_classes) do
    list = Enum.reduce(character_classes, [], fn (x, acc) -> acc ++ character_sets[x] end)
    Stream.repeatedly(fn -> :lists.nth(:random.uniform(length(list)), list) end)
  end

  def stream(character_class) when is_atom(character_class) do
    stream([character_class])
  end

  defp character_sets do
    basic_sets = %{
      numeric:    (Enum.to_list 48..57),
      uppercase:  (Enum.to_list 65..90),
      lowercase:  (Enum.to_list 97..122)
    }

    compound_sets = %{
      alphabetical: basic_sets[:uppercase] ++ basic_sets[:lowercase],
      alphanumeric: basic_sets[:uppercase] ++ basic_sets[:lowercase] ++ basic_sets[:numeric]
    }

    Map.merge(basic_sets, compound_sets)
  end
end
