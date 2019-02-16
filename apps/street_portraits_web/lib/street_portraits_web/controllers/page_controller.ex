defmodule StreetPortraitsWeb.PageController do
  use StreetPortraitsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
