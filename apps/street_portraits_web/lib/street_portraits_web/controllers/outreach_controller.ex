defmodule StreetPortraitsWeb.OutreachController do
  use StreetPortraitsWeb, :controller

  alias StreetPortraits.SP
  alias StreetPortraits.SP.Outreach

  def index(conn, _params) do
    outreach = SP.list_outreach()
    render(conn, "index.html", outreach: outreach)
  end

  def new(conn, %{"id" => neighbor_id, "name" => name}) do
    changeset = SP.change_outreach(%Outreach{id: neighbor_id})
    render(conn, "new.html", changeset: changeset, name: name)
  end

  def create(conn, %{"outreach" => outreach_params}) do
    case SP.create_outreach(outreach_params) do
      {:ok, outreach} ->
        conn
        |> put_flash(:info, "Outreach created successfully.")
        |> redirect(to: Routes.outreach_path(conn, :show, outreach))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    outreach = SP.get_outreach!(id)
    render(conn, "show.html", outreach: outreach)
  end

  def edit(conn, %{"id" => id}) do
    outreach = SP.get_outreach!(id)
    changeset = SP.change_outreach(outreach)
    render(conn, "edit.html", outreach: outreach, changeset: changeset)
  end

  def update(conn, %{"id" => id, "outreach" => outreach_params}) do
    outreach = SP.get_outreach!(id)

    case SP.update_outreach(outreach, outreach_params) do
      {:ok, outreach} ->
        conn
        |> put_flash(:info, "Outreach updated successfully.")
        |> redirect(to: Routes.outreach_path(conn, :show, outreach))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", outreach: outreach, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    outreach = SP.get_outreach!(id)
    {:ok, _outreach} = SP.delete_outreach(outreach)

    conn
    |> put_flash(:info, "Outreach deleted successfully.")
    |> redirect(to: Routes.outreach_path(conn, :index))
  end
end
