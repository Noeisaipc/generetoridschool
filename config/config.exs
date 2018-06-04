# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :upiicsagenerarcredencial,
  ecto_repos: [Upiicsagenerarcredencial.Repo]

# Configures the endpoint
config :upiicsagenerarcredencial, UpiicsagenerarcredencialWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OUd/Q2nSmvU0wHuRcmAcVhB38zWRHwecBc27Dm5wgmb0GcBew6T96weXRv3pwerK",
  render_errors: [view: UpiicsagenerarcredencialWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Upiicsagenerarcredencial.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :upiicsagenerarcredencial, UpiicsagenerarcredencialWeb.Mailer,
  adapter: Bamboo.MailgunAdapter,
  api_key: "94c15ada4b8a1ec7f9066593457bef7c-b6183ad4-5114f8ca",
  domain: "sandbox15989b023c894bdeadadc25edd1e91de.mailgun.org"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
