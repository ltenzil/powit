defmodule Powit.CMS.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :name, :string
    belongs_to :user, Powit.Users.User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :body, :user_id])
    |> validate_required([:name, :body, :user_id])
  end
end
