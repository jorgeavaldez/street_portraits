defmodule StreetPortraitsWeb.PortraitControllerTest do
  use StreetPortraitsWeb.ConnCase

  alias StreetPortraits.SP

  @create_attrs %{body: "some body", url: "some url"}
  @update_attrs %{body: "some updated body", url: "some updated url"}
  @invalid_attrs %{body: nil, url: nil}

  def fixture(:portrait) do
    {:ok, portrait} = SP.create_portrait(@create_attrs)
    portrait
  end

  describe "index" do
    test "lists all portraits", %{conn: conn} do
      conn = get(conn, Routes.portrait_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Portraits"
    end
  end

  describe "new portrait" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.portrait_path(conn, :new))
      assert html_response(conn, 200) =~ "New Portrait"
    end
  end

  describe "create portrait" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.portrait_path(conn, :create), portrait: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.portrait_path(conn, :show, id)

      conn = get(conn, Routes.portrait_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Portrait"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.portrait_path(conn, :create), portrait: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Portrait"
    end
  end

  describe "edit portrait" do
    setup [:create_portrait]

    test "renders form for editing chosen portrait", %{conn: conn, portrait: portrait} do
      conn = get(conn, Routes.portrait_path(conn, :edit, portrait))
      assert html_response(conn, 200) =~ "Edit Portrait"
    end
  end

  describe "update portrait" do
    setup [:create_portrait]

    test "redirects when data is valid", %{conn: conn, portrait: portrait} do
      conn = put(conn, Routes.portrait_path(conn, :update, portrait), portrait: @update_attrs)
      assert redirected_to(conn) == Routes.portrait_path(conn, :show, portrait)

      conn = get(conn, Routes.portrait_path(conn, :show, portrait))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, portrait: portrait} do
      conn = put(conn, Routes.portrait_path(conn, :update, portrait), portrait: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Portrait"
    end
  end

  describe "delete portrait" do
    setup [:create_portrait]

    test "deletes chosen portrait", %{conn: conn, portrait: portrait} do
      conn = delete(conn, Routes.portrait_path(conn, :delete, portrait))
      assert redirected_to(conn) == Routes.portrait_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.portrait_path(conn, :show, portrait))
      end
    end
  end

  defp create_portrait(_) do
    portrait = fixture(:portrait)
    {:ok, portrait: portrait}
  end
end
