defmodule MyexpensesPhxV2Web.CreditCardControllerTest do
  use MyexpensesPhxV2Web.ConnCase

  alias MyexpensesPhxV2.Data

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:credit_card) do
    {:ok, credit_card} = Data.create_credit_card(@create_attrs)
    credit_card
  end

  describe "index" do
    @tag :skip
    test "lists all credit_cards", %{conn: conn} do
      conn = get(conn, Routes.credit_card_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Credit cards"
    end
  end

  describe "new credit_card" do
    @tag :skip
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.credit_card_path(conn, :new))
      assert html_response(conn, 200) =~ "New Credit card"
    end
  end

  describe "create credit_card" do
    @tag :skip
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.credit_card_path(conn, :create), credit_card: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.credit_card_path(conn, :show, id)

      conn = get(conn, Routes.credit_card_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Credit card"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.credit_card_path(conn, :create), credit_card: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Credit card"
    end
  end

  describe "edit credit_card" do
    setup [:create_credit_card]

    @tag :skip
    test "renders form for editing chosen credit_card", %{conn: conn, credit_card: credit_card} do
      conn = get(conn, Routes.credit_card_path(conn, :edit, credit_card))
      assert html_response(conn, 200) =~ "Edit Credit card"
    end
  end

  describe "update credit_card" do
    setup [:create_credit_card]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, credit_card: credit_card} do
      conn =
        put(conn, Routes.credit_card_path(conn, :update, credit_card), credit_card: @update_attrs)

      assert redirected_to(conn) == Routes.credit_card_path(conn, :show, credit_card)

      conn = get(conn, Routes.credit_card_path(conn, :show, credit_card))
      assert html_response(conn, 200) =~ "some updated name"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, credit_card: credit_card} do
      conn =
        put(conn, Routes.credit_card_path(conn, :update, credit_card), credit_card: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Credit card"
    end
  end

  describe "delete credit_card" do
    setup [:create_credit_card]

    @tag :skip
    test "deletes chosen credit_card", %{conn: conn, credit_card: credit_card} do
      conn = delete(conn, Routes.credit_card_path(conn, :delete, credit_card))
      assert redirected_to(conn) == Routes.credit_card_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.credit_card_path(conn, :show, credit_card))
      end
    end
  end

  defp create_credit_card(_) do
    credit_card = fixture(:credit_card)
    {:ok, credit_card: credit_card}
  end
end
