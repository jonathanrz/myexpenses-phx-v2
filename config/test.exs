use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :myexpenses_phx_v2, MyexpensesPhxV2Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :myexpenses_phx_v2, MyexpensesPhxV2.Repo,
  username: System.get_env("MYEXPENSES_PHX_V2_PG_USER"),
  password: System.get_env("MYEXPENSES_PHX_V2_PG_PASSWORD"),
  database: System.get_env("MYEXPENSES_PHX_V2_PG_TEST_DB"),
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
