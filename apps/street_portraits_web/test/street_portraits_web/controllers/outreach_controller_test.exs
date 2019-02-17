defmodule StreetPortraitsWeb.OutreachControllerTest do
  use StreetPortraitsWeb.ConnCase

  alias StreetPortraits.SP

  @create_attrs %{address: "some address", email: "some email", more: "some more", name: "some name", phone: "some phone", type: "some type"}
  @update_attrs %{address: "some updated address", email: "some updated email", more: "some updated more", name: "some updated name", phone: "some updated phone", type: "some updated type"}
  @invalid_attrs %{address: nil, email: nil, more: nil, name: nil, phone: nil, type: nil}

  def fixture(:outreach) do
    {:ok, outreach} = SP.create_outreach(@create_attrs)
    outreach
  end

  describe "index" do
    test "lists all outreach", %{conn: conn} do
      conn = get(conn, Routes.outreach_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Outreach"
    end
  end

  describe "new outreach" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.outreach_path(conn, :new))
      assert html_response(conn, 200) =~ "New Outreach"
    end
  end

  describe "create outreach" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.outreach_path(conn, :create), outreach: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.outreach_path(conn, :show, id)

      conn = get(conn, Routes.outreach_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Outreach"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.outreach_path(conn, :create), outreach: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Outreach"
    end
  end

  describe "edit outreach" do
    setup [:create_outreach]

    test "renders form for editing chosen outreach", %{conn: conn, outreach: outreach} do
      conn = get(conn, Routes.outreach_path(conn, :edit, outreach))
      assert html_response(conn, 200) =~ "Edit Outreach"
    end
  end

  describe "update outreach" do
    setup [:create_outreach]

    test "redirects when data is valid", %{conn: conn, outreach: outreach} do
      conn = put(conn, Routes.outreach_path(conn, :update, outreach), outreach: @update_attrs)
      assert redirected_to(conn) == Routes.outreach_path(conn, :show, outreach)

      conn = get(conn, Routes.outreach_path(conn, :show, outreach))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, outreach: outreach} do
      conn = put(conn, Routes.outreach_path(conn, :update, outreach), outreach: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Outreach"
    end
  end

  describe "delete outreach" do
    setup [:create_outreach]

    test "deletes chosen outreach", %{conn: conn, outreach: outreach} do
      conn = delete(conn, Routes.outreach_path(conn, :delete, outreach))
      assert redirected_to(conn) == Routes.outreach_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.outreach_path(conn, :show, outreach))
      end
    end
  end

  defp create_outreach(_) do
    outreach = fixture(:outreach)
    {:ok, outreach: outreach}
  end
end
