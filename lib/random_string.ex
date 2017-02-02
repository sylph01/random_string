defmodule RandomString do
  def take(n) when is_integer(n) do
    take(n, :alphanumeric)
  end

  def take(n, character_class) when is_integer(n) do
    stream(character_class) |> Enum.take(n) |> List.to_string
  end

  def take_without_misleading_characters(n) when is_integer(n) do
    stream_without_misleading_characters() |> Enum.take(n) |> List.to_string
  end

  def take_without_characters(n, character_list) when is_integer(n) and is_list(character_list) do
    stream_without_characters(character_list) |> Enum.take(n) |> List.to_string
  end

  def stream(character_classes) when is_list(character_classes) do
    list = Enum.reduce(character_classes, [], fn (x, acc) -> acc ++ character_sets()[x] end)
    Stream.repeatedly(fn -> :lists.nth(:rand.uniform(length(list)), list) end)
  end

  def stream(character_class) when is_atom(character_class) do
    stream([character_class])
  end

  def stream_without_misleading_characters do
    stream(:alphanumeric) |> Stream.filter(fn x -> !(Enum.member? misleading_chars(), x) end)
  end

  def stream_without_characters(character_list) when is_list(character_list) do
    stream(:alphanumeric) |> Stream.filter(fn x -> !(Enum.member? character_list, x) end)
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

  defp misleading_chars do
    '01258' ++ 'ijlouv' ++ 'BIOSUVZ'
  end
end
