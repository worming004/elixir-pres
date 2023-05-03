defmodule Fibomemo.Memo do
  # require Logger
  use Memoize

  defmemo fib(0) do
    1
  end

  defmemo fib(1) do
    1
  end

  defmemo fib(n) do
    # Logger.info("fib for #{n}")
    fib(n - 1) + fib(n - 2)
  end
end
