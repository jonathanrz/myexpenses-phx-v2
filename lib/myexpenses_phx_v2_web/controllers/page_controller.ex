defmodule MyexpensesPhxV2Web.PageController do
  use MyexpensesPhxV2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
