defmodule MyexpensesPhxV2Web.ExpenseControllerTest do
  use MyexpensesPhxV2Web.ConnCase

  alias MyexpensesPhxV2.Data

  @create_attrs %{
    date: ~D[2010-04-17],
    installmentUUID: "some installmentUUID",
    name: "some name",
    value: 42
  }
  @update_attrs %{
    date: ~D[2011-05-18],
    installmentUUID: "some updated installmentUUID",
    name: "some updated name",
    value: 43
  }
  @invalid_attrs %{date: nil, installmentUUID: nil, name: nil, value: nil}

  def fixture(:expense) do
    {:ok, expense} = Data.create_expense(@create_attrs)
    expense
  end

  describe "index" do
    @tag :skip
    test "lists all expenses", %{conn: conn} do
      conn = get(conn, Routes.expense_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Expenses"
    end
  end

  describe "new expense" do
    @tag :skip
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.expense_path(conn, :new))
      assert html_response(conn, 200) =~ "New Expense"
    end
  end

  describe "create expense" do
    @tag :skip
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.expense_path(conn, :create), expense: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.expense_path(conn, :show, id)

      conn = get(conn, Routes.expense_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Expense"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.expense_path(conn, :create), expense: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Expense"
    end
  end

  describe "edit expense" do
    setup [:create_expense]

    @tag :skip
    test "renders form for editing chosen expense", %{conn: conn, expense: expense} do
      conn = get(conn, Routes.expense_path(conn, :edit, expense))
      assert html_response(conn, 200) =~ "Edit Expense"
    end
  end

  describe "update expense" do
    setup [:create_expense]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, expense: expense} do
      conn = put(conn, Routes.expense_path(conn, :update, expense), expense: @update_attrs)
      assert redirected_to(conn) == Routes.expense_path(conn, :show, expense)

      conn = get(conn, Routes.expense_path(conn, :show, expense))
      assert html_response(conn, 200) =~ "some updated installmentUUID"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, expense: expense} do
      conn = put(conn, Routes.expense_path(conn, :update, expense), expense: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Expense"
    end
  end

  describe "delete expense" do
    setup [:create_expense]

    @tag :skip
    test "deletes chosen expense", %{conn: conn, expense: expense} do
      conn = delete(conn, Routes.expense_path(conn, :delete, expense))
      assert redirected_to(conn) == Routes.expense_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.expense_path(conn, :show, expense))
      end
    end
  end

  defp create_expense(_) do
    expense = fixture(:expense)
    {:ok, expense: expense}
  end
end
