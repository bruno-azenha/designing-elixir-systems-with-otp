defmodule Mastery.Application do
  @moduledoc false

  alias Mastery.Boundary.QuizManager

  use Application

  def start(_type, _args) do
    children = [
      {QuizManager, [name: QuizManager]},
      {Registry, [name: Mastery.Registry.QuizSession, keys: :unique]},
      {Mastery.Boundary.Proctor, [name: Mastery.Boundary.Proctor]},
      {DynamicSupervisor, [name: Mastery.Supervisor.QuizSession, strategy: :one_for_one]}
    ]

    opts = [strategy: :one_for_one, name: Mastery.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
