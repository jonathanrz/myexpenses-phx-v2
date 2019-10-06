defmodule MyexpensesPhxV2.Data.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :balance]}

  schema "accounts" do
    field :balance, :integer
    field :name, :string
    belongs_to(:user, MyexpensesPhxV2.Data.User)
    has_many(:credit_cards, MyexpensesPhxV2.Data.CreditCard)

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :balance])
    |> validate_required([:name, :balance])
  end
end
