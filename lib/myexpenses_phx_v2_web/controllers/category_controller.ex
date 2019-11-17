defmodule MyexpensesPhxV2Web.CategoryController do
  use MyexpensesPhxV2Web, :controller

  alias MyexpensesPhxV2.Data
  alias MyexpensesPhxV2.Data.Category

  plug(MyexpensesPhxV2Web.Plugs.RequireAuth)
  plug(:check_category_owner when action not in [:index, :new, :create])

  def index(conn, _params) do
    categories = Data.list_categories(conn.assigns.user)
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _params) do
    changeset = Data.change_category(%Category{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    case Data.create_category(category_params, conn.assigns.user) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: Routes.category_path(conn, :show, category))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Data.get_category!(id)
    render(conn, "show.html", category: category)
  end

  def edit(conn, %{"id" => id}) do
    category = Data.get_category!(id)
    changeset = Data.change_category(category)
    render(conn, "edit.html", category: category, changeset: changeset)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Data.get_category!(id)

    case Data.update_category(category, category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: Routes.category_path(conn, :show, category))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", category: category, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Data.get_category!(id)
    {:ok, _category} = Data.delete_category(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: Routes.category_path(conn, :index))
  end

  def check_category_owner(conn, _params) do
    %{params: %{"id" => id}} = conn

    if Data.get_category!(id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot access this category")
      |> redirect(to: Routes.category_path(conn, :index))
      |> halt()
    end
  end
end
