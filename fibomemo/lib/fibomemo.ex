defmodule Fibomemo do
  # require Logger

  def fib(0) do
    1
  end

  def fib(1) do
    1
  end

  def fib(n) do
    # Logger.info("fib for #{n}")
    fib(n - 1) + fib(n - 2)
  end
end
