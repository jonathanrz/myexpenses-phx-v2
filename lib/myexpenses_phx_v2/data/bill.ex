defmodule MyexpensesPhxV2.Data.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :init_date, :end_date, :value, :due_day]}

  schema "bills" do
    field :due_day, :integer
    field :end_date, :date
    field :init_date, :date
    field :name, :string
    field :value, :integer
    belongs_to(:user, MyexpensesPhxV2.User)

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:name, :init_date, :end_date, :value, :due_day])
    |> validate_required([:name, :init_date, :end_date, :value, :due_day])
  end
end
