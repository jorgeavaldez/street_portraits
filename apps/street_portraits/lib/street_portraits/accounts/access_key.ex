defmodule StreetPortraits.Accounts.AccessKey do
  use Ecto.Schema
  import Ecto.Changeset
  alias StreetPortraits.Accounts.AccountType

  schema "access_keys" do
    field :access_key, :string
    belongs_to :account_type, AccountType

    timestamps()
  end

  @doc false
  def changeset(access_key, attrs) do
    access_key
    |> cast(attrs, [:access_key])
    |> validate_required([:access_key])
  end
end
