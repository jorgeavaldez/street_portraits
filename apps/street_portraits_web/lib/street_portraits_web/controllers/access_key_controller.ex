defmodule StreetPortraitsWeb.AccessKeyController do
  use StreetPortraitsWeb, :controller

  alias StreetPortraits.Accounts
  alias StreetPortraits.Accounts.AccessKey

  def index(conn, _params) do
    access_keys = Accounts.list_access_keys()
    render(conn, "index.html", access_keys: access_keys)
  end

  def new(conn, _params) do
    account_types = Accounts.list_account_types()
    changeset = Accounts.change_access_key(%AccessKey{})
    render(conn, "new.html", changeset: changeset, account_types: account_types)
  end

  def create(conn, %{"access_key" => access_key_params}) do
    { account_type_id, _ } = access_key_params["type"] |> Integer.parse

    key = UUID.uuid4()
    access_key_params = Map.put(access_key_params, "access_key", key)

    case Accounts.create_access_key(access_key_params, account_type_id) do
      {:ok, access_key} ->
        conn
        |> put_flash(:info, "Access key created successfully.")
        |> redirect(to: Routes.access_key_path(conn, :show, access_key))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    access_key = Accounts.get_access_key!(id)
    render(conn, "show.html", access_key: access_key)
  end

  def edit(conn, %{"id" => id}) do
    access_key = Accounts.get_access_key!(id)
    changeset = Accounts.change_access_key(access_key)
    render(conn, "edit.html", access_key: access_key, changeset: changeset)
  end

  def update(conn, %{"id" => id, "access_key" => access_key_params}) do
    access_key = Accounts.get_access_key!(id)

    case Accounts.update_access_key(access_key, access_key_params) do
      {:ok, access_key} ->
        conn
        |> put_flash(:info, "Access key updated successfully.")
        |> redirect(to: Routes.access_key_path(conn, :show, access_key))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", access_key: access_key, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    access_key = Accounts.get_access_key!(id)
    {:ok, _access_key} = Accounts.delete_access_key(access_key)

    conn
    |> put_flash(:info, "Access key deleted successfully.")
    |> redirect(to: Routes.access_key_path(conn, :index))
  end
end
