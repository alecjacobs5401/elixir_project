defmodule ElixirProject.Router do
  use ElixirProject.Web, :router

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

  scope "/", ElixirProject do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/dynamic_number_pools", DynamicNumberPoolController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirProject do
  #   pipe_through :api
  # end
end
