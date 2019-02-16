# Since configuration is shared in umbrella projects, this file
# should only configure the :street_portraits_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :street_portraits_web,
  ecto_repos: [StreetPortraits.Repo],
  generators: [context_app: :street_portraits]

# Configures the endpoint
config :street_portraits_web, StreetPortraitsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FhUAj+L2QumJz11iYLmQJDjAePVnmHcINpPOW8zIl4Nbk3PpZ1TZbnt7KB0xFxut",
  render_errors: [view: StreetPortraitsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StreetPortraitsWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
