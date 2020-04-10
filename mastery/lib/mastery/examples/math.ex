defmodule Mastery.Examples.Math do
  alias Mastery.Core.Quiz

  def template_fields() do
    [
      name: :single_digit_addition,
      category: :addition,
      instructions: "Add the numbers",
      raw: "<%= @left %> + <%= @right %>",
      generators: addition_generators(),
      checker: &addition_cheker/2
    ]
  end

  def addition_cheker(substitutions, answer) do
    left = Keyword.fetch!(substitutions, :left)
    right = Keyword.fetch!(substitutions, :right)
    to_string(left + right) == String.trim(answer)
  end

  def addition_generators() do
    %{left: Enum.to_list(0..9), right: Enum.to_list(0..9)}
  end

  def quiz_fields() do
    %{mastery: 2, title: :simple_addition}
  end

  def quiz() do
    quiz_fields()
    |> Quiz.new()
    |> Quiz.add_template(template_fields())
  end
end
