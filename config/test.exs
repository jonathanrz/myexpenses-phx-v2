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
  username: "postgres",
  password: "postgres",
  database: "myexpenses_phx_v2_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
