defmodule StreetPortraits.Repo.Migrations.CreateNeighbors do
  use Ecto.Migration

  def change do
    create table(:neighbors) do
      add :name, :string
      add :approx_location, :string
      add :phone, :string
      add :address, :string
      add :preferred_channel, :string

      timestamps()
    end

  end
end
