defmodule MyexpensesPhxV2Web.Router do
  use MyexpensesPhxV2Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MyexpensesPhxV2Web.Plugs.SetUser
    plug MyexpensesPhxV2Web.Plugs.SetTitle
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyexpensesPhxV2Web do
    pipe_through :browser

    get "/", PageController, :index
    resources("/accounts", AccountController)
    resources("/credit_cards", CreditCardController)
    resources("/bills", BillController)
    resources("/places", PlaceController)
    resources("/categories", CategoryController)
    resources("/receipts", ReceiptController)
    post "/receipts/:id/confirm", ReceiptController, :confirm
    post "/receipts/:id/unconfirm", ReceiptController, :unconfirm
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
