defmodule B2Client.Mixfile do
  use Mix.Project

  def project do
    [
      app: :b2_client,
      version: "0.0.3",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/keichan34/b2_client",
      docs: [
        extras: ["README.md"]
      ],
      package: package(),
      description: description(),
      dialyzer: [
        plt_file: ".local.plt",
        plt_add_apps: [
          :exfile,
          :httpoison,
          :jason
        ]
      ]
    ]
  end

  def application do
    [
      mod: {B2Client, []},
      applications: [
        :logger,
        :httpoison,
        :jason,
        :crypto
      ]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Keitaroh Kobayashi"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/keichan34/b2_client",
        "Docs" => "http://hexdocs.pm/b2_client/readme.html"
      }
    ]
  end

  defp description do
    """
    A Backblaze B2 library for Elixir
    """
  end

  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:jason, "~> 1.1"},
      {:exvcr, "~> 0.10.1", only: :test},
      {:earmark, "~> 1.2.5", only: :dev},
      {:ex_doc, "~> 0.18.3", only: :dev}
    ]
  end
end
