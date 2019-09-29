defmodule MyexpensesPhxV2Web.AccountControllerTest do
  use MyexpensesPhxV2Web.ConnCase

  alias MyexpensesPhxV2.Data

  @create_attrs %{balance: 42, name: "some name"}
  @update_attrs %{balance: 43, name: "some updated name"}
  @invalid_attrs %{balance: nil, name: nil}

  def fixture(:account) do
    {:ok, account} = Data.create_account(@create_attrs)
    account
  end

  describe "index" do
    @tag :skip
    test "lists all accounts", %{conn: conn} do
      conn =
        conn
        |> set_user
        |> get(Routes.account_path(conn, :index))

      assert html_response(conn, 200) =~ "Listing Accounts"
    end
  end

  describe "new account" do
    test "renders form", %{conn: conn} do
      conn =
        conn
        |> set_user
        |> get(Routes.account_path(conn, :new))

      assert html_response(conn, 200) =~ "New Account"
    end
  end

  describe "create account" do
    @tag :skip
    test "redirects to show when data is valid", %{conn: conn} do
      conn = set_user(conn)
      conn = post(conn, Routes.account_path(conn, :create), account: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.account_path(conn, :show, id)

      conn = get(conn, Routes.account_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Account"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        conn
        |> set_user
        |> post(Routes.account_path(conn, :create), account: @invalid_attrs)

      assert html_response(conn, 200) =~ "New Account"
    end
  end

  @tag :skip
  describe "edit account" do
    setup [:create_account]

    test "renders form for editing chosen account", %{conn: conn, account: account} do
      conn = set_user(conn)
      conn = get(conn, Routes.account_path(conn, :edit, account))
      assert html_response(conn, 200) =~ "Edit Account"
    end
  end

  describe "update account" do
    setup [:create_account]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, account: account} do
      conn = set_user(conn)
      conn = put(conn, Routes.account_path(conn, :update, account), account: @update_attrs)
      assert redirected_to(conn) == Routes.account_path(conn, :show, account)

      conn = get(conn, Routes.account_path(conn, :show, account))
      assert html_response(conn, 200) =~ "some updated name"
    end

    @tag :skip
    test "renders errors when data is invalid", %{conn: conn, account: account} do
      conn = put(conn, Routes.account_path(conn, :update, account), account: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Account"
    end
  end

  describe "delete account" do
    setup [:create_account]

    @tag :skip
    test "deletes chosen account", %{conn: conn, account: account} do
      conn = set_user(conn)
      conn = delete(conn, Routes.account_path(conn, :delete, account))
      assert redirected_to(conn) == Routes.account_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.account_path(conn, :show, account))
      end
    end
  end

  defp create_account(_) do
    account = fixture(:account)
    {:ok, account: account}
  end

  defp set_user(conn) do
    assign(conn, :user, user_fixture())
  end
end
