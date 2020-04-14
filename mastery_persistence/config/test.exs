use Mix.Config

config :mastery_persistence, MasteryPersistence.Repo,
  database: "mastery_test",
  hostname: "localhost",
  username: "postgres",
  password: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox
