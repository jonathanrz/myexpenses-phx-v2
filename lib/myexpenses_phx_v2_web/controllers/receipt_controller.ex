defmodule MyexpensesPhxV2Web.ReceiptController do
  use MyexpensesPhxV2Web, :controller

  alias MyexpensesPhxV2.Data
  alias MyexpensesPhxV2.Data.Receipt

  plug(MyexpensesPhxV2Web.Plugs.RequireAuth)
  plug(:check_receipt_owner when action not in [:index, :new, :create])

  def index(conn, _params) do
    receipts = Data.list_receipts(conn.assigns.user)
    render(conn, "index.html", receipts: receipts)
  end

  def new(conn, _params) do
    receipt = %Receipt{}
    accounts = load_accounts(conn)
    changeset = Data.change_receipt(receipt)
    render(conn, "new.html", changeset: changeset, accounts: accounts, receipt: receipt)
  end

  def create(conn, %{"receipt" => receipt_params}) do
    case Data.create_receipt(receipt_params, conn.assigns.user) do
      {:ok, receipt} ->
        conn
        |> put_flash(:info, "Receipt created successfully.")
        |> redirect(to: Routes.receipt_path(conn, :show, receipt))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    receipt = Data.get_receipt!(id)
    render(conn, "show.html", receipt: receipt)
  end

  def edit(conn, %{"id" => id}) do
    receipt = Data.get_receipt!(id)
    accounts = load_accounts(conn)
    changeset = Data.change_receipt(receipt)
    render(conn, "edit.html", receipt: receipt, changeset: changeset, accounts: accounts)
  end

  def update(conn, %{"id" => id, "receipt" => receipt_params}) do
    receipt = Data.get_receipt!(id)

    case Data.update_receipt(receipt, receipt_params) do
      {:ok, receipt} ->
        conn
        |> put_flash(:info, "Receipt updated successfully.")
        |> redirect(to: Routes.receipt_path(conn, :show, receipt))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", receipt: receipt, changeset: changeset, accounts: load_accounts(conn))
    end
  end

  def delete(conn, %{"id" => id}) do
    receipt = Data.get_receipt!(id)
    {:ok, _receipt} = Data.delete_receipt(receipt)

    conn
    |> put_flash(:info, "Receipt deleted successfully.")
    |> redirect(to: Routes.receipt_path(conn, :index))
  end

  def check_receipt_owner(conn, _params) do
    %{params: %{"id" => id}} = conn

    if Data.get_receipt!(id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot access this receipt")
      |> redirect(to: Routes.receipt_path(conn, :index))
      |> halt()
    end
  end

  def load_accounts(conn) do
    Data.list_accounts(conn.assigns.user)
    |> Enum.map(&{"#{&1.name}", &1.id})
  end
end
