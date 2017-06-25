defmodule PhoenixApi.Repo.Migrations.CreateIdea do
  use Ecto.Migration

  def change do
    create table(:ideas) do
      add :title, :string
      add :description, :string
      add :created, :date

      timestamps()
    end

  end
end
