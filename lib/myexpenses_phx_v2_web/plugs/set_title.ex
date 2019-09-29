defmodule MyexpensesPhxV2Web.Plugs.SetTitle do
  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do
  end

  def call(conn, _params) do
    case conn.path_info do
      ["accounts", "new"] -> assign(conn, :title, "New Account")
      ["accounts", _id, "edit"] -> assign(conn, :title, "Edit Account")
      ["accounts", _id] -> assign(conn, :title, "Account")
      ["accounts" | _tail] -> assign(conn, :title, "Accounts")
      _ -> assign(conn, :title, "My Expenses")
    end
  end
end
