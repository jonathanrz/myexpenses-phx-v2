defmodule MyexpensesPhxV2Web.Plugs.SetTitle do
  import Plug.Conn

  def init(_params) do
  end

  def call(conn, _params) do
    case conn.path_info do
      ["accounts", "new"] -> assign(conn, :title, "New Account")
      ["accounts", _id, "edit"] -> assign(conn, :title, "Edit Account")
      ["accounts", _id] -> assign(conn, :title, "Account")
      ["accounts" | _tail] -> assign(conn, :title, "Accounts")
      ["credit_cards", "new"] -> assign(conn, :title, "New Credit Card")
      ["credit_cards", _id, "edit"] -> assign(conn, :title, "Edit Credit Card")
      ["credit_cards", _id] -> assign(conn, :title, "Credit Cards")
      ["credit_cards" | _tail] -> assign(conn, :title, "Credit Cards")
      ["bills", "new"] -> assign(conn, :title, "New Bill")
      ["bills", _id, "edit"] -> assign(conn, :title, "Edit Bill")
      ["bills", _id] -> assign(conn, :title, "Bills")
      ["bills" | _tail] -> assign(conn, :title, "Bills")
      ["places", "new"] -> assign(conn, :title, "New Place")
      ["places", _id, "edit"] -> assign(conn, :title, "Edit Place")
      ["places", _id] -> assign(conn, :title, "Places")
      ["places" | _tail] -> assign(conn, :title, "Places")
      ["categories", "new"] -> assign(conn, :title, "New Category")
      ["categories", _id, "edit"] -> assign(conn, :title, "Edit Category")
      ["categories", _id] -> assign(conn, :title, "Categories")
      ["categories" | _tail] -> assign(conn, :title, "Categories")
      ["receipts", "new"] -> assign(conn, :title, "New Receipt")
      ["receipts", _id, "edit"] -> assign(conn, :title, "Edit Receipt")
      ["receipts", _id] -> assign(conn, :title, "Receipts")
      ["receipts" | _tail] -> assign(conn, :title, "Receipts")
      _ -> assign(conn, :title, "My Expenses")
    end
  end
end
