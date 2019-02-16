defmodule StreetPortraits.SP.Neighbor do
  use Ecto.Schema
  import Ecto.Changeset


  schema "neighbors" do
    field :address, :string
    field :approx_location, :string
    field :name, :string
    field :phone, :string
    field :preferred_channel, :string

    timestamps()
  end

  @doc false
  def changeset(neighbor, attrs) do
    neighbor
    |> cast(attrs, [:name, :approx_location, :phone, :address, :preferred_channel])
    |> validate_required([:name, :approx_location, :phone, :address, :preferred_channel])
  end
end
