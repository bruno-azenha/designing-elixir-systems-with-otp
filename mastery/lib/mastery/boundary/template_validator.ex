defmodule Mastery.Boundary.TemplateValidator do
  import Mastery.Boundary.Validator

  def errors(fields) when is_list(fields) do
    fields = Map.new(fields)

    []
    |> require(fields, :name, &validate_name/1)
    |> require(fields, :category, &validate_name/1)
    |> optional(fields, :instructions, &validate_instructions/1)
    |> require(fields, :raw, &validate_raw/1)
    |> require(fields, :generators, &validate_generators/1)
    |> require(fields, :checker, &validate_checker/1)
  end

  def errors(_fields), do: [{nil, "A keyword list of fields is required"}]

  def validate_name(name) when is_atom(name), do: :ok
  def validate_name(_name), do: {:error, "must be an atom"}

  def validate_instructions(instruction) when is_binary(instruction), do: :ok
  def validate_instructions(_instructions), do: {:error, "must be a binary"}

  def validate_raw(raw) when is_binary(raw) do
    check(String.match?(raw, ~r{\S}), {:error, "can't be blank"})
  end

  def validate_raw(_raw), do: {:error, "must be a string"}

  def validate_generators(generators) when is_map(generators) do
    generators
    |> Enum.map(&validate_generator/1)
    |> Enum.reject(&(&1 == :ok))
    |> case do
      [] -> :ok
      errors -> {:error, errors}
    end
  end

  def validate_generators(_generators), do: {:error, "must be a map"}

  def validate_generator({name, generator}) when is_atom(name) and is_list(generator) do
    check(generator != [], {:error, "can't be empty"})
  end

  def validate_generator({name, generator}) when is_atom(name) and is_function(generator, 0) do
    :ok
  end

  def validate_generator(_generator), do: {:error, "must be a string to list or function pair"}

  def validate_checker(checker) when is_function(checker, 2), do: :ok
  def validate_checker(_checker), do: {:error, "must be an arity 2 function"}
end
