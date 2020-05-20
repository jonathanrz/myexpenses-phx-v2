defmodule MyexpensesPhxV2Web.CreditCardController do
  use MyexpensesPhxV2Web, :controller

  alias MyexpensesPhxV2.Data
  alias MyexpensesPhxV2.Data.CreditCard

  plug(MyexpensesPhxV2Web.Plugs.RequireAuth)
  plug(:check_credit_card_owner when action not in [:index, :new, :create])

  def index(conn, _params) do
    credit_cards = Data.list_credit_cards(conn.assigns.user)

    render(conn, "index.html",
      credit_cards: credit_cards,
      accounts: Data.list_accounts(conn.assigns.user)
    )
  end

  def new(conn, _params) do
    accounts = load_accounts(conn)

    changeset = Data.change_credit_card(%CreditCard{})
    render(conn, "new.html", changeset: changeset, accounts: accounts)
  end

  def create(conn, %{"credit_card" => credit_card_params}) do
    case Data.create_credit_card(credit_card_params, conn.assigns.user) do
      {:ok, credit_card} ->
        conn
        |> put_flash(:info, "Credit card created successfully.")
        |> redirect(to: Routes.credit_card_path(conn, :show, credit_card))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    credit_card = Data.get_credit_card!(id)
    render(conn, "show.html", credit_card: credit_card)
  end

  def edit(conn, %{"id" => id}) do
    credit_card = Data.get_credit_card!(id)
    accounts = load_accounts(conn)
    changeset = Data.change_credit_card(credit_card)
    render(conn, "edit.html", credit_card: credit_card, changeset: changeset, accounts: accounts)
  end

  def update(conn, %{"id" => id, "credit_card" => credit_card_params}) do
    credit_card = Data.get_credit_card!(id)

    case Data.update_credit_card(credit_card, credit_card_params) do
      {:ok, credit_card} ->
        conn
        |> put_flash(:info, "Credit card updated successfully.")
        |> redirect(to: Routes.credit_card_path(conn, :show, credit_card))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", credit_card: credit_card, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    credit_card = Data.get_credit_card!(id)
    {:ok, _credit_card} = Data.delete_credit_card(credit_card)

    conn
    |> put_flash(:info, "Credit card deleted successfully.")
    |> redirect(to: Routes.credit_card_path(conn, :index))
  end

  def check_credit_card_owner(conn, _params) do
    %{params: %{"id" => id}} = conn

    if Data.get_credit_card!(id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot access this credit card")
      |> redirect(to: Routes.credit_card_path(conn, :index))
      |> halt()
    end
  end

  def load_accounts(conn) do
    Data.list_accounts(conn.assigns.user)
    |> Enum.map(&{"#{&1.name}", &1.id})
  end
end
