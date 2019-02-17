defmodule StreetPortraits.Repo.Migrations.CreateOutreach do
  use Ecto.Migration

  def change do
    create table(:outreach) do
      add :type, :string
      add :name, :string
      add :email, :string
      add :phone, :string
      add :address, :string
      add :more, :string
      add :neighbor, references(:neighbors, on_delete: :nothing)

      timestamps()
    end

    create index(:outreach, [:neighbor])
  end
end
