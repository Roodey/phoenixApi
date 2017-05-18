defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json","json-api"]
  end

  scope "/api", PhoenixApi do
    pipe_through :api
    resources "session", SessionController, only: [:index]
  end
end
