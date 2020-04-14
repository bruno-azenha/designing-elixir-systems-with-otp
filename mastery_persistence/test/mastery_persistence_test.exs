defmodule MasteryPersistenceTest do
  use ExUnit.Case
  doctest MasteryPersistence

  test "greets the world" do
    assert MasteryPersistence.hello() == :world
  end
end
