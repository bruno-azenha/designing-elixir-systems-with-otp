use Mix.Config

config :mastery_persistence,
  ecto_repos: [MasteryPersistence.Repo]

config :logger, level: :info

import_config "#{Mix.env()}.exs"
