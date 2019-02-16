defmodule StreetPortraitsWeb.AccountTypeControllerTest do
  use StreetPortraitsWeb.ConnCase

  alias StreetPortraits.Accounts

  @create_attrs %{actions: [], type: "some type"}
  @update_attrs %{actions: [], type: "some updated type"}
  @invalid_attrs %{actions: nil, type: nil}

  def fixture(:account_type) do
    {:ok, account_type} = Accounts.create_account_type(@create_attrs)
    account_type
  end

  describe "index" do
    test "lists all account_types", %{conn: conn} do
      conn = get(conn, Routes.account_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Account types"
    end
  end

  describe "new account_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.account_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Account type"
    end
  end

  describe "create account_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.account_type_path(conn, :create), account_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.account_type_path(conn, :show, id)

      conn = get(conn, Routes.account_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Account type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.account_type_path(conn, :create), account_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Account type"
    end
  end

  describe "edit account_type" do
    setup [:create_account_type]

    test "renders form for editing chosen account_type", %{conn: conn, account_type: account_type} do
      conn = get(conn, Routes.account_type_path(conn, :edit, account_type))
      assert html_response(conn, 200) =~ "Edit Account type"
    end
  end

  describe "update account_type" do
    setup [:create_account_type]

    test "redirects when data is valid", %{conn: conn, account_type: account_type} do
      conn = put(conn, Routes.account_type_path(conn, :update, account_type), account_type: @update_attrs)
      assert redirected_to(conn) == Routes.account_type_path(conn, :show, account_type)

      conn = get(conn, Routes.account_type_path(conn, :show, account_type))
      assert html_response(conn, 200) =~ ""
    end

    test "renders errors when data is invalid", %{conn: conn, account_type: account_type} do
      conn = put(conn, Routes.account_type_path(conn, :update, account_type), account_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Account type"
    end
  end

  describe "delete account_type" do
    setup [:create_account_type]

    test "deletes chosen account_type", %{conn: conn, account_type: account_type} do
      conn = delete(conn, Routes.account_type_path(conn, :delete, account_type))
      assert redirected_to(conn) == Routes.account_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.account_type_path(conn, :show, account_type))
      end
    end
  end

  defp create_account_type(_) do
    account_type = fixture(:account_type)
    {:ok, account_type: account_type}
  end
end
