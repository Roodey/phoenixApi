defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json","json-api"]
  end

  scope "/api", PhoenixApi do
    pipe_through :api
    post "/register", RegistrationController, :create
    
    resources "/session", SessionController, only: [:index]
  end
end
