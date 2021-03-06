defmodule Mix.Tasks.UaInspector.Download.Databases do
  @moduledoc """
  Fetches parser databases from the
  [matomo-org/device-detector](https://github.com/matomo-org/device-detector)
  project.

  The files will be stored inside your configured path.

  `mix ua_inspector.download.databases`
  """

  @shortdoc "Downloads UAInspector parser databases"

  alias Mix.UAInspector.Download
  alias UAInspector.Config
  alias UAInspector.Downloader

  use Mix.Task

  def run(args) do
    Mix.shell().info("UAInspector Parser Database Download")

    :ok = Config.init_env()

    case Config.database_path() do
      nil -> Download.exit_unconfigured()
      _ -> args |> Download.request_confirmation() |> run_confirmed()
    end
  end

  defp run_confirmed(false) do
    Mix.shell().info("Download aborted!")

    :ok
  end

  defp run_confirmed(true) do
    :ok = Downloader.download(:databases)

    Mix.shell().info("Download complete!")

    :ok
  end
end
