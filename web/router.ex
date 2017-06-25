defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json","json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

#The authentication layer, handles registration and token hand outs.
  scope "/api", PhoenixApi do
    pipe_through :api
    post "/register", RegistrationController, :create
    
    post "/token", SessionController, :create, as: :login
  end

#The application's outer layer, still authenticated but not within the app.
  scope "/api", PhoenixApi do
    pipe_through :api_auth
    get "/user/current", UserController, :current

    get "/ideas", IdeaController, :all
    post "/ideas", IdeaController, :create
  end


end
