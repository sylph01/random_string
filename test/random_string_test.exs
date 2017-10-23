defmodule RandomStringTest do
  use ExUnit.Case, async: true
  doctest RandomString

  @misleading_chars '01258' ++ 'ijlouv' ++ 'BIOSUVZ'

  test "take/1 works" do
    assert(String.length(RandomString.take(20))   == 20)
    assert(String.length(RandomString.take(1000)) == 1000)
  end

  test "take/2 (with character classes) works" do
    assert(String.length(RandomString.take(20, :numeric))         == 20)
    assert(String.length(RandomString.take(20, :uppercase))       == 20)
    assert(String.length(RandomString.take(20, :lowercase))       == 20)
    assert(String.length(RandomString.take(20, :alphabetical))    == 20)
    assert(String.length(RandomString.take(20, :alphanumeric))    == 20)
    assert(String.length(RandomString.take(20, :printable_chars)) == 20)
  end

  @tag :heavy_looping_tests
  test "take_without_misleading_characters/1 do not include misleading characters" do
    String.codepoints(RandomString.take_without_misleading_characters(5000)) # sufficiently large number
    |> Enum.each(fn ch ->
      assert(!(ch in @misleading_chars))
    end)
  end

  @tag :heavy_looping_tests
  test "character class alphabetical actually takes alphabets only" do
    String.codepoints(RandomString.take(1000, :alphabetical)) # sufficiently large number
    |> Enum.each(fn ch ->
      <<cp::utf8>> = ch
      assert(cp in Enum.to_list(65..90) || cp in Enum.to_list(97..122))
    end)
  end

  @tag :heavy_looping_tests
  test "character class alphanumeric actually takes alphabets and numbers only" do
    String.codepoints(RandomString.take(1000, :alphanumeric)) # sufficiently large number
    |> Enum.each(fn ch ->
      <<cp::utf8>> = ch
      assert(cp in Enum.to_list(48..57) || cp in Enum.to_list(65..90) || cp in Enum.to_list(97..122))
    end)
  end

  @tag :probabilistic
  test "character class alphabetical generates over all alphabets with sufficiently large length" do
    l = RandomString.take(10000, :alphabetical) |> String.codepoints |> Enum.uniq
    assert(length(l) == 26 * 2)
  end

  @tag :probabilistic
  test "character class alphanumeric generates over all alphabets and numbers with sufficiently large length" do
    l = RandomString.take(10000, :alphanumeric) |> String.codepoints |> Enum.uniq
    assert(length(l) == (26 * 2 + 10))
  end
end
