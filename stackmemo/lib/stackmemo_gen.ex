defmodule Stackmemo.Gen do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  def is_empty(p) do
    GenServer.call(p, {:is_empty})
  end

  def push(p, item) do
    GenServer.cast(p, {:push, item})
  end

  def pop(p) do
    GenServer.call(p, {:pop})
  end

  def handle_cast({:push, item}, state) do
    Logger.info("pushing #{state}")
    new_state = [item | state]
    {:noreply, new_state}
  end

  def handle_call({:is_empty}, _, state) do
    is_empty =
      case state do
        [] -> true
        _ -> false
      end

    {:reply, is_empty, state}
  end

  def handle_call({:pop}, _, state) do
    [item | new_state] = state
    Logger.info("popping")

    {:reply, item, new_state}
  end
end
