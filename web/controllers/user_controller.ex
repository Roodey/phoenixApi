defmodule PhoenixApi.UserController do
    use PhoenixApi.Web, :controller

    alias PhoenixApi.User

    plug Guardian.Plug.EnsureAuthenticated, handler: Phoenix.AuthErrorHandler

    def current(conn, _) do
        user = conn
        |> Guardian.Plug.current_resource

        conn
        |> render(PhoenixApi.UserView, "show.json", user: user)
    end
end