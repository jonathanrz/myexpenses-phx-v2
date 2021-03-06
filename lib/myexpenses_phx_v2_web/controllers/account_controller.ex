defmodule MyexpensesPhxV2Web.AccountController do
  use MyexpensesPhxV2Web, :controller

  alias MyexpensesPhxV2.Data
  alias MyexpensesPhxV2.Data.Account

  plug(MyexpensesPhxV2Web.Plugs.RequireAuth)
  plug(:check_account_owner when action not in [:index, :new, :create])

  def index(conn, _params) do
    accounts = Data.list_accounts(conn.assigns.user)
    render(conn, "index.html", accounts: accounts)
  end

  def new(conn, _params) do
    changeset = Data.change_account(%Account{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"account" => account_params}) do
    case Data.create_account(account_params, conn.assigns.user) do
      {:ok, account} ->
        conn
        |> put_flash(:info, "Account created successfully.")
        |> redirect(to: Routes.account_path(conn, :show, account))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    account = Data.get_account!(id)
    render(conn, "show.html", account: account)
  end

  def edit(conn, %{"id" => id}) do
    account = Data.get_account!(id)
    changeset = Data.change_account(account)
    render(conn, "edit.html", account: account, changeset: changeset)
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    account = Data.get_account!(id)

    case Data.update_account(account, account_params) do
      {:ok, account} ->
        conn
        |> put_flash(:info, "Account updated successfully.")
        |> redirect(to: Routes.account_path(conn, :show, account))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", account: account, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    account = Data.get_account!(id)
    {:ok, _account} = Data.delete_account(account)

    conn
    |> put_flash(:info, "Account deleted successfully.")
    |> redirect(to: Routes.account_path(conn, :index))
  end

  def check_account_owner(conn, _params) do
    %{params: %{"id" => id}} = conn

    if Data.get_account!(id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot access this account")
      |> redirect(to: Routes.account_path(conn, :index))
      |> halt()
    end
  end
end
