defmodule MyexpensesPhxV2Web.BillControllerTest do
  use MyexpensesPhxV2Web.ConnCase

  alias MyexpensesPhxV2.Data

  @create_attrs %{
    due_day: 42,
    end_date: ~D[2010-04-17],
    init_date: ~D[2010-04-17],
    name: "some name",
    value: 42
  }
  @update_attrs %{
    due_day: 43,
    end_date: ~D[2011-05-18],
    init_date: ~D[2011-05-18],
    name: "some updated name",
    value: 43
  }
  @invalid_attrs %{due_day: nil, end_date: nil, init_date: nil, name: nil, value: nil}

  def fixture(:bill) do
    {:ok, bill} = Data.create_bill(@create_attrs)
    bill
  end

  describe "index" do
    @tag :skip
    test "lists all bills", %{conn: conn} do
      conn = get(conn, Routes.bill_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Bills"
    end
  end

  describe "new bill" do
    @tag :skip
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bill_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bill"
    end
  end

  @tag :skip
  describe "create bill" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bill_path(conn, :create), bill: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bill_path(conn, :show, id)

      conn = get(conn, Routes.bill_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bill"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bill_path(conn, :create), bill: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bill"
    end
  end

  @tag :skip
  describe "edit bill" do
    setup [:create_bill]

    test "renders form for editing chosen bill", %{conn: conn, bill: bill} do
      conn = get(conn, Routes.bill_path(conn, :edit, bill))
      assert html_response(conn, 200) =~ "Edit Bill"
    end
  end

  @tag :skip
  describe "update bill" do
    setup [:create_bill]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, bill: bill} do
      conn = put(conn, Routes.bill_path(conn, :update, bill), bill: @update_attrs)
      assert redirected_to(conn) == Routes.bill_path(conn, :show, bill)

      conn = get(conn, Routes.bill_path(conn, :show, bill))
      assert html_response(conn, 200) =~ "some updated name"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, bill: bill} do
      conn = put(conn, Routes.bill_path(conn, :update, bill), bill: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bill"
    end
  end

  @tag :skip
  describe "delete bill" do
    setup [:create_bill]

    test "deletes chosen bill", %{conn: conn, bill: bill} do
      conn = delete(conn, Routes.bill_path(conn, :delete, bill))
      assert redirected_to(conn) == Routes.bill_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.bill_path(conn, :show, bill))
      end
    end
  end

  defp create_bill(_) do
    bill = fixture(:bill)
    {:ok, bill: bill}
  end
end
