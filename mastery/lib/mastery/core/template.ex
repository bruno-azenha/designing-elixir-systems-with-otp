defmodule Mastery.Core.Template do
  defstruct ~w[name category instructions raw compiled generators checker]a

  def new(fields) do
    raw = Keyword.fetch!(fields, :raw)
    struct!(__MODULE__, Keyword.put(fields, :compiled, EEx.compile_string(raw)))
  end
end
