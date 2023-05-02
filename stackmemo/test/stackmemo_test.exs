defmodule StackmemoTest do
  use ExUnit.Case
  doctest Stackmemo

  test "should be initialized with empty list" do
    {:ok, stack} = Stackmemo.init()
    assert Stackmemo.is_empty(stack)
  end

  test "should add item" do
    {:ok, stack} = Stackmemo.init()

    assert {:ok, _} =
             stack
             |> Stackmemo.push("foo")
  end

  test "shoud pop an item" do
    {:ok, init_stack} = Stackmemo.init()

    {:ok, stack} =
      init_stack
      |> Stackmemo.push("foo")

    assert {:ok, item, final_stack} =
             stack
             |> Stackmemo.pop()

    assert item == "foo"
    assert init_stack == final_stack
  end

  test "representative list" do
    foo = []
    foo = ["bar"]
    assert foo == ["bar"]
    foo = ["toto" | foo]
    bar = foo
    assert bar == ["toto", "bar"]
    assert foo == ["toto", "bar"]
    foo = ["dudule" | foo]
    assert foo == ["dudule", "toto", "bar"]
    assert ["dudule" | ["toto", "bar"]] = foo
    assert ["dudule" | ["toto", "bar"]] = ["dudule", "toto", "bar"]
    assert bar == ["toto", "bar"]
  end
end
