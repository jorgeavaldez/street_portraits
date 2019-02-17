defmodule StreetPortraits.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias StreetPortraits.Accounts.AccountType

  schema "users" do
    field :email, :string
    field :name, :string
    field :phash, :string
    field :password, :string, virtual: true
    field :access_key, :string, virtual: true

    belongs_to :account_type, AccountType

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> put_change(:phash, hash_password(attrs["password"]))
  end

  defp hash_password(nil), do: ""
  defp hash_password(password), do: Comeonin.Pbkdf2.hashpwsalt(password)
end
