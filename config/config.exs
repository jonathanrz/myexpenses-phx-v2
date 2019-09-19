# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :myexpenses_phx_v2,
  ecto_repos: [MyexpensesPhxV2.Repo]

# Configures the endpoint
config :myexpenses_phx_v2, MyexpensesPhxV2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4+90nOnewl9rcT/m9iuW3j4smVg4JspFTBvSOKEc2Oh9T2YFKNWmHfQDMKKWIr5e",
  render_errors: [view: MyexpensesPhxV2Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyexpensesPhxV2.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "emails profile plus.me"]}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
