defmodule StreetPortraits.Repo.Migrations.CreatePortraits do
  use Ecto.Migration

  def change do
    create table(:portraits) do
      add :url, :string
      add :body, :string
      add :neighbor_id, references(:neighbors, on_delete: :nothing)

      timestamps()
    end

    create index(:portraits, [:neighbor_id])
  end
end
