defmodule PhoenixApi.IdeaView do
    use PhoenixApi.Web, :view

    def render("index.json", %{ideas: ideas}) do
        %{data: render_many(ideas, PhoenixApi.IdeaView, "idea.json")}
    end

    def render("show.json", %{idea: idea}) do
        %{data: render_one(idea, PhoenixApi.IdeaView, "idea.json")}
    end

    def render("idea.json", %{idea: idea}) do
        %{
            "type": "idea",
            "id": idea.id,
            "attributes": %{
                "title": idea.title,
                "description": idea.description,
                "created": idea.created
            }
        }
    end

end