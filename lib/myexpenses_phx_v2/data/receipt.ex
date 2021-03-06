defmodule MyexpensesPhxV2.Data.Receipt do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :date, :confirmed, :value, :account]}

  schema "receipts" do
    field :confirmed, :boolean, default: false
    field :date, :date
    field :name, :string
    field :value, :integer
    belongs_to(:account, MyexpensesPhxV2.Data.Account)
    belongs_to(:user, MyexpensesPhxV2.User)

    timestamps()
  end

  @doc false
  def changeset(receipt, attrs) do
    receipt
    |> cast(attrs, [:name, :date, :value, :confirmed, :account_id])
    |> validate_required([:name, :date, :value, :confirmed, :account_id])
  end
end
