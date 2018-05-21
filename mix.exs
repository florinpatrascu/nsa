defmodule NSA.MixProject do
  use Mix.Project

  def project do
    [
      app: :naive_send_after,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        mix_test_watch: :test,
        "test.watch": :test
      ]
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
      {:mix_test_watch, "~> 0.6.0", only: [:test], runtime: false},
      {:benchee, "~> 0.13.1", only: :dev}
    ]
  end
end
