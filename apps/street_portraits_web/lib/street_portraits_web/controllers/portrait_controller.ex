defmodule StreetPortraitsWeb.PortraitController do
  use StreetPortraitsWeb, :controller

  alias StreetPortraits.SP
  alias StreetPortraits.SP.Portrait

  alias StreetPortraits.Repo

  def index(conn, _params) do
    portraits = SP.list_portraits()
    render(conn, "index.html", portraits: portraits)
  end

  def new(conn, _params) do
    changeset = SP.change_portrait(%Portrait{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"portrait" => portrait_params}) do
    case SP.create_portrait(portrait_params) do
      {:ok, portrait} ->
        conn
        |> put_flash(:info, "Portrait created successfully.")
        |> redirect(to: Routes.portrait_path(conn, :show, portrait))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    portrait = SP.get_portrait!(id) |> Repo.preload(:neighbor)

    render(conn, "show.html", portrait: portrait)
  end

  def edit(conn, %{"id" => id}) do
    portrait = SP.get_portrait!(id)
    changeset = SP.change_portrait(portrait)
    render(conn, "edit.html", portrait: portrait, changeset: changeset)
  end

  def update(conn, %{"id" => id, "portrait" => portrait_params}) do
    portrait = SP.get_portrait!(id)

    case SP.update_portrait(portrait, portrait_params) do
      {:ok, portrait} ->
        conn
        |> put_flash(:info, "Portrait updated successfully.")
        |> redirect(to: Routes.portrait_path(conn, :show, portrait))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", portrait: portrait, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    portrait = SP.get_portrait!(id)
    {:ok, _portrait} = SP.delete_portrait(portrait)

    conn
    |> put_flash(:info, "Portrait deleted successfully.")
    |> redirect(to: Routes.portrait_path(conn, :index))
  end
end
