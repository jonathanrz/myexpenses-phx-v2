defmodule MyexpensesPhxV2Web.PlaceController do
  use MyexpensesPhxV2Web, :controller

  alias MyexpensesPhxV2.Data
  alias MyexpensesPhxV2.Data.Place

  plug(MyexpensesPhxV2Web.Plugs.RequireAuth)
  plug(:check_place_owner when action not in [:index, :new, :create])

  def index(conn, _params) do
    places = Data.list_places(conn.assigns.user)
    render(conn, "index.html", places: places)
  end

  def new(conn, _params) do
    changeset = Data.change_place(%Place{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"place" => place_params}) do
    case Data.create_place(place_params, conn.assigns.user) do
      {:ok, place} ->
        conn
        |> put_flash(:info, "Place created successfully.")
        |> redirect(to: Routes.place_path(conn, :show, place))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    place = Data.get_place!(id)
    render(conn, "show.html", place: place)
  end

  def edit(conn, %{"id" => id}) do
    place = Data.get_place!(id)
    changeset = Data.change_place(place)
    render(conn, "edit.html", place: place, changeset: changeset)
  end

  def update(conn, %{"id" => id, "place" => place_params}) do
    place = Data.get_place!(id)

    case Data.update_place(place, place_params) do
      {:ok, place} ->
        conn
        |> put_flash(:info, "Place updated successfully.")
        |> redirect(to: Routes.place_path(conn, :show, place))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", place: place, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    place = Data.get_place!(id)
    {:ok, _place} = Data.delete_place(place)

    conn
    |> put_flash(:info, "Place deleted successfully.")
    |> redirect(to: Routes.place_path(conn, :index))
  end

  def check_place_owner(conn, _params) do
    %{params: %{"id" => id}} = conn

    if Data.get_place!(id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot access this place")
      |> redirect(to: Routes.place_path(conn, :index))
      |> halt()
    end
  end
end
