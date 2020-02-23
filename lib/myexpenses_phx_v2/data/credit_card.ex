defmodule MyexpensesPhxV2.Data.CreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_cards" do
    field :name, :string
    belongs_to(:account, MyexpensesPhxV2.Data.Account)
    belongs_to(:user, MyexpensesPhxV2.User)

    timestamps()
  end

  @doc false
  def changeset(credit_card, attrs) do
    credit_card
    |> cast(attrs, [:name, :account_id])
    |> validate_required([:name, :account_id])
  end
end
