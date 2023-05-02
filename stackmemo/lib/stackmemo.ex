defmodule Stackmemo do
  def init() do
    {:ok, []}
  end

  def is_empty(stack) do
    case stack do
      [] -> true
      _ -> false
    end
  end

  def push(stack, item) do
    {:ok, [item | stack]}
  end

  def pop(stack) do
    [item | new_stack] = stack
    {:ok, item, new_stack}
  end
end
