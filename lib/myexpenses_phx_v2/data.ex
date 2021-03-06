defmodule MyexpensesPhxV2.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias Ecto.Multi
  alias MyexpensesPhxV2.Repo

  alias MyexpensesPhxV2.Data.Account

  require Logger

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Account{}, ...]

  """
  def list_accounts(user) do
    Repo.all(Ecto.assoc(user, :accounts))
  end

  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

      iex> get_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Creates a account.

  ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:accounts)
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account.

  ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}

      iex> delete_account(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{source: %Account{}}

  """
  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end

  alias MyexpensesPhxV2.Data.CreditCard

  @doc """
  Returns the list of credit_cards.

  ## Examples

      iex> list_credit_cards()
      [%CreditCard{}, ...]

  """
  def list_credit_cards(user) do
    Repo.all(Ecto.assoc(user, :credit_cards))
    |> Repo.preload(:account)
  end

  @doc """
  Gets a single credit_card.

  Raises `Ecto.NoResultsError` if the Credit card does not exist.

  ## Examples

      iex> get_credit_card!(123)
      %CreditCard{}

      iex> get_credit_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credit_card!(id) do
    Repo.get!(CreditCard, id)
    |> Repo.preload(:account)
  end

  @doc """
  Creates a credit_card.

  ## Examples

      iex> create_credit_card(%{field: value})
      {:ok, %CreditCard{}}

      iex> create_credit_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credit_card(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:credit_cards)
    |> CreditCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credit_card.

  ## Examples

      iex> update_credit_card(credit_card, %{field: new_value})
      {:ok, %CreditCard{}}

      iex> update_credit_card(credit_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credit_card(%CreditCard{} = credit_card, attrs) do
    credit_card
    |> CreditCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CreditCard.

  ## Examples

      iex> delete_credit_card(credit_card)
      {:ok, %CreditCard{}}

      iex> delete_credit_card(credit_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credit_card(%CreditCard{} = credit_card) do
    Repo.delete(credit_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credit_card changes.

  ## Examples

      iex> change_credit_card(credit_card)
      %Ecto.Changeset{source: %CreditCard{}}

  """
  def change_credit_card(%CreditCard{} = credit_card) do
    CreditCard.changeset(credit_card, %{})
  end

  alias MyexpensesPhxV2.Data.Bill

  @doc """
  Returns the list of bills.

  ## Examples

      iex> list_bills()
      [%Bill{}, ...]

  """
  def list_bills(user) do
    Repo.all(Ecto.assoc(user, :bills))
  end

  @doc """
  Gets a single bill.

  Raises `Ecto.NoResultsError` if the Bill does not exist.

  ## Examples

      iex> get_bill!(123)
      %Bill{}

      iex> get_bill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bill!(id), do: Repo.get!(Bill, id)

  @doc """
  Creates a bill.

  ## Examples

      iex> create_bill(%{field: value})
      {:ok, %Bill{}}

      iex> create_bill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bill(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:bills)
    |> Bill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bill.

  ## Examples

      iex> update_bill(bill, %{field: new_value})
      {:ok, %Bill{}}

      iex> update_bill(bill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bill(%Bill{} = bill, attrs) do
    bill
    |> Bill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bill.

  ## Examples

      iex> delete_bill(bill)
      {:ok, %Bill{}}

      iex> delete_bill(bill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bill(%Bill{} = bill) do
    Repo.delete(bill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bill changes.

  ## Examples

      iex> change_bill(bill)
      %Ecto.Changeset{source: %Bill{}}

  """
  def change_bill(%Bill{} = bill) do
    Bill.changeset(bill, %{})
  end

  alias MyexpensesPhxV2.Data.Place

  @doc """
  Returns the list of places.

  ## Examples

      iex> list_places()
      [%Place{}, ...]

  """
  def list_places(user) do
    Repo.all(Ecto.assoc(user, :places))
  end

  @doc """
  Gets a single place.

  Raises `Ecto.NoResultsError` if the Place does not exist.

  ## Examples

      iex> get_place!(123)
      %Place{}

      iex> get_place!(456)
      ** (Ecto.NoResultsError)

  """
  def get_place!(id), do: Repo.get!(Place, id)

  @doc """
  Creates a place.

  ## Examples

      iex> create_place(%{field: value})
      {:ok, %Place{}}

      iex> create_place(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_place(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:places)
    |> Place.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a place.

  ## Examples

      iex> update_place(place, %{field: new_value})
      {:ok, %Place{}}

      iex> update_place(place, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_place(%Place{} = place, attrs) do
    place
    |> Place.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Place.

  ## Examples

      iex> delete_place(place)
      {:ok, %Place{}}

      iex> delete_place(place)
      {:error, %Ecto.Changeset{}}

  """
  def delete_place(%Place{} = place) do
    Repo.delete(place)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking place changes.

  ## Examples

      iex> change_place(place)
      %Ecto.Changeset{source: %Place{}}

  """
  def change_place(%Place{} = place) do
    Place.changeset(place, %{})
  end

  alias MyexpensesPhxV2.Data.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories(user) do
    Repo.all(Ecto.assoc(user, :categories))
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:categories)
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end

  alias MyexpensesPhxV2.Data.Receipt

  @doc """
  Returns the list of receipts.

  ## Examples

      iex> list_receipts()
      [%Receipt{}, ...]

  """
  def list_receipts(user) do
    Repo.all(Ecto.assoc(user, :receipts))
    |> Repo.preload(:account)
  end

  @doc """
  Gets a single receipt.

  Raises `Ecto.NoResultsError` if the Receipt does not exist.

  ## Examples

      iex> get_receipt!(123)
      %Receipt{}

      iex> get_receipt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receipt!(id), do: Repo.get!(Receipt, id) |> Repo.preload(:account)

  @doc """
  Creates a receipt.

  ## Examples

      iex> create_receipt(%{field: value})
      {:ok, %Receipt{}}

      iex> create_receipt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receipt(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:receipts)
    |> Receipt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receipt.

  ## Examples

      iex> update_receipt(receipt, %{field: new_value})
      {:ok, %Receipt{}}

      iex> update_receipt(receipt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receipt(%Receipt{} = receipt, attrs) do
    receipt
    |> Receipt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Receipt.

  ## Examples

      iex> delete_receipt(receipt)
      {:ok, %Receipt{}}

      iex> delete_receipt(receipt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receipt(%Receipt{} = receipt) do
    Repo.delete(receipt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receipt changes.

  ## Examples

      iex> change_receipt(receipt)
      %Ecto.Changeset{source: %Receipt{}}

  """
  def change_receipt(%Receipt{} = receipt) do
    Receipt.changeset(receipt, %{})
  end

  def confirm_receipt(receipt) do
    Multi.new()
    |> Multi.update(
      :account,
      Account.changeset(receipt.account, %{balance: receipt.account.balance + receipt.value})
    )
    |> Multi.update(:receipt, Receipt.changeset(receipt, %{confirmed: true}))
    |> Repo.transaction()
  end

  def unconfirm_receipt(receipt) do
    Multi.new()
    |> Multi.update(
      :account,
      Account.changeset(receipt.account, %{balance: receipt.account.balance - receipt.value})
    )
    |> Multi.update(:receipt, Receipt.changeset(receipt, %{confirmed: false}))
    |> Repo.transaction()
  end

  alias MyexpensesPhxV2.Data.Expense

  @doc """
  Returns the list of expenses.

  ## Examples

      iex> list_expenses()
      [%Expense{}, ...]

  """
  def list_expenses(user) do
    Repo.all(Ecto.assoc(user, :expenses))
    |> Repo.preload([:account, :place, :bill, :category, :user, credit_card: [:account]])
    |> Enum.map(fn expense ->
      Map.put(expense, :installmentCount, load_installment_count(expense.installmentUUID))
    end)
  end

  defp load_installment_count(nil), do: 0

  defp load_installment_count(installmentUUID) do
    Repo.one(from e in "expenses", select: count(e.installmentUUID == ^installmentUUID))
  end

  @doc """
  Gets a single expense.

  Raises `Ecto.NoResultsError` if the Expense does not exist.

  ## Examples

      iex> get_expense!(123)
      %Expense{}

      iex> get_expense!(456)
      ** (Ecto.NoResultsError)

  """
  def get_expense!(id) do
    expense =
      Repo.get!(Expense, id)
      |> Repo.preload(:account)
      |> Repo.preload(:credit_card)
      |> Repo.preload(:place)
      |> Repo.preload(:bill)
      |> Repo.preload(:category)

    if(expense.installmentUUID) do
      Map.put(expense, :installmentCount, load_installment_count(expense.installmentUUID))
    else
      expense
    end
  end

  def create_installment_expense(multi, attrs, user, uuid, installment, date, split_value) do
    changeset =
      user
      |> Ecto.build_assoc(:expenses)
      |> Expense.changeset(
        Map.merge(attrs, %{
          "installmentUUID" => uuid,
          "installmentNumber" => installment,
          "value" => split_value,
          "date" => date
        })
      )

    %{"installmentNumber" => installmentNumber} = attrs
    {installmentCount, _} = Integer.parse(installmentNumber)

    if(installment < installmentCount) do
      create_installment_expense(
        Multi.insert(multi, String.to_atom("expense#{installment}"), changeset),
        attrs,
        user,
        uuid,
        installment + 1,
        Date.add(date, Date.days_in_month(date)),
        split_value
      )
    else
      Multi.insert(multi, String.to_atom("expense#{installment}"), changeset)
    end
  end

  @doc """
  Creates a expense.

  ## Examples

      iex> create_expense(%{field: value})
      {:ok, %Expense{}}

      iex> create_expense(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_expense(attrs \\ %{}, user) do
    %{"installmentNumber" => installmentNumber, "date" => date, "value" => value} = attrs

    if(installmentNumber) do
      {installmentCount, _} = Integer.parse(installmentNumber)
      {_, parsedDate} = Date.from_iso8601(date)
      {parsedValue, _} = Integer.parse(value)

      {result, expenses} =
        Repo.transaction(
          create_installment_expense(
            Multi.new(),
            attrs,
            user,
            Ecto.UUID.generate(),
            1,
            parsedDate,
            div(parsedValue, installmentCount)
          )
        )

      {result, expenses.expense1}
    else
      user
      |> Ecto.build_assoc(:expenses)
      |> Expense.changeset(attrs)
      |> Repo.insert()
    end
  end

  @doc """
  Updates a expense.

  ## Examples

      iex> update_expense(expense, %{field: new_value})
      {:ok, %Expense{}}

      iex> update_expense(expense, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_expense(%Expense{} = expense, attrs) do
    expense
    |> Expense.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Expense.

  ## Examples

      iex> delete_expense(expense)
      {:ok, %Expense{}}

      iex> delete_expense(expense)
      {:error, %Ecto.Changeset{}}

  """
  def delete_expense(%Expense{} = expense) do
    Repo.delete(expense)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking expense changes.

  ## Examples

      iex> change_expense(expense)
      %Ecto.Changeset{source: %Expense{}}

  """
  def change_expense(%Expense{} = expense) do
    Expense.changeset(expense, %{})
  end

  def confirm_expense(expense) do
    Multi.new()
    |> Multi.update(
      :account,
      Account.changeset(expense.account, %{balance: expense.account.balance - expense.value})
    )
    |> Multi.update(:expense, Expense.changeset(expense, %{confirmed: true}))
    |> Repo.transaction()
  end

  def unconfirm_expense(expense) do
    Multi.new()
    |> Multi.update(
      :account,
      Account.changeset(expense.account, %{balance: expense.account.balance + expense.value})
    )
    |> Multi.update(:expense, Expense.changeset(expense, %{confirmed: false}))
    |> Repo.transaction()
  end
end
