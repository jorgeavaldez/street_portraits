defmodule StreetPortraitsWeb.AccountTypeController do
  use StreetPortraitsWeb, :controller

  alias StreetPortraits.Accounts
  alias StreetPortraits.Accounts.AccountType

  def index(conn, _params) do
    account_types = Accounts.list_account_types()
    render(conn, "index.html", account_types: account_types)
  end

  def new(conn, _params) do
    changeset = Accounts.change_account_type(%AccountType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"account_type" => account_type_params}) do
    case Accounts.create_account_type(account_type_params) do
      {:ok, account_type} ->
        conn
        |> put_flash(:info, "Account type created successfully.")
        |> redirect(to: Routes.account_type_path(conn, :show, account_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    account_type = Accounts.get_account_type!(id)
    render(conn, "show.html", account_type: account_type)
  end

  def edit(conn, %{"id" => id}) do
    account_type = Accounts.get_account_type!(id)
    changeset = Accounts.change_account_type(account_type)
    render(conn, "edit.html", account_type: account_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "account_type" => account_type_params}) do
    account_type = Accounts.get_account_type!(id)

    case Accounts.update_account_type(account_type, account_type_params) do
      {:ok, account_type} ->
        conn
        |> put_flash(:info, "Account type updated successfully.")
        |> redirect(to: Routes.account_type_path(conn, :show, account_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", account_type: account_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    account_type = Accounts.get_account_type!(id)
    {:ok, _account_type} = Accounts.delete_account_type(account_type)

    conn
    |> put_flash(:info, "Account type deleted successfully.")
    |> redirect(to: Routes.account_type_path(conn, :index))
  end
end
