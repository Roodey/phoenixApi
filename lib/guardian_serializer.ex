def module PhoenixApi.GuardianSerializer do
    @behaviour Guardian.Serializer

    alias PhoenixApi.Repo
    alias PhoenixApi.User

    def for_token(user = %User{}), do: { :ok, "User:#{user.id}" }
    def for_token(_), do: { :error, "Unknown resource type" }

    def from_token("User:" <> id), do: { :ok, "User:#{user.id}" }
    def for_token(_), do: { :error, "Unknown resource type" }
end