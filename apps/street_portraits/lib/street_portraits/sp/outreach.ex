defmodule StreetPortraits.SP.Outreach do
  use Ecto.Schema
  import Ecto.Changeset


  schema "outreach" do
    field :address, :string
    field :email, :string
    field :more, :string
    field :name, :string
    field :phone, :string
    field :type, :string
    field :neighbor, :id

    timestamps()
  end

  @doc false
  def changeset(outreach, attrs) do
    outreach
    |> cast(attrs, [:type, :name, :email, :phone, :address, :more])
    |> validate_required([:type, :name, :email, :phone, :address, :more])
  end
end
