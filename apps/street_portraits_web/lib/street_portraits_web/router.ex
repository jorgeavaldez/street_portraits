defmodule StreetPortraitsWeb.Router do
  use StreetPortraitsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StreetPortraitsWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/neighbors", NeighborController
    resources "/portraits", PortraitController
  end

  # Other scopes may use custom stacks.
  # scope "/api", StreetPortraitsWeb do
  #   pipe_through :api
  # end
end
