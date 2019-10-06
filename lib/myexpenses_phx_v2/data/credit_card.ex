defmodule MyexpensesPhxV2.Data.CreditCard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_cards" do
    field :name, :string
    field :account_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(credit_card, attrs) do
    credit_card
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
