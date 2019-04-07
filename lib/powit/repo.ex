defmodule Powit.Repo do
  use Ecto.Repo,
    otp_app: :powit,
    adapter: Ecto.Adapters.Postgres
end
