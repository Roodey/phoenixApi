defmodule PhoenixApi.IdeaController do
    use PhoenixApi.Web, :controller

    alias PhoenixApi.Idea

    def create(conn, 
        %{"data" => %{"type" => "ideas",
        "attributes" => %{"title" => title,
                            "description" => description,
                            "created" => created}}}) do

        changeset = Idea.changeset %Idea{}, %{
                            title: title,
                            description: description,
                            created: created 
            
        }

        case Repo.insert changeset do
            {:ok, idea} -> 
                conn
                |> put_status(:created)
                |> render(PhoenixApi.IdeaView, "show.json", idea: idea)
            {:error, changeset} ->
                conn
                |> put_status(:unprocessable_entity)
                |> render(PhoenixApi.ChangesetView, "error.json", changeset: changeset)
        end
    end

    def all(conn, _params ) do
        conn
        ideas =  Repo.all(Idea)
        render(conn, "index.json", ideas: ideas)
    end
          
    
end