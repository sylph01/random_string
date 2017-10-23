defmodule RandomString do
  @simple_classes %{
    # {base, number_of_chars}
    numeric:         {?0, 10},
    uppercase:       {?A, 26},
    lowercase:       {?a, 26},
    printable_chars: {?!, 94}
  }

  @misleading_chars '01258' ++ 'ijlouv' ++ 'BIOSUVZ'

  # public APIs
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


  # definition of streams
  def stream(character_class) when character_class in [:numeric, :uppercase, :lowercase, :printable_chars] do
    {base, number_of_chars} = @simple_classes[character_class]
    # :rand.uniform returns 1 <= X <= N
    Stream.repeatedly(fn -> base + :rand.uniform(number_of_chars) - 1 end)
  end

  def stream(:alphabetical) do
    Stream.repeatedly(fn ->
      number_of_chars = 26 * 2
      offset = :rand.uniform(number_of_chars)
      if offset > 26 do
        ?a + offset - 27
      else
        ?A + offset - 1
      end
    end)
  end

  def stream(:alphanumeric) do
    Stream.repeatedly(fn ->
      number_of_chars = 26 * 2 + 10
      offset = :rand.uniform(number_of_chars)
      cond do
        offset > 10 + 26 -> ?a + offset - 37
        offset > 10      -> ?A + offset - 11
        true             -> ?0 + offset - 1
      end
    end)
  end

  def stream_without_misleading_characters do
    stream(:alphanumeric) |> Stream.reject(fn x -> Enum.member?(@misleading_chars, x) end)
  end

  def stream_without_characters(character_list) when is_list(character_list) do
    stream(:alphanumeric) |> Stream.reject(fn x -> Enum.member?(character_list, x) end)
  end
end
