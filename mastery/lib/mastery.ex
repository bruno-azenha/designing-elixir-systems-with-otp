defmodule Mastery do
  alias Mastery.Core.Quiz
  alias Mastery.Boundary.QuizManager
  alias Mastery.Boundary.QuizSession
  alias Mastery.Boundary.Proctor
  alias Mastery.Boundary.QuizValidator
  alias Mastery.Boundary.TemplateValidator

  @persistence_fn Application.get_env(:mastery, :persistence_fn)

  def build_quiz(fields) do
    with :ok <- QuizValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:build_quiz, fields}) do
      :ok
    end
  end

  def add_template(title, fields) do
    with :ok <- TemplateValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:add_template, title, fields}) do
      :ok
    end
  end

  def take_quiz(title, email) do
    with %Quiz{} = quiz <- QuizManager.lookup_by_quiz_title(title),
         {:ok, _} <- QuizSession.take_quiz(quiz, email) do
      {title, email}
    end
  end

  def select_question(session) do
    QuizSession.select_question(session)
  end

  def answer_question(session, answer, persistence_fn \\ @persistence_fn) do
    QuizSession.answer_question(session, answer, persistence_fn)
  end

  def schedule_quiz(quiz, templates, start_at, end_at) do
    with :ok <- QuizValidator.errors(quiz),
         true <- Enum.all?(templates, &(:ok == TemplateValidator.errors(&1))),
         :ok <- Proctor.schedule_quiz(quiz, templates, start_at, end_at) do
      :ok
    end
  end
end
