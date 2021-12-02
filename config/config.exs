# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures the endpoint
config :poker, PokerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f7nbM/IM8Sd+3laJehKjxO5vH/yCTrppSpLh9IvDoo3sKbgQR7eB1Tkw3S8FYyQ/",
  render_errors: [view: PokerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Poker.PubSub,
  live_view: [signing_salt: "Ha/uNftY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :poker, PokerWeb.Gettext, default_locale: "en", locales: ~w(en ja)

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
