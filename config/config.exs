use Mix.Config

if Mix.env() == :bench do
  config :ua_inspector, database_path: Path.expand("../data", __DIR__)
end

if Mix.env() == :test do
  config :ua_inspector,
    database_path: Path.expand("../test/fixtures", __DIR__),
    ets_cleanup_delay: 10,
    pool: [max_overflow: 0, size: 1]
end
