# RandomString

An utility to generate random strings of desired character sets.

## Usage

```
iex(1)> RandomString.stream(:alphanumeric)
#Function<29.52512309/2 in Stream.repeatedly/1>
iex(2)> RandomString.stream(:alphanumeric) |> Enum.take(20)
'bs6fTl4pdkIMrJiNcaAi'
iex(3)> RandomString.stream(:alphanumeric) |> Enum.take(20)
'dYTDj9ULMC3zzUPyBBCD'
iex(4)> RandomString.take(:alphanumeric, 20)
'9ilYp23xkSsYxEYlpnEQ'
iex(5)> RandomString.take(:alphanumeric, 20)
'lA6ynZcBl5P751QTvkMF'
```

Available character classes are: `:alphabetical`, `:alphanumeric`, `:numeric`, `:lowercase`, `:uppercase`.

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
