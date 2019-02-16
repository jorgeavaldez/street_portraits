# Since configuration is shared in umbrella projects, this file
# should only configure the :street_portraits application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :street_portraits,
  ecto_repos: [StreetPortraits.Repo]

import_config "#{Mix.env()}.exs"
