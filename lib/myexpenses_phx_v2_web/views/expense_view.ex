defmodule MyexpensesPhxV2Web.ExpenseView do
  use MyexpensesPhxV2Web, :view

  def expense_name(name, nil, count), do: name
  def expense_name(name, number, count), do: "#{name} #{String.pad_leading(Integer.to_string(number), 2, "0")}/#{String.pad_leading(Integer.to_string(count), 2, "0")}"
end
