defmodule ExAgent.Mixfile do
  use Mix.Project

  def project do
    [ app:        :ex_agent,
      name:       "ExAgent",
      source_url: "https://github.com/elixytics/ex_agent",
      version:    "0.0.4",
      elixir:     "~> 0.14.0",
      deps:       deps(Mix.env),
      deps_path:  "_deps",
      docs:       &docs/0 ]
  end

  def application do
    [ applications: [ :yamerl ] ]
  end

  defp deps(:docs) do
    deps(:prod) ++
      [ { :ex_doc, github: "elixir-lang/ex_doc", tag: "4a6391bf2d6dacec8c6b52ef2506fb5607eb894c" } ]
  end

  defp deps(_) do
    [ { :yamerl, github: "yakaz/yamerl" } ]
  end

  defp docs do
    [ readme:     true,
      main:       "README",
      source_ref: System.cmd("git rev-parse --verify --quiet HEAD") ]
  end
end
