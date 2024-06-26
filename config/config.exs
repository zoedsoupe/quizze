# General application configuration
import Config

# Configures the endpoint
config :quizze, QuizzeWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [formats: [html: QuizzeWeb.ErrorHTML], layout: false],
  pubsub_server: Quizze.PubSub,
  live_view: [signing_salt: "7ABvucZX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
