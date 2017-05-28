defmodule PhoenixApi.AuthErrorHandler do
    use PhoenixApi.Web, :controller

    def unauthenticated(conn,params) do
        conn
        |> put_status(401)
        |> render(PhoenixApi.ErrorView, "401.json")
    end

    def unauthorized(conn, params) do
        conn
        |> put_status(403)
        |> render(PhoenixApi.ErrorView, "403.json")
    end
end