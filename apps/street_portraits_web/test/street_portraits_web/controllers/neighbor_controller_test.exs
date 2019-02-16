defmodule StreetPortraitsWeb.NeighborControllerTest do
  use StreetPortraitsWeb.ConnCase

  alias StreetPortraits.SP

  @create_attrs %{address: "some address", approx_location: "some approx_location", name: "some name", phone: "some phone", preferred_channel: "some preferred_channel"}
  @update_attrs %{address: "some updated address", approx_location: "some updated approx_location", name: "some updated name", phone: "some updated phone", preferred_channel: "some updated preferred_channel"}
  @invalid_attrs %{address: nil, approx_location: nil, name: nil, phone: nil, preferred_channel: nil}

  def fixture(:neighbor) do
    {:ok, neighbor} = SP.create_neighbor(@create_attrs)
    neighbor
  end

  describe "index" do
    test "lists all neighbors", %{conn: conn} do
      conn = get(conn, Routes.neighbor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Neighbors"
    end
  end

  describe "new neighbor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.neighbor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Neighbor"
    end
  end

  describe "create neighbor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.neighbor_path(conn, :create), neighbor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.neighbor_path(conn, :show, id)

      conn = get(conn, Routes.neighbor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Neighbor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.neighbor_path(conn, :create), neighbor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Neighbor"
    end
  end

  describe "edit neighbor" do
    setup [:create_neighbor]

    test "renders form for editing chosen neighbor", %{conn: conn, neighbor: neighbor} do
      conn = get(conn, Routes.neighbor_path(conn, :edit, neighbor))
      assert html_response(conn, 200) =~ "Edit Neighbor"
    end
  end

  describe "update neighbor" do
    setup [:create_neighbor]

    test "redirects when data is valid", %{conn: conn, neighbor: neighbor} do
      conn = put(conn, Routes.neighbor_path(conn, :update, neighbor), neighbor: @update_attrs)
      assert redirected_to(conn) == Routes.neighbor_path(conn, :show, neighbor)

      conn = get(conn, Routes.neighbor_path(conn, :show, neighbor))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, neighbor: neighbor} do
      conn = put(conn, Routes.neighbor_path(conn, :update, neighbor), neighbor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Neighbor"
    end
  end

  describe "delete neighbor" do
    setup [:create_neighbor]

    test "deletes chosen neighbor", %{conn: conn, neighbor: neighbor} do
      conn = delete(conn, Routes.neighbor_path(conn, :delete, neighbor))
      assert redirected_to(conn) == Routes.neighbor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.neighbor_path(conn, :show, neighbor))
      end
    end
  end

  defp create_neighbor(_) do
    neighbor = fixture(:neighbor)
    {:ok, neighbor: neighbor}
  end
end
