# RandomString

[![Hex.pm](http://img.shields.io/hexpm/v/random_string.svg)](https://hex.pm/packages/random_string)
[![Hex.pm](http://img.shields.io/hexpm/dt/random_string.svg)](https://hex.pm/packages/random_string)

An utility to generate random strings of desired character sets.

## Usage

```
iex(1)> RandomString.stream(:alphanumeric) |> Enum.take(20) |> List.to_string
"1lUcpveolhieVEi62Xqj"
iex(2)> RandomString.stream(:alphanumeric) |> Enum.take(20) |> List.to_string
"UdnzLywLcCo1ilY33JHA"
iex(3)> RandomString.stream(:numeric) |> Enum.take(20) |> List.to_string
"95053150066394237243"
iex(4)> RandomString.take(20, :alphanumeric)
"6qwaPvrBDWtBQEhlcMhc"
iex(5)> RandomString.take(20, :alphanumeric)
"nQSvf2507h1McQEiQrWF"
iex(6)> RandomString.take_without_misleading_characters(20)
"FQ9snpbQFt7cHymWcQMn"
iex(7)> RandomString.take_without_misleading_characters(20)
"7WDGwmFeemfJkghqtRww"
iex(8)> RandomString.take_without_characters(20, 'abcdefg')
"TQrGCOkLlz1Yu0LUw50i"
iex(9)> RandomString.take_without_characters(20, 'abcdefg')
"3hqW8qKXi9pJY8yxDTjU"
iex(10)> RandomString.take_without_characters(20, 'abcdefg')
"7w2q5S9G21yYsiOTGmyH"

# new in 0.2.0
iex(11)> RandomString.take(20, :printable_chars)
"yXrF?!GC*y,%tXd9rxjU"
```

- Available character classes are: `:alphabetical`, `:alphanumeric`, `:numeric`, `:lowercase`, `:uppercase`, `printable_chars`.
    - If character class is omitted (`RandomString.take/1`), it is defaulted to `:alphanumeric`.
- By default, `take_without_misleading_characters` filter out characters that has a similar look to another character: `01258ijlouvBIOSUVZ`.

## Update in 0.2.0: Removal of user-defined compound character sets

From 0.2.0, `RandomString.stream/1` does not accept arrays of character classes. This is due to performance tuning in basic character sets.
If any specific class is needed, please let me know by creating an issue.

## Testing

`mix test` runs tests without following tags:

- `heavy_looping_tests` : Tests that involve heavy looping.
- `probabilistic`: Tests that may fail with a very low probability.

These tests need to be turned on explicitly, but are usually not necessary except for development uses.

## Installation

random_string is [available in Hex](https://hex.pm/packages/random_string)!

  1. Add random_string to your list of dependencies in `mix.exs`:

        ```
        def deps do
          [{:random_string, "~> 0.2.5"}]
        end
        ```

  2. Ensure random_string is started before your application:

        ```
        def application do
          [applications: [:random_string]]
        end
        ```
