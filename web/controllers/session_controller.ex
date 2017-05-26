defmodule PhoenixApi.SessionController do
  use PhoenixApi.Web, :controller

  def index(conn,_params) do

  conn |> 
  json(%{status: "Ok"})
  end
end
