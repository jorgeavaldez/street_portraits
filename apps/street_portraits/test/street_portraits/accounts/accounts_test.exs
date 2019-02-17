defmodule StreetPortraits.AccountsTest do
  use StreetPortraits.DataCase

  alias StreetPortraits.Accounts

  describe "account_types" do
    alias StreetPortraits.Accounts.AccountType

    @valid_attrs %{actions: [], type: "some type"}
    @update_attrs %{actions: [], type: "some updated type"}
    @invalid_attrs %{actions: nil, type: nil}

    def account_type_fixture(attrs \\ %{}) do
      {:ok, account_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_account_type()

      account_type
    end

    test "list_account_types/0 returns all account_types" do
      account_type = account_type_fixture()
      assert Accounts.list_account_types() == [account_type]
    end

    test "get_account_type!/1 returns the account_type with given id" do
      account_type = account_type_fixture()
      assert Accounts.get_account_type!(account_type.id) == account_type
    end

    test "create_account_type/1 with valid data creates a account_type" do
      assert {:ok, %AccountType{} = account_type} = Accounts.create_account_type(@valid_attrs)
      assert account_type.actions == []
      assert account_type.type == "some type"
    end

    test "create_account_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account_type(@invalid_attrs)
    end

    test "update_account_type/2 with valid data updates the account_type" do
      account_type = account_type_fixture()
      assert {:ok, %AccountType{} = account_type} = Accounts.update_account_type(account_type, @update_attrs)
      assert account_type.actions == []
      assert account_type.type == "some updated type"
    end

    test "update_account_type/2 with invalid data returns error changeset" do
      account_type = account_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account_type(account_type, @invalid_attrs)
      assert account_type == Accounts.get_account_type!(account_type.id)
    end

    test "delete_account_type/1 deletes the account_type" do
      account_type = account_type_fixture()
      assert {:ok, %AccountType{}} = Accounts.delete_account_type(account_type)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account_type!(account_type.id) end
    end

    test "change_account_type/1 returns a account_type changeset" do
      account_type = account_type_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account_type(account_type)
    end
  end

  describe "access_keys" do
    alias StreetPortraits.Accounts.AccessKey

    @valid_attrs %{access_key: "some access_key"}
    @update_attrs %{access_key: "some updated access_key"}
    @invalid_attrs %{access_key: nil}

    def access_key_fixture(attrs \\ %{}) do
      {:ok, access_key} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_access_key()

      access_key
    end

    test "list_access_keys/0 returns all access_keys" do
      access_key = access_key_fixture()
      assert Accounts.list_access_keys() == [access_key]
    end

    test "get_access_key!/1 returns the access_key with given id" do
      access_key = access_key_fixture()
      assert Accounts.get_access_key!(access_key.id) == access_key
    end

    test "create_access_key/1 with valid data creates a access_key" do
      assert {:ok, %AccessKey{} = access_key} = Accounts.create_access_key(@valid_attrs)
      assert access_key.access_key == "some access_key"
    end

    test "create_access_key/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_access_key(@invalid_attrs)
    end

    test "update_access_key/2 with valid data updates the access_key" do
      access_key = access_key_fixture()
      assert {:ok, %AccessKey{} = access_key} = Accounts.update_access_key(access_key, @update_attrs)
      assert access_key.access_key == "some updated access_key"
    end

    test "update_access_key/2 with invalid data returns error changeset" do
      access_key = access_key_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_access_key(access_key, @invalid_attrs)
      assert access_key == Accounts.get_access_key!(access_key.id)
    end

    test "delete_access_key/1 deletes the access_key" do
      access_key = access_key_fixture()
      assert {:ok, %AccessKey{}} = Accounts.delete_access_key(access_key)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_access_key!(access_key.id) end
    end

    test "change_access_key/1 returns a access_key changeset" do
      access_key = access_key_fixture()
      assert %Ecto.Changeset{} = Accounts.change_access_key(access_key)
    end
  end

  describe "users" do
    alias StreetPortraits.Accounts.User

    @valid_attrs %{email: "some email", name: "some name", phash: "some phash"}
    @update_attrs %{email: "some updated email", name: "some updated name", phash: "some updated phash"}
    @invalid_attrs %{email: nil, name: nil, phash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.phash == "some phash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.phash == "some updated phash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
