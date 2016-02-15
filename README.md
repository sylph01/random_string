# RandomString

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
```

- Available character classes are: `:alphabetical`, `:alphanumeric`, `:numeric`, `:lowercase`, `:uppercase`.
    - If character class is omitted (`RandomString.take/1`), it is defaulted to `:alphanumeric`.
- By default, `take_without_misleading_characters` filter out characters that has a similar look to another character: `01258ijlouvBIOSUVZ`.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add random_string to your list of dependencies in `mix.exs`:

        def deps do
          [{:random_string, "~> 0.0.1"}]
        end

  2. Ensure random_string is started before your application:

        def application do
          [applications: [:random_string]]
        end
