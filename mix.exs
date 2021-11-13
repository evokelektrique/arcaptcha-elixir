defmodule Arcaptcha.MixProject do
  use Mix.Project

  def project do
    [
      app: :arcaptcha,
      version: "1.0.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Arcaptcha",
      source_url: "https://github.com/evokelektrique/arcaptcha-elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"}
    ]
  end

  defp description() do
    "Validate and display captcha from Arcaptcha easily in Elixir"
  end

  defp package() do
    [
      licenses: ["AGPL-3.0-or-later"],
      links: %{"GitHub" => "https://github.com/evokelektrique/arcaptcha-elixir"}
    ]
  end
end
