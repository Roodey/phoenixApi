defmodule PhoenixApi.Profile do
  use PhoenixApi.Web, :model

  schema "profiles" do
    field :name, :string

    belongs_to :user, PhoenixApi.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
