# Since configuration is shared in umbrella projects, this file
# should only configure the :street_portraits application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :street_portraits, StreetPortraits.Repo,
  username: "postgres",
  password: "postgres",
  database: "street_portraits_dev",
  hostname: "localhost",
  pool_size: 10
