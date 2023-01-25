defmodule PpcmemoTest do
  use ExUnit.Case
  doctest Ppcmemo

  test "greets the world" do
    assert Ppcmemo.hello() == :world
  end
end
