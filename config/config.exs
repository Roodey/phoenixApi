# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenixApi,
  ecto_repos: [PhoenixApi.Repo]

# Configures the endpoint
config :phoenixApi, PhoenixApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zGJNxq5rOZt+w+ZUYEBIz1qDOl/a2+iN/004TzXQFYqLibub9vzwLNtO+3X77+g4",
  render_errors: [view: PhoenixApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
	"json-api": Poison

config :plug, :mimes, %{
	"applicationvnd.api+json" => ["json-api"]
}

# Configures Guardian Authentication
config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "PhoenixApi",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: System.get_env("GUARDIAN_SECRET") || "YVIMkwNJBpN4k3PG4qcIg0NnItLBWq2MqaBMql86rhvKjvkFsiaK5cOFVkET7heB" ,
  serializer: PhoenixApi.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
