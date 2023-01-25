defmodule Ppcmemo.Game do
  alias Ppcmemo.Cpuplayer
  use GenServer

  def init(_state = {p1, p2}) do
    {:ok, {p1, p2, 0, 0}}
  end

  def play(p) do
    GenServer.call(p, {:play})
  end

  # fire and forget
  def handle_cast(_input, {player1, player2, s1, s2}) do
    {:noreply, {player1, player2, s1, s2}}
  end

  def handle_call({:play}, _from, {p1, p2, s1, s2}) do
    p1play = Cpuplayer.get_next_play(p1)
    p2play = Cpuplayer.get_next_play(p2)

    {s1, s2} =
      case win(p1play, p2play) do
        :p1 -> {s1 + 1, s2}
        :p2 -> {s1, s2 + 1}
        :nobody -> {s1, s2}
      end

    {:reply, {s1, s2}, {p1, p2, s1, s2}}
  end

  defp win(:rock, :paper), do: :p2
  defp win(:rock, :scissor), do: :p1
  defp win(:scissor, :rock), do: :p2
  defp win(:scissor, :paper), do: :p1
  defp win(:paper, :rock), do: :p1
  defp win(:paper, :scissor), do: :p2

  defp win(x, y) when x == y do
    :nobody
  end
end
