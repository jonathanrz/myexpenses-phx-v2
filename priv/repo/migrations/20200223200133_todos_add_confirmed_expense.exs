defmodule MyexpensesPhxV2.Repo.Migrations.TodosAddConfirmedExpense do
  use Ecto.Migration

  def change do
    alter table("expenses") do
      add :confirmed, :boolean, default: false
    end
  end
end
