defmodule MyexpensesPhxV2Web.BillController do
  use MyexpensesPhxV2Web, :controller

  alias MyexpensesPhxV2.Data
  alias MyexpensesPhxV2.Data.Bill

  plug(MyexpensesPhxV2Web.Plugs.RequireAuth)
  plug(:check_bill_owner when action not in [:index, :new, :create])

  def index(conn, _params) do
    bills = Data.list_bills(conn.assigns.user)
    render(conn, "index.html", bills: bills)
  end

  def new(conn, _params) do
    changeset = Data.change_bill(%Bill{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bill" => bill_params}) do
    case Data.create_bill(bill_params, conn.assigns.user) do
      {:ok, bill} ->
        conn
        |> put_flash(:info, "Bill created successfully.")
        |> redirect(to: Routes.bill_path(conn, :show, bill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bill = Data.get_bill!(id)
    render(conn, "show.html", bill: bill)
  end

  def edit(conn, %{"id" => id}) do
    bill = Data.get_bill!(id)
    changeset = Data.change_bill(bill)
    render(conn, "edit.html", bill: bill, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bill" => bill_params}) do
    bill = Data.get_bill!(id)

    case Data.update_bill(bill, bill_params) do
      {:ok, bill} ->
        conn
        |> put_flash(:info, "Bill updated successfully.")
        |> redirect(to: Routes.bill_path(conn, :show, bill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bill: bill, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bill = Data.get_bill!(id)
    {:ok, _bill} = Data.delete_bill(bill)

    conn
    |> put_flash(:info, "Bill deleted successfully.")
    |> redirect(to: Routes.bill_path(conn, :index))
  end

  def check_bill_owner(conn, _params) do
    %{params: %{"id" => id}} = conn

    if Data.get_bill!(id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot access this bill")
      |> redirect(to: Routes.bill_path(conn, :index))
      |> halt()
    end
  end
end
