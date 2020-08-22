defmodule TrafficCam.MixProject do
  use Mix.Project

  def project do
    [
      app: :traffic_cam,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TrafficCam.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tortoise, "~> 0.9.4"},
      {:poison, "~> 3.1"}
    ]
  end
end
