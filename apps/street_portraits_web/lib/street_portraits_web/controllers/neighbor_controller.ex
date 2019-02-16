defmodule StreetPortraitsWeb.NeighborController do
  use StreetPortraitsWeb, :controller

  alias StreetPortraits.SP
  alias StreetPortraits.SP.Neighbor

  def index(conn, _params) do
    neighbors = SP.list_neighbors()
    render(conn, "index.html", neighbors: neighbors)
  end

  def new(conn, _params) do
    changeset = SP.change_neighbor(%Neighbor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"neighbor" => neighbor_params}) do
    case SP.create_neighbor(neighbor_params) do
      {:ok, neighbor} ->
        conn
        |> put_flash(:info, "Neighbor created successfully.")
        |> redirect(to: Routes.neighbor_path(conn, :show, neighbor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    neighbor = SP.get_neighbor!(id)
    render(conn, "show.html", neighbor: neighbor)
  end

  def edit(conn, %{"id" => id}) do
    neighbor = SP.get_neighbor!(id)
    changeset = SP.change_neighbor(neighbor)
    render(conn, "edit.html", neighbor: neighbor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "neighbor" => neighbor_params}) do
    neighbor = SP.get_neighbor!(id)

    case SP.update_neighbor(neighbor, neighbor_params) do
      {:ok, neighbor} ->
        conn
        |> put_flash(:info, "Neighbor updated successfully.")
        |> redirect(to: Routes.neighbor_path(conn, :show, neighbor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", neighbor: neighbor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    neighbor = SP.get_neighbor!(id)
    {:ok, _neighbor} = SP.delete_neighbor(neighbor)

    conn
    |> put_flash(:info, "Neighbor deleted successfully.")
    |> redirect(to: Routes.neighbor_path(conn, :index))
  end
end
