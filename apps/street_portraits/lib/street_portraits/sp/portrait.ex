defmodule StreetPortraits.SP.Portrait do
  use Ecto.Schema
  import Ecto.Changeset
  alias StreetPortraits.SP.Neighbor

  schema "portraits" do
    field :body, :string
    field :url, :string
    belongs_to :neighbor, Neighbor

    timestamps()
  end

  @doc false
  def changeset(portrait, attrs) do
    portrait
    |> cast(attrs, [:url, :body])
    |> validate_required([:url, :body])
  end
end
