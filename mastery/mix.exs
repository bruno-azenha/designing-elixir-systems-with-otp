defmodule Mastery.MixProject do
  use Mix.Project

  def project do
    [
      app: :mastery,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Mastery.Application, []}
    ]
  end

  defp deps do
    [
      {:mastery_persistence, path: "../mastery_persistence"}
    ]
  end
end
