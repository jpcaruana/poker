# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

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
