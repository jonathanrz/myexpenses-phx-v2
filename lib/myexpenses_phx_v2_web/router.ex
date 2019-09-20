defmodule MyexpensesPhxV2Web.Router do
  use MyexpensesPhxV2Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MyexpensesPhxV2Web.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyexpensesPhxV2Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", MyexpensesPhxV2Web do
    pipe_through :browser

    get "/signout", SessionController, :delete
    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", MyexpensesPhxV2Web do
  #   pipe_through :api
  # end
end