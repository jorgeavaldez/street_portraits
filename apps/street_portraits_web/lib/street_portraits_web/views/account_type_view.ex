defmodule StreetPortraitsWeb.AccountTypeView do
  use StreetPortraitsWeb, :view

  alias StreetPortraits.Accounts

  def create_default_permissions_checkboxes do
    Accounts.valid_permissions()
    |> Enum.map(
      &(%{ action: &1, isChecked: false })
    )
  end

  def get_selected_permissions(current_permissions) do
    Enum.map(
      Accounts.valid_permissions(),
      fn permission ->
        %{
          action: permission,
          isChecked: Enum.any?(current_permissions, &(&1 == permission)),
    }
      end
    )
  end

  def serialize_checked_permissions(checked_permissions) do
    checked_permissions
    |> Enum.filter(fn {x, y} -> y == "true" end)
    |> Enum.map(fn {x, y} -> x end)
  end
end
