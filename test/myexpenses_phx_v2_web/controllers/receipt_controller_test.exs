defmodule MyexpensesPhxV2Web.ReceiptControllerTest do
  use MyexpensesPhxV2Web.ConnCase

  alias MyexpensesPhxV2.Data

  @create_attrs %{confirmed: true, date: ~D[2010-04-17], name: "some name", value: 42}
  @update_attrs %{confirmed: false, date: ~D[2011-05-18], name: "some updated name", value: 43}
  @invalid_attrs %{confirmed: nil, date: nil, name: nil, value: nil}

  def fixture(:receipt) do
    {:ok, receipt} = Data.create_receipt(@create_attrs)
    receipt
  end

  describe "index" do
    @tag :skip
    test "lists all receipts", %{conn: conn} do
      conn = get(conn, Routes.receipt_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Receipts"
    end
  end

  describe "new receipt" do
    @tag :skip
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.receipt_path(conn, :new))
      assert html_response(conn, 200) =~ "New Receipt"
    end
  end

  describe "create receipt" do
    @tag :skip
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.receipt_path(conn, :create), receipt: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.receipt_path(conn, :show, id)

      conn = get(conn, Routes.receipt_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Receipt"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.receipt_path(conn, :create), receipt: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Receipt"
    end
  end

  describe "edit receipt" do
    setup [:create_receipt]

    @tag :skip
    test "renders form for editing chosen receipt", %{conn: conn, receipt: receipt} do
      conn = get(conn, Routes.receipt_path(conn, :edit, receipt))
      assert html_response(conn, 200) =~ "Edit Receipt"
    end
  end

  describe "update receipt" do
    setup [:create_receipt]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, receipt: receipt} do
      conn = put(conn, Routes.receipt_path(conn, :update, receipt), receipt: @update_attrs)
      assert redirected_to(conn) == Routes.receipt_path(conn, :show, receipt)

      conn = get(conn, Routes.receipt_path(conn, :show, receipt))
      assert html_response(conn, 200) =~ "some updated name"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, receipt: receipt} do
      conn = put(conn, Routes.receipt_path(conn, :update, receipt), receipt: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Receipt"
    end
  end

  describe "delete receipt" do
    setup [:create_receipt]

    @tag :skip
    test "deletes chosen receipt", %{conn: conn, receipt: receipt} do
      conn = delete(conn, Routes.receipt_path(conn, :delete, receipt))
      assert redirected_to(conn) == Routes.receipt_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.receipt_path(conn, :show, receipt))
      end
    end
  end

  defp create_receipt(_) do
    receipt = fixture(:receipt)
    {:ok, receipt: receipt}
  end
end
