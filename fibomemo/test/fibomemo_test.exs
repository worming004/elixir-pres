defmodule FibomemoTest do
  use ExUnit.Case
  doctest Fibomemo
  
  test "fib 0 is 1" do
    assert Fibomemo.fib(0) == 1
  end


  test "fib 1 is 1" do
    assert Fibomemo.fib(1) == 1
  end

  test "fib 2 is 2" do
    assert Fibomemo.fib(2) == 2
  end

  test "fib 10 is 55" do
    assert Fibomemo.fib(10) == 89
  end
end
