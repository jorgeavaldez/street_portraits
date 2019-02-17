defmodule StreetPortraitsWeb.PageController do
  use StreetPortraitsWeb, :controller
  alias StreetPortraits.SP

  def index(conn, _params) do
    portraits = SP.list_portraits() |> Enum.take(6)
    render(conn, "index.html", portraits: portraits)
  end
end
