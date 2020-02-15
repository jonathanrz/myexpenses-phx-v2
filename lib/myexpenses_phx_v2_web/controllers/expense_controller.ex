defmodule MyexpensesPhxV2Web.ExpenseController do
  use MyexpensesPhxV2Web, :controller

  alias MyexpensesPhxV2.Data
  alias MyexpensesPhxV2.Data.Expense

  plug(MyexpensesPhxV2Web.Plugs.RequireAuth)
  plug(:check_expense_owner when action not in [:index, :new, :create])

  def index(conn, _params) do
    expenses = Data.list_expenses(conn.assigns.user)
    render(conn, "index.html", expenses: expenses)
  end

  def new(conn, _params) do
    changeset = Data.change_expense(%Expense{})
    accounts = load_accounts(conn)
    credit_cards = load_credit_cards(conn)
    places = load_places(conn)
    bills = load_bills(conn)
    categories = load_categories(conn)
    render(
      conn,
      "new.html",
      changeset: changeset,
      accounts: accounts,
      credit_cards: credit_cards,
      places: places,
      bills: bills,
      categories: categories
    )
  end

  def create(conn, %{"expense" => expense_params}) do
    result = Data.create_expense(expense_params, conn.assigns.user)
    case result do
      {:ok, expense} ->
        conn
        |> put_flash(:info, "Expense created successfully.")
        |> redirect(to: Routes.expense_path(conn, :show, expense))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    expense = Data.get_expense!(id)
    render(conn, "show.html", expense: expense)
  end

  def edit(conn, %{"id" => id}) do
    expense = Data.get_expense!(id)
    accounts = load_accounts(conn)
    credit_cards = load_credit_cards(conn)
    places = load_places(conn)
    bills = load_bills(conn)
    categories = load_categories(conn)
    changeset = Data.change_expense(expense)
    render(
      conn,
      "edit.html",
      expense: expense,
      changeset: changeset,
      accounts: accounts,
      credit_cards: credit_cards,
      places: places,
      bills: bills,
      categories: categories
    )
  end

  def update(conn, %{"id" => id, "expense" => expense_params}) do
    expense = Data.get_expense!(id)

    case Data.update_expense(expense, expense_params) do
      {:ok, expense} ->
        conn
        |> put_flash(:info, "Expense updated successfully.")
        |> redirect(to: Routes.expense_path(conn, :show, expense))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", expense: expense, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    expense = Data.get_expense!(id)
    {:ok, _expense} = Data.delete_expense(expense)

    conn
    |> put_flash(:info, "Expense deleted successfully.")
    |> redirect(to: Routes.expense_path(conn, :index))
  end

  def check_expense_owner(conn, _params) do
    %{params: %{"id" => id}} = conn

    if Data.get_expense!(id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot access this expense")
      |> redirect(to: Routes.expense_path(conn, :index))
      |> halt()
    end
  end

  def load_accounts(conn) do
    Data.list_accounts(conn.assigns.user)
    |> Enum.map(&{"#{&1.name}", &1.id})
  end

  def load_credit_cards(conn) do
    Data.list_credit_cards(conn.assigns.user)
    |> Enum.map(&{"#{&1.name}", &1.id})
  end

  def load_places(conn) do
    Data.list_places(conn.assigns.user)
    |> Enum.map(&{"#{&1.name}", &1.id})
  end

  def load_bills(conn) do
    Data.list_bills(conn.assigns.user)
    |> Enum.map(&{"#{&1.name}", &1.id})
  end

  def load_categories(conn) do
    Data.list_categories(conn.assigns.user)
    |> Enum.map(&{"#{&1.name}", &1.id})
  end
end
