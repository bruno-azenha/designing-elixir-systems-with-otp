defmodule ProctorTest do
  use ExUnit.Case

  alias Mastery.Examples.Math
  alias Mastery.Boundary.QuizSession

  @moduletag capture_log: true

  test "quizzes can be scheduled" do
    quiz = Math.quiz_fields() |> Map.put(:title, :timed_addition)
    now = DateTime.utc_now()
    email = "student@example.com"

    assert :ok ==
             Mastery.schedule_quiz(
               quiz,
               [Math.template_fields()],
               DateTime.add(now, 50, :millisecond),
               DateTime.add(now, 100, :millisecond),
               self()
             )

    refute Mastery.take_quiz(quiz.title, email)
    assert_receive({:started, :timed_addition})
    assert Mastery.take_quiz(quiz.title, email)
    assert_receive({:stopped, :timed_addition})
    assert [] == QuizSession.active_sessions_for(quiz.title)
  end
end
