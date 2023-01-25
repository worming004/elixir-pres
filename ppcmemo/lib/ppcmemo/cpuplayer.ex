defmodule Ppcmemo.Cpuplayer do
  use GenServer
  require Logger

  @possible_result [:rock, :paper, :scissor]

  # start me with GenServer.start(Ppcmemo.Cpuplayer, {})
  def init(state) do
    {:ok, state}
  end

  def get_next_play(p) do
    GenServer.call(p, {:play})
  end

  # fire and forget
  def handle_cast(_input, state) do
    {:noreply, state}
  end

  def handle_call({:play}, _, state) do
    selected_play = Enum.random(@possible_result)

    Logger.info("selected #{selected_play}")
    {:reply, selected_play, state}
  end
end
