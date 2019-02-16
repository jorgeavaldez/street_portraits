defmodule StreetPortraits.Repo.Migrations.CreateAccessKeys do
  use Ecto.Migration

  def change do
    create table(:access_keys) do
      add :access_key, :string
      add :account_type_id, references(:account_types, on_delete: :nothing)

      timestamps()
    end

    create index(:access_keys, [:account_type_id])
  end
end
