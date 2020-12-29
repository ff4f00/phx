defmodule Phx.MixProject do
  use Mix.Project

  def project do
    [
      app: :phx,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Phx.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.7"},
      {:phoenix_live_view, "~> 0.15.0"},
      {:floki, ">= 0.27.0", only: :test},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:pow, "~> 1.0"},
      {:ueberauth_auth0, "~> 0.8.1"},
      {:absinthe, "~> 1.5"},
      {:google_api_firestore, "~> 0.20.2"},
      {:google_api_cloud_functions, "~> 0.27.0"},
      {:google_api_cloud_search, "~> 0.8.1"},
      {:google_api_video_intelligence, "~> 0.30.0"},
      {:google_api_redis, "~> 0.23.1"},
      {:google_api_o_auth2, "~> 0.13.0"},
      {:google_api_machine_learning, "~> 0.23.0"},
      {:google_api_firebase_ml, "~> 0.2.0"},
      {:membrane_core, "~> 0.6.1"},
      {:mux, "~> 1.9"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end
end
