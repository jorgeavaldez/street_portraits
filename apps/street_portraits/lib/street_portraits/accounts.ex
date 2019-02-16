defmodule StreetPortraits.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias StreetPortraits.Repo

  alias StreetPortraits.Accounts.AccountType

  @doc """
  Returns the list of account_types.

  ## Examples

      iex> list_account_types()
      [%AccountType{}, ...]

  """
  def list_account_types do
    Repo.all(AccountType)
  end

  @doc """
  Gets a single account_type.

  Raises `Ecto.NoResultsError` if the Account type does not exist.

  ## Examples

      iex> get_account_type!(123)
      %AccountType{}

      iex> get_account_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account_type!(id), do: Repo.get!(AccountType, id)

  @doc """
  Creates a account_type.

  ## Examples

      iex> create_account_type(%{field: value})
      {:ok, %AccountType{}}

      iex> create_account_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account_type(attrs \\ %{}) do
    %AccountType{}
    |> AccountType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account_type.

  ## Examples

      iex> update_account_type(account_type, %{field: new_value})
      {:ok, %AccountType{}}

      iex> update_account_type(account_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account_type(%AccountType{} = account_type, attrs) do
    account_type
    |> AccountType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AccountType.

  ## Examples

      iex> delete_account_type(account_type)
      {:ok, %AccountType{}}

      iex> delete_account_type(account_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account_type(%AccountType{} = account_type) do
    Repo.delete(account_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account_type changes.

  ## Examples

      iex> change_account_type(account_type)
      %Ecto.Changeset{source: %AccountType{}}

  """
  def change_account_type(%AccountType{} = account_type) do
    AccountType.changeset(account_type, %{})
  end

  alias StreetPortraits.Accounts.AccessKey

  @doc """
  Returns the list of access_keys.

  ## Examples

      iex> list_access_keys()
      [%AccessKey{}, ...]

  """
  def list_access_keys do
    Repo.all(AccessKey)
  end

  @doc """
  Gets a single access_key.

  Raises `Ecto.NoResultsError` if the Access key does not exist.

  ## Examples

      iex> get_access_key!(123)
      %AccessKey{}

      iex> get_access_key!(456)
      ** (Ecto.NoResultsError)

  """
  def get_access_key!(id), do: Repo.get!(AccessKey, id)

  @doc """
  Creates a access_key.

  ## Examples

      iex> create_access_key(%{field: value})
      {:ok, %AccessKey{}}

      iex> create_access_key(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_access_key(attrs \\ %{}) do
    %AccessKey{}
    |> AccessKey.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a access_key.

  ## Examples

      iex> update_access_key(access_key, %{field: new_value})
      {:ok, %AccessKey{}}

      iex> update_access_key(access_key, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_access_key(%AccessKey{} = access_key, attrs) do
    access_key
    |> AccessKey.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AccessKey.

  ## Examples

      iex> delete_access_key(access_key)
      {:ok, %AccessKey{}}

      iex> delete_access_key(access_key)
      {:error, %Ecto.Changeset{}}

  """
  def delete_access_key(%AccessKey{} = access_key) do
    Repo.delete(access_key)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking access_key changes.

  ## Examples

      iex> change_access_key(access_key)
      %Ecto.Changeset{source: %AccessKey{}}

  """
  def change_access_key(%AccessKey{} = access_key) do
    AccessKey.changeset(access_key, %{})
  end

  alias StreetPortraits.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def valid_permissions do
    [
      "can_modify_neighbors",
      "can_modify_portraits",
      "can_modify_outreach",
      "sudo",
    ]
  end
end
