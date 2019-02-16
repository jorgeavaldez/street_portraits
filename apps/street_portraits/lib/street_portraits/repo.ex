defmodule StreetPortraits.Repo do
  use Ecto.Repo,
    otp_app: :street_portraits,
    adapter: Ecto.Adapters.Postgres
end
