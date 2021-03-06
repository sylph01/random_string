defmodule RandomString.Mixfile do
  use Mix.Project

  def project do
    [app: :random_string,
     version: "0.3.0",
     elixir: "~> 1.2",
     description: description(),
     package: package(),
     deps: deps(),

     # Docs
     name: "RandomString",
     source_url: "https://github.com/sylph01/random_string"
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.18.1", only: :dev, runtime: false}]
  end

  defp description do
    """
    Generates random string (or a stream of characters) of desired character sets.
    """
  end

  defp package do
    [
      files: ["lib", "test", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["sylph01"],
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/sylph01/random_string"}
    ]
  end
end
