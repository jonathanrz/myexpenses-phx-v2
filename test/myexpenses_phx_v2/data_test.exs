defmodule MyexpensesPhxV2.DataTest do
  use MyexpensesPhxV2.DataCase

  alias MyexpensesPhxV2.Data

  describe "accounts" do
    alias MyexpensesPhxV2.Data.Account

    @valid_attrs %{balance: 42, name: "some name"}
    @update_attrs %{balance: 43, name: "some updated name"}
    @invalid_attrs %{balance: nil, name: nil}

    def account_fixture(user, attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_account(user)

      account
    end

    test "list_accounts/0 returns all accounts" do
      user = user_fixture()
      account = account_fixture(user)
      assert Data.list_accounts(user) == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture(user_fixture())
      assert Data.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Data.create_account(@valid_attrs, user_fixture())
      assert account.balance == 42
      assert account.name == "some name"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_account(@invalid_attrs, user_fixture())
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture(user_fixture())
      assert {:ok, %Account{} = account} = Data.update_account(account, @update_attrs)
      assert account.balance == 43
      assert account.name == "some updated name"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture(user_fixture())
      assert {:error, %Ecto.Changeset{}} = Data.update_account(account, @invalid_attrs)
      assert account == Data.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture(user_fixture())
      assert {:ok, %Account{}} = Data.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Data.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture(user_fixture())
      assert %Ecto.Changeset{} = Data.change_account(account)
    end
  end
end
