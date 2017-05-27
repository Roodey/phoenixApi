defmodule PhoenixApi.RegistrationController do
    use PhoenixApi.Web, :controller

    alias PhoenixApi.User

    def create(conn, %{"data" => %{"type" => "users",
        "attributes" => %{"email" => email,
                          "password" => password,
                          "password_confirmation" => password_confirmation}}}) do
        changeset = User.changeset %User{}, %{
            email: email,
            password_confirmation: password_confirmation,
            password: password
        }

        case Repo.insert changeset do
            {:ok, user} ->
                conn 
                |> put_status(:created)
                |> render(PhoenixApi.UserView, "show.json", user: user)
                {:error, changeset} ->
                    conn
                    |> put_status(:unprocesable_entity)
                    |> render(PhoenixApi.ChangesetView, "error.json", changeset: changeset)
        end
    end

end