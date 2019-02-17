defmodule StreetPortraits.SP do
  @moduledoc """
  The SP context.
  """

  import Ecto.Query, warn: false
  alias StreetPortraits.Repo

  alias StreetPortraits.SP.Neighbor

  @doc """
  Returns the list of neighbors.

  ## Examples

      iex> list_neighbors()
      [%Neighbor{}, ...]

  """
  def list_neighbors do
    Repo.all(Neighbor)
  end

  @doc """
  Gets a single neighbor.

  Raises `Ecto.NoResultsError` if the Neighbor does not exist.

  ## Examples

      iex> get_neighbor!(123)
      %Neighbor{}

      iex> get_neighbor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_neighbor!(id), do: Repo.get!(Neighbor, id)

  @doc """
  Creates a neighbor.

  ## Examples

      iex> create_neighbor(%{field: value})
      {:ok, %Neighbor{}}

      iex> create_neighbor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_neighbor(attrs \\ %{}) do
    %Neighbor{}
    |> Neighbor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a neighbor.

  ## Examples

      iex> update_neighbor(neighbor, %{field: new_value})
      {:ok, %Neighbor{}}

      iex> update_neighbor(neighbor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_neighbor(%Neighbor{} = neighbor, attrs) do
    neighbor
    |> Neighbor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Neighbor.

  ## Examples

      iex> delete_neighbor(neighbor)
      {:ok, %Neighbor{}}

      iex> delete_neighbor(neighbor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_neighbor(%Neighbor{} = neighbor) do
    Repo.delete(neighbor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking neighbor changes.

  ## Examples

      iex> change_neighbor(neighbor)
      %Ecto.Changeset{source: %Neighbor{}}

  """
  def change_neighbor(%Neighbor{} = neighbor) do
    Neighbor.changeset(neighbor, %{})
  end

  alias StreetPortraits.SP.Portrait

  @doc """
  Returns the list of portraits.

  ## Examples

      iex> list_portraits()
      [%Portrait{}, ...]

  """
  def list_portraits do
    Repo.all(Portrait) |> Repo.preload(:neighbor)
  end

  @doc """
  Gets a single portrait.

  Raises `Ecto.NoResultsError` if the Portrait does not exist.

  ## Examples

      iex> get_portrait!(123)
      %Portrait{}

      iex> get_portrait!(456)
      ** (Ecto.NoResultsError)

  """
  def get_portrait!(id), do: Repo.get!(Portrait, id)

  @doc """
  Creates a portrait.

  ## Examples

      iex> create_portrait(%{field: value})
      {:ok, %Portrait{}}

      iex> create_portrait(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_portrait(attrs \\ %{}) do
    %Portrait{}
    |> Portrait.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a portrait.

  ## Examples

      iex> update_portrait(portrait, %{field: new_value})
      {:ok, %Portrait{}}

      iex> update_portrait(portrait, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_portrait(%Portrait{} = portrait, attrs) do
    portrait
    |> Portrait.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Portrait.

  ## Examples

      iex> delete_portrait(portrait)
      {:ok, %Portrait{}}

      iex> delete_portrait(portrait)
      {:error, %Ecto.Changeset{}}

  """
  def delete_portrait(%Portrait{} = portrait) do
    Repo.delete(portrait)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking portrait changes.

  ## Examples

      iex> change_portrait(portrait)
      %Ecto.Changeset{source: %Portrait{}}

  """
  def change_portrait(%Portrait{} = portrait) do
    Portrait.changeset(portrait, %{})
  end

  alias StreetPortraits.SP.Outreach

  @doc """
  Returns the list of outreach.

  ## Examples

      iex> list_outreach()
      [%Outreach{}, ...]

  """
  def list_outreach do
    Repo.all(Outreach)
  end

  @doc """
  Gets a single outreach.

  Raises `Ecto.NoResultsError` if the Outreach does not exist.

  ## Examples

      iex> get_outreach!(123)
      %Outreach{}

      iex> get_outreach!(456)
      ** (Ecto.NoResultsError)

  """
  def get_outreach!(id), do: Repo.get!(Outreach, id)

  @doc """
  Creates a outreach.

  ## Examples

      iex> create_outreach(%{field: value})
      {:ok, %Outreach{}}

      iex> create_outreach(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_outreach(attrs \\ %{}) do
    %Outreach{}
    |> Outreach.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a outreach.

  ## Examples

      iex> update_outreach(outreach, %{field: new_value})
      {:ok, %Outreach{}}

      iex> update_outreach(outreach, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_outreach(%Outreach{} = outreach, attrs) do
    outreach
    |> Outreach.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Outreach.

  ## Examples

      iex> delete_outreach(outreach)
      {:ok, %Outreach{}}

      iex> delete_outreach(outreach)
      {:error, %Ecto.Changeset{}}

  """
  def delete_outreach(%Outreach{} = outreach) do
    Repo.delete(outreach)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking outreach changes.

  ## Examples

      iex> change_outreach(outreach)
      %Ecto.Changeset{source: %Outreach{}}

  """
  def change_outreach(%Outreach{} = outreach) do
    Outreach.changeset(outreach, %{})
  end
end
