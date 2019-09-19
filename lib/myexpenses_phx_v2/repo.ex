defmodule MyexpensesPhxV2.Repo do
  use Ecto.Repo,
    otp_app: :myexpenses_phx_v2,
    adapter: Ecto.Adapters.Postgres
end
