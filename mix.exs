defmodule Journal.MixProject do
  use Mix.Project

  def project do
    [
      app: :journal,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto_sql, "> 3.0.0"},
      {:ecto, "> 3.0.0"},
      {:postgrex, ">= 0.0.0", only: [:test]},
      {:jason, "~> 1.1", only: [:test]},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  def elixirc_paths(:test), do: ["lib", "test/support"]
  def elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      # Ensures database is reset before tests are run
      test: ["ecto.drop", "ecto.create --quiet", "ecto.load", "ecto.migrate", "test"]
    ]
  end
end