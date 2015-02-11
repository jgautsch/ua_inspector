defmodule UAInspector.Parser.Os do
  @moduledoc """
  UAInspector operating system information parser.
  """

  use UAInspector.Parser

  def parse(_, []), do: :unknown

  def parse(ua, [ { _index, entry } | database ]) do
    if Regex.match?(entry.regex, ua) do
      parse_data(ua, entry)
    else
      parse(ua, database)
    end
  end

  defp parse_data(ua, entry) do
    captures = Regex.run(entry.regex, ua)

    %{
      name:    entry.name,
      version: Enum.at(captures, 1) || ""
    }
  end
end