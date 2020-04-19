defmodule MyexpensesPhxV2.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :email, :first_name, :last_name]}

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :provider, :string
    field :token, :string

    has_many(:accounts, MyexpensesPhxV2.Data.Account)
    has_many(:credit_cards, MyexpensesPhxV2.Data.CreditCard)
    has_many(:bills, MyexpensesPhxV2.Data.Bill)
    has_many(:places, MyexpensesPhxV2.Data.Place)
    has_many(:categories, MyexpensesPhxV2.Data.Category)
    has_many(:receipts, MyexpensesPhxV2.Data.Receipt)
    has_many(:expenses, MyexpensesPhxV2.Data.Expense)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :provider, :token])
    |> validate_required([:first_name, :last_name, :email, :provider, :token])
  end
end
