defmodule StreetPortraits.SP.Outreach do
  use Ecto.Schema
  import Ecto.Changeset


  schema "outreach" do
    field :body, :string
    field :url, :string
    field :neighbor, :id

    timestamps()
  end

  @doc false
  def changeset(outreach, attrs) do
    outreach
    |> cast(attrs, [:url, :body])
    |> validate_required([:url, :body])
  end
end
