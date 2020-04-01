defmodule Clock do
  def start(f) do
    run(f, 0)
  end

  def run(f, count) do
    f.(count)
    new_count = Counter.Core.inc(count)
    :timer.sleep(1000)
    run(f, new_count)
  end
end
