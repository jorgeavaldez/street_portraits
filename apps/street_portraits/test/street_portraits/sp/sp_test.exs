defmodule StreetPortraits.SPTest do
  use StreetPortraits.DataCase

  alias StreetPortraits.SP

  describe "neighbors" do
    alias StreetPortraits.SP.Neighbor

    @valid_attrs %{address: "some address", approx_location: "some approx_location", name: "some name", phone: "some phone", preferred_channel: "some preferred_channel"}
    @update_attrs %{address: "some updated address", approx_location: "some updated approx_location", name: "some updated name", phone: "some updated phone", preferred_channel: "some updated preferred_channel"}
    @invalid_attrs %{address: nil, approx_location: nil, name: nil, phone: nil, preferred_channel: nil}

    def neighbor_fixture(attrs \\ %{}) do
      {:ok, neighbor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SP.create_neighbor()

      neighbor
    end

    test "list_neighbors/0 returns all neighbors" do
      neighbor = neighbor_fixture()
      assert SP.list_neighbors() == [neighbor]
    end

    test "get_neighbor!/1 returns the neighbor with given id" do
      neighbor = neighbor_fixture()
      assert SP.get_neighbor!(neighbor.id) == neighbor
    end

    test "create_neighbor/1 with valid data creates a neighbor" do
      assert {:ok, %Neighbor{} = neighbor} = SP.create_neighbor(@valid_attrs)
      assert neighbor.address == "some address"
      assert neighbor.approx_location == "some approx_location"
      assert neighbor.name == "some name"
      assert neighbor.phone == "some phone"
      assert neighbor.preferred_channel == "some preferred_channel"
    end

    test "create_neighbor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SP.create_neighbor(@invalid_attrs)
    end

    test "update_neighbor/2 with valid data updates the neighbor" do
      neighbor = neighbor_fixture()
      assert {:ok, %Neighbor{} = neighbor} = SP.update_neighbor(neighbor, @update_attrs)
      assert neighbor.address == "some updated address"
      assert neighbor.approx_location == "some updated approx_location"
      assert neighbor.name == "some updated name"
      assert neighbor.phone == "some updated phone"
      assert neighbor.preferred_channel == "some updated preferred_channel"
    end

    test "update_neighbor/2 with invalid data returns error changeset" do
      neighbor = neighbor_fixture()
      assert {:error, %Ecto.Changeset{}} = SP.update_neighbor(neighbor, @invalid_attrs)
      assert neighbor == SP.get_neighbor!(neighbor.id)
    end

    test "delete_neighbor/1 deletes the neighbor" do
      neighbor = neighbor_fixture()
      assert {:ok, %Neighbor{}} = SP.delete_neighbor(neighbor)
      assert_raise Ecto.NoResultsError, fn -> SP.get_neighbor!(neighbor.id) end
    end

    test "change_neighbor/1 returns a neighbor changeset" do
      neighbor = neighbor_fixture()
      assert %Ecto.Changeset{} = SP.change_neighbor(neighbor)
    end
  end

  describe "portraits" do
    alias StreetPortraits.SP.Portrait

    @valid_attrs %{body: "some body", url: "some url"}
    @update_attrs %{body: "some updated body", url: "some updated url"}
    @invalid_attrs %{body: nil, url: nil}

    def portrait_fixture(attrs \\ %{}) do
      {:ok, portrait} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SP.create_portrait()

      portrait
    end

    test "list_portraits/0 returns all portraits" do
      portrait = portrait_fixture()
      assert SP.list_portraits() == [portrait]
    end

    test "get_portrait!/1 returns the portrait with given id" do
      portrait = portrait_fixture()
      assert SP.get_portrait!(portrait.id) == portrait
    end

    test "create_portrait/1 with valid data creates a portrait" do
      assert {:ok, %Portrait{} = portrait} = SP.create_portrait(@valid_attrs)
      assert portrait.body == "some body"
      assert portrait.url == "some url"
    end

    test "create_portrait/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SP.create_portrait(@invalid_attrs)
    end

    test "update_portrait/2 with valid data updates the portrait" do
      portrait = portrait_fixture()
      assert {:ok, %Portrait{} = portrait} = SP.update_portrait(portrait, @update_attrs)
      assert portrait.body == "some updated body"
      assert portrait.url == "some updated url"
    end

    test "update_portrait/2 with invalid data returns error changeset" do
      portrait = portrait_fixture()
      assert {:error, %Ecto.Changeset{}} = SP.update_portrait(portrait, @invalid_attrs)
      assert portrait == SP.get_portrait!(portrait.id)
    end

    test "delete_portrait/1 deletes the portrait" do
      portrait = portrait_fixture()
      assert {:ok, %Portrait{}} = SP.delete_portrait(portrait)
      assert_raise Ecto.NoResultsError, fn -> SP.get_portrait!(portrait.id) end
    end

    test "change_portrait/1 returns a portrait changeset" do
      portrait = portrait_fixture()
      assert %Ecto.Changeset{} = SP.change_portrait(portrait)
    end
  end

  describe "outreach" do
    alias StreetPortraits.SP.Outreach

    @valid_attrs %{address: "some address", email: "some email", more: "some more", name: "some name", phone: "some phone", type: "some type"}
    @update_attrs %{address: "some updated address", email: "some updated email", more: "some updated more", name: "some updated name", phone: "some updated phone", type: "some updated type"}
    @invalid_attrs %{address: nil, email: nil, more: nil, name: nil, phone: nil, type: nil}

    def outreach_fixture(attrs \\ %{}) do
      {:ok, outreach} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SP.create_outreach()

      outreach
    end

    test "list_outreach/0 returns all outreach" do
      outreach = outreach_fixture()
      assert SP.list_outreach() == [outreach]
    end

    test "get_outreach!/1 returns the outreach with given id" do
      outreach = outreach_fixture()
      assert SP.get_outreach!(outreach.id) == outreach
    end

    test "create_outreach/1 with valid data creates a outreach" do
      assert {:ok, %Outreach{} = outreach} = SP.create_outreach(@valid_attrs)
      assert outreach.address == "some address"
      assert outreach.email == "some email"
      assert outreach.more == "some more"
      assert outreach.name == "some name"
      assert outreach.phone == "some phone"
      assert outreach.type == "some type"
    end

    test "create_outreach/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SP.create_outreach(@invalid_attrs)
    end

    test "update_outreach/2 with valid data updates the outreach" do
      outreach = outreach_fixture()
      assert {:ok, %Outreach{} = outreach} = SP.update_outreach(outreach, @update_attrs)
      assert outreach.address == "some updated address"
      assert outreach.email == "some updated email"
      assert outreach.more == "some updated more"
      assert outreach.name == "some updated name"
      assert outreach.phone == "some updated phone"
      assert outreach.type == "some updated type"
    end

    test "update_outreach/2 with invalid data returns error changeset" do
      outreach = outreach_fixture()
      assert {:error, %Ecto.Changeset{}} = SP.update_outreach(outreach, @invalid_attrs)
      assert outreach == SP.get_outreach!(outreach.id)
    end

    test "delete_outreach/1 deletes the outreach" do
      outreach = outreach_fixture()
      assert {:ok, %Outreach{}} = SP.delete_outreach(outreach)
      assert_raise Ecto.NoResultsError, fn -> SP.get_outreach!(outreach.id) end
    end

    test "change_outreach/1 returns a outreach changeset" do
      outreach = outreach_fixture()
      assert %Ecto.Changeset{} = SP.change_outreach(outreach)
    end
  end
end
