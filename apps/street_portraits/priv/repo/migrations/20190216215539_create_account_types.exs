defmodule StreetPortraits.Repo.Migrations.CreateAccountTypes do
  use Ecto.Migration

  def change do
    create table(:account_types) do
      add :type, :string
      add :actions, {:array, :string}

      timestamps()
    end

    create unique_index(:account_types, [:type])
  end
end
