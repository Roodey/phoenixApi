defmodule PhoenixApi.IdeaTest do
  use PhoenixApi.ModelCase

  alias PhoenixApi.Idea

  @valid_attrs %{created: %{day: 17, month: 4, year: 2010}, description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Idea.changeset(%Idea{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Idea.changeset(%Idea{}, @invalid_attrs)
    refute changeset.valid?
  end
end
