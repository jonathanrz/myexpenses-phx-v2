defmodule MyexpensesPhxV2Web.PlaceControllerTest do
  use MyexpensesPhxV2Web.ConnCase

  alias MyexpensesPhxV2.Data

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:place) do
    {:ok, place} = Data.create_place(@create_attrs)
    place
  end

  describe "index" do
    @tag :skip
    test "lists all places", %{conn: conn} do
      conn = get(conn, Routes.place_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Places"
    end
  end

  describe "new place" do
    @tag :skip
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.place_path(conn, :new))
      assert html_response(conn, 200) =~ "New Place"
    end
  end

  describe "create place" do
    @tag :skip
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.place_path(conn, :create), place: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.place_path(conn, :show, id)

      conn = get(conn, Routes.place_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Place"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.place_path(conn, :create), place: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Place"
    end
  end

  describe "edit place" do
    setup [:create_place]

    @tag :skip
    test "renders form for editing chosen place", %{conn: conn, place: place} do
      conn = get(conn, Routes.place_path(conn, :edit, place))
      assert html_response(conn, 200) =~ "Edit Place"
    end
  end

  describe "update place" do
    setup [:create_place]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, place: place} do
      conn = put(conn, Routes.place_path(conn, :update, place), place: @update_attrs)
      assert redirected_to(conn) == Routes.place_path(conn, :show, place)

      conn = get(conn, Routes.place_path(conn, :show, place))
      assert html_response(conn, 200) =~ "some updated name"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, place: place} do
      conn = put(conn, Routes.place_path(conn, :update, place), place: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Place"
    end
  end

  describe "delete place" do
    setup [:create_place]

    @tag :skip
    test "deletes chosen place", %{conn: conn, place: place} do
      conn = delete(conn, Routes.place_path(conn, :delete, place))
      assert redirected_to(conn) == Routes.place_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.place_path(conn, :show, place))
      end
    end
  end

  defp create_place(_) do
    place = fixture(:place)
    {:ok, place: place}
  end
end
