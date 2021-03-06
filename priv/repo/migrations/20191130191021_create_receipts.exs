defmodule MyexpensesPhxV2.Repo.Migrations.CreateReceipts do
  use Ecto.Migration

  def change do
    create table(:receipts) do
      add :name, :string
      add :date, :date
      add :value, :integer
      add :confirmed, :boolean, default: false, null: false
      add :account_id, references(:accounts, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:receipts, [:account_id])
    create index(:receipts, [:user_id])
  end
end
