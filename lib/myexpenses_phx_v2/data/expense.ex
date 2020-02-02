defmodule MyexpensesPhxV2.Data.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  schema "expenses" do
    field :date, :date
    field :installmentUUID, :string
    field :installmentNumber, :integer
    field :name, :string
    field :value, :integer
    belongs_to(:account, MyexpensesPhxV2.Data.Account)
    belongs_to(:credit_card, MyexpensesPhxV2.Data.CreditCard)
    belongs_to(:place, MyexpensesPhxV2.Data.Place)
    belongs_to(:bill, MyexpensesPhxV2.Data.Bill)
    belongs_to(:category, MyexpensesPhxV2.Data.Category)
    belongs_to(:user, MyexpensesPhxV2.Data.User)

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:name, :date, :value, :account_id, :credit_card_id, :place_id, :bill_id, :category_id])
    |> validate_required([:name, :date, :value])
  end
end
