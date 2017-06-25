defmodule PhoenixApi.Idea do
  use PhoenixApi.Web, :model

  schema "ideas" do
    field :title, :string
    field :description, :string
    field :created, :string 

    has_many :profile, PhoenixApi.Profile

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :created])
    |> validate_required([:title, :description, :created])
  end
end
