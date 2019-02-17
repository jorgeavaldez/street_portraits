defmodule StreetPortraits.Accounts.AccountType do
  use Ecto.Schema
  import Ecto.Changeset
  alias StreetPortraits.Accounts.User

  schema "account_types" do
    field :actions, {:array, :string}
    field :type, :string
    has_many :user, User

    timestamps()
  end

  @doc false
  def changeset(account_type, attrs) do
    account_type
    |> cast(attrs, [:type, :actions])
    |> validate_required([:type, :actions])
    |> unique_constraint(:type)
  end
end
