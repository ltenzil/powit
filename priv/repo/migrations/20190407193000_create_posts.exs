defmodule Powit.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string,  null: false
      add :body, :text
      add :user_id, references(:users)

      timestamps()
    end

    create index(:posts, [:user_id])
  end
end
