defmodule Powit.CMS.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :message, :string
    field :post_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:message])
    |> validate_required([:message])
  end
end
