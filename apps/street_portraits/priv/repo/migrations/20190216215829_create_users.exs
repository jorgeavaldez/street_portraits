defmodule StreetPortraits.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :phash, :string
      add :account_type_id, references(:account_types, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:users, [:email])
    create index(:users, [:account_type_id])
  end
end
