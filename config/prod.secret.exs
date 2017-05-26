use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :phoenixApi, PhoenixApi.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :phoenixApi, PhoenixApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATABASE_USERNAME"),
  password: System.get_env("DATABASE_PASSWORD"),
  database: "d8f6a4cmvl22s4",
  host: "ec2-23-23-228-115.compute-1.amazonaws.com",
  url: "postgres://obcddnqgwomfqc:f922e7aa96f823a40f580866bdf9c444e455e970d4fc9752795716ebed5b553b@ec2-23-23-228-115.compute-1.amazonaws.com:5432/d8f6a4cmvl22s4",

  pool_size: 20
